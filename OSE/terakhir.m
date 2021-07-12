clc

%this is the last result of the optimization

%load fval.mat
%for the finding the max value.
output_final=fval(:,1);
input_1=x(:,1);
input_2=x(:,2);

    output_max=2953.78;
    output_min=2361.17;
    input_1_max=25.35;
    input_1_min=23.3054;
    input_2_max=46.3266 ;
    input_2_min=36.7997 ;
    output_delta=output_max-output_min;
    input_1_delta=input_1_max-input_1_min;
    input_2_delta=input_2_max-input_2_min;
finaloutput =((((output_final(1,:)+1)*(output_delta))/2)+output_min);
finalinput_1 =((((input_1(1,:)+1)*(input_1_delta))/2)+input_1_min);
finalinput_2 =((((input_2(1,:)+1)*(input_2_delta))/2)+input_2_min);

final = [finaloutput finalinput_1 finalinput_2]
%scatter(final,'r.')
%title('HASIL LANGSUNG DARI GAOTIMSET')