clear all
clc

%% output image of bit plane slicing: dividing the image into binary layers based on specified intensity thresholds.
posimage = imread('chest_x-ray2.jpg');
posimage_a = double(posimage);
posimage_b = double(posimage);

posimage_a = posimage;
posimage_b = double(posimage);
[r,c] = size(posimage_a);

%  Slicing Process: if the intensity value falls within a certain range (between 50 and 150): retains the pixel's intensity
for i =1:r
    for j = 1:c
        if (posimage_a(i,j) > 50) && (posimage_a(i,j) < 150) %the first threshold value is 50, while the second threshold value is 150
            posimage_a(i,j) = posimage(i,j);
            posimage_b(i,j) = 255; % sets the corresponding pixel in posimage_b to 255 (white).
        else
            posimage_a(i,j) = 0; % Otherwise, it sets both pixels to 0 (black).
            posimage_b(i,j) = 0;
        end
    end
end

figure(1)
subplot(1,3,1);
imshow(posimage)
title('Original image'); 

subplot(1,3,2);
imshow(posimage_a,[]);
title('slicing with background')

subplot(1,3,3);
imshow(posimage_b,[]);
title('slicing without background') % background removed


figure(2)
r = 0:255;
subplot(1,2,1)
s1 = r;
s1(50:150) = 255;
plot(r,s1)
title('function of slicing with background');
xlabel('Input Intensity Level,r');
ylabel('Output Intensity Level,s');

subplot(1,2,2)
s = ones(size(r));
s(50:150) = 255;
plot(r,s)
title('function of slicing without background');
xlabel('Input Intensity Level,r');
ylabel('Output Intensity Level,s');

%Overall, this code demonstrates the application of bit-plane slicing as a method for segmenting images based on their intensity levels, 
% providing insights into the distribution of intensity values within the image.















