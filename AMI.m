clear;

bits = [1,0,0,1,1,1,0,1,0,1,1,1];

bit_rate=1;
voltage=5;
tmp=voltage;
sign = -1;
mrk = 1;
voltage = sign*voltage;

for i = 1:length(bits)
    if(bits(i)==0)
        y_level(i) = 0;
    else 
        y_level(i) = -voltage;
        voltage=y_level(i);
    end
end

voltage=tmp;
Time=length(bits)/bit_rate; 
frequency = 1000;
time = 0:1/frequency:Time;
x = 1;

for i = 1:length(time)
    y_value(i)= y_level(x);
    if time(i)*bit_rate>=x
        x= x+1;
    end
end
     

plot(time,y_value);
axis([0 Time -voltage-2 voltage+2]);


% demodulation

i=1;
in=1;
for j=1:length(time)
  tmp = y_value(j)/voltage;
  if time(j)*bit_rate>=i 
      if tmp==0
        ans_bits(in)=0;
      else 
        ans_bits(in)=1;
      end 
      i=i+1;
  end
 end


disp('Demodulation : ')
disp(ans_bits)


