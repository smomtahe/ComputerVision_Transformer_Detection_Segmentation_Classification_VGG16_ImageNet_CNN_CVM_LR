clear all
close all

%% output power image of image
posimage = imread('chest_x-ray2.jpg');

posimage = im2double(posimage); % convert image to double precision format. This is necessary for performing mathematical operations on the image data.
[m n] = size(posimage); %  Determines the size of the image and assigns the number of rows to m and the number of columns to n
c = 2; % Sets the value of the coefficient c used in the power-law transformation. This parameter controls the overall brightness of the output image.
%g = 0.6;
g = 1.8; % gamma parameter used in the power-law transformation. This parameter controls the contrast of the output image.

    for p = 1:m % row
        for q = 1:n % column
            powerimage(p,q) = c .*posimage(p,q).^g; % Calculates the pixel value for the power-law transformed image based on the formula s = c * r^g, where r is the input intensity value at position (p,q) in the original image.
        end
    end
    figure(1)
    subplot(1,2,1)
    imshow(posimage);
    title('original image');
    subplot(1,2,2)
    imshow(powerimage);
    title('power-law image')

 %% transformation function
 figure(2)
 r = 0:255; % Creates an array of intensity values ranging from 0 to 255.
 Y = c*(r.^(g)); % Computes the output intensity values Y based on the power-law transformation equation s = c * r^g.
 a = 256/Y(256); % Calculates a scaling factor a to ensure that the maximum intensity value of the output image is 255.
 s = a*Y; % Scales the intensity values to ensure that the maximum value is 255.
plot(r,s,'r-o') % Plots the transformation function s as a function of input intensity levels r.
title('Plot Equation s = c*r^g');
xlabel('Input Intensity Level,r');
ylabel('Output Intensity Level,s');
hold off