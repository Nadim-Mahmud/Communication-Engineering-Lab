clear


bits = [0,1,1,0,1,0,1,0,1,1,1,1];

% for i = 1:length(bits)
%     if(bits(i)==1) 
%         amplitude(i) = -2;
%     else 
%         amplitude(i) = 2;
%     end
%     
% end

prompt = 'What is voltage ?\n';

voltage = input(prompt);



bitrate = 1;
Time=bitrate*length(bits)  

sampling_frequency = 150;

time = 0:bitrate/sampling_frequency:Time;

x = 1;

for i = 1:length(time)
    %y_value(i)= amplitude(x);
    y_value(i) = voltage;
    if(bits(x)==1)
        y_value(i) = -voltage;
    end
    
    if time(i)>=x
        x= x+1;
    end
end
     

plot(time,y_value);
axis([0 Time -voltage-2 voltage+2]);


% demodulation
x = 1;

for i = 1:length(time)
    if time(i)>x
        x = x + 1;
        ans_bits(x) = 1;
        if(y_value(i)>0)
            ans_bits(x) = 0;
        end
        %ans_bits(x) = y_value(i);
    end
end

disp('Demodulation : ')
disp(ans_bits)


