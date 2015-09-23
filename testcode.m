clc;
clear all;
close all;

[File_Name, Path_Name] = uigetfile('PATHNAME');
I=imread([Path_Name,File_Name]);

alpha=2;
w_size=0;
%Condition to check size of window and alpha
while (mod(w_size,2)==0 && w_size<=0 && alpha>1 || alpha<0)
    w_size=input('Size of the window : ');
    alpha=input('Value of alpha : ');
    if(mod(w_size,2)==0)
        disp('Please choose a mask of odd length i.e. 3, 5, 7, etc ..')
    end
    if(alpha>1 || alpha<0)
        disp('Please choose a value of alpha in [0,1]')
    end
end

I_gradInvFilt = GradientInverseFilter( I,alpha,w_size );

figure;imshow(uint8(I),[]);title('Original Image');
figure;imshow(uint8(I_gradInvFilt),[]);title('Gradient inverse filtered Image');
figure;imshow(uint8(abs(I_gradInvFilt-double(I))));title('Difference image');
