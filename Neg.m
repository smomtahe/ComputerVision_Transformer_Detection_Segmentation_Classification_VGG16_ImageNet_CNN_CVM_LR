clear all
close all

%% output negative of image
posimage = imread('chest_x-ray2.jpg');
negimage = 255 - posimage; % funtion to get negative image by subtracting each pixel intensity value from 255 (maximum intensity level). It is performed element-wise on the entire image matrix.
posimage = negimage;
% negative of each pixel in the posimage matrix is calculated and stored in the corresponding pixel position of the negimage matrix.
for row = 1:size(posimage,1)
    for col = 1:size(posimage,2)
        negimage(row,col,:) = 255 - posimage(row,col,:);
    end
end

figure(1)
imshow([posimage,negimage]); 
title('original image && negative image')

figure(2)
r = 0:255; % input intensity levels 
s = 255 - r; % Calculates the corresponding output intensity levels s: represents the mapping from input to output intensity levels for the negative transformation.
plot(r,s) % plots the input intensity levels (r) against the output intensity levels (s).
title('Plot Equation s = 255 - r');
xlabel('Input Intensity Level,r');
ylabel('Output Intensity Level,s');
