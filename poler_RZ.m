clear


bits = [0,1,1,0,1,0,1,0,1,1,1,1];

prompt = 'Input the voltage ?\n'

bitrate = 1;
Time=bitrate*length(bits)  ;

sampling_frequency = 150;

time = 0:bitrate/sampling_frequency:Time;

total_bit = 12;

for i = 1:length(time)
       
    y_value(i)= var;
    
    if()
    
    if time(i)>=x
        x = x+1;
        if (x<=total_bit)
            if(bits(x)==1)
                 var = -1*var;
            end
        end
        
    end
end

plot(time,y_value);
axis([0 Time -4 6]);


% demodulation
x = 1;

ans_bits(1) = 0;
if(y_value(1)<0) ans_bits(1) = 1;
end
var = y_value(1);
  
for i = 1:length(time)
    if time(i)>x
        x = x + 1;
        ans_bits(x) = 0;
        if(y_value(i)~= var)
            ans_bits(x) = 1;
            var = y_value(i);
        end
        %ans_bits(x) = y_value(i);
    end
end

disp('Demodulation : ')
disp(ans_bits)


