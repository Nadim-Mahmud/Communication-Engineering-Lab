clear;

bits = [0,1,1,0,1,0,1,0,1,0,0,1];

bit_rate=1;
voltage=4;
sign = 1;

tmp=voltage;
in = 1;
voltage = voltage*sign;

for i = 1:length(bits)
    if(bits(i)==0)
        y_level(in) = voltage;
        y_level(in+1) = 0;
    else 
        y_level(in) = -voltage;
        y_level(in+1) = 0;
    end
    in = in + 2;
end

voltage=tmp;
Time=length(bits)/bit_rate; 
sampling_frequency = 1000;
sampling_period = 1/sampling_frequency;
time = 0:sampling_period:Time;

x = 1;

for i = 1:length(time)
    y_value(i)= y_level(x);
    if time(i)*bit_rate*2>=x
        x= x+1;
    end
end
     

plot(time,y_value);
grid on;
axis([0 Time -voltage-2 voltage+2]);


% demodulation

i=1;
in=1;
st=1;
tmp=1*sign;

for j=1:length(time)
  dm = y_value(j)/voltage;
  if time(j)*bit_rate*2>=in
      if mod(in,2)==1
          if dm ==tmp
            ans_bits(st)=0;
          else 
            ans_bits(st)=1;
          end 
          st = st + 1;
      end
      in= in+1;
  end
 end

 disp('Demodulation : ')
 disp(ans_bits)


