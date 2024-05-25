clear all
clc
%% histogram matching or specification: modify the intensity distribution of an image to match a specified distribution.
 posimage_1 = imread('chest_x-ray2.jpg');
 posimage_2 = imread('chest_x-ray3.jpg');
 a = zeros(256,1,'uint8'); % store the transformation mapping
 hist1 = imhist(posimage_1);
 hist2 = imhist(posimage_2);
 %Histograms of the images are computed, and cumulative distribution functions (CDFs) are calculated based on the histograms.
 cdf1 = cumsum(hist1)/numel(posimage_1);
 cdf2 = cumsum(hist2)/numel(posimage_2);
 
 for i = 1:256 %iterates over each intensity level (from 1 to 256): finds the closest match between the CDFs of the two images
     diff = abs(cdf1(i)-cdf2); % computes absolute difference between the CDFs at each intensity level 
     [~,ind] = min(diff); % selects the intensity level from the second image that minimizes this difference. 
     a(i) = ind - 1; % selected intensity levels form the transformation mapping 'a'.
 end
 % Using the transformation mapping, the code applies histogram matching to the first input image. It maps each pixel intensity value in 'posimage_1' to the corresponding intensity value in the second image, creating a matched image.
 matched_image = a(double(posimage_1 + 1));
 
figure(1) % displays the original 'chest_x-ray2' image, the original 'chest_x-ray3' image, and the specified image after histogram matching.
subplot(1,3,1)
imshow(posimage_1);
title('chest_x-ray2')

subplot(1,3,2)
imshow(posimage_2);
title('chest_x-ray3');
subplot(1,3,3)
imshow(matched_image);
title('specified image');

%Figure 2 shows the transformation functions (CDFs) for both input images, with the x-axis representing the input intensity levels and the y-axis representing the output intensity levels. The plot illustrates the transformation process from the input image to the specified image.
figure(2)
x = 0:255;
plot(x,255*cdf1,'o');
hold on
plot(x,255*cdf2,'-');
hold off
title('transformation function cdf')
xlabel('Input Intensity Level,r');
ylabel('Output Intensity Level,s');    
legend('cdf1','cdf2');

% Overall, this code effectively performs histogram matching between two chest X-ray images, ensuring that their intensity distributions closely match each other. The resulting specified image enhances the visibility of structures and features present in both input images.
% matches 'chest_x-ray2.jpg' to 'chest_x-ray3.jpg': modifies the intensity distribution of 'chest_x-ray2.jpg' to match the intensity distribution of 'chest_x-ray3.jpg'. 
% transformation mapping is applied to 'chest_x-ray2.jpg' to generate the specified image that resembles 'chest_x-ray3.jpg'.

%A specified image, in the context of histogram matching or specification, refers to the image whose intensity distribution serves as a target or reference for modifying another image. In the code provided, the specified image is the one to which the intensity distribution of the first image is matched or specified.
%Histogram equalization is a method used to adjust the contrast of an image by modifying the intensity distribution across the entire range of pixel values. It aims to spread out the intensity values such that the histogram of the equalized image is more evenly distributed, resulting in enhanced contrast and improved visual appearance.


% Perform histogram equalization on chest_x-ray2.jpg
equalized_image = histeq(posimage_1);

% Display the equalized image
figure(3);
subplot(1, 2, 1);
imshow(posimage_1);
title('Original chest-x-ray2');

subplot(1, 2, 2);
imshow(equalized_image);
title('Equalized chest-x-ray2');








 
        
        
        
        
        




