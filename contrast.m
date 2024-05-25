%% common contrast-stretching output of image
posimage = imread('chest_x-ray2.jpg');
i = posimage(:,:,1); % Extracts the intensity values from the red channel of the image. This is typically done to convert the image to grayscale if it's in color.
r1 = min(i); % inimum intensity value in the image.
rmin = min(r1);

r1 = max(i);
rmax = max(r1);

m = 255/(rmax-rmin); % Computes the slope of the linear transformation function for contrast stretching.
b = 255 - m*rmax; % Computes the intercept of the linear transformation function.
% for i = 1:256
%     if i >= rmin && i <= rmax
%         j(i) = (i - rmin)*m;
%     elseif i < rmin
%         j(i) = 0;
%     else
%         j(i) = 255;
%     end
% end
 i0 = 0:1; % array of intensity values ranging from 0 to 1.
 j0 = 47*i0; % transformation function for contrast stretching: stretches the intensity values linearly.

j = m*i + b; % Applies the contrast stretching transformation to the input image.

figure(1)
subplot(1,2,1)
imshow(posimage);
title('original image');
subplot(1,2,2)
imshow(j);
title('contrast streching image')

% transformation fucntion plot
figure(2)
plot(i,j)
hold on
plot(i0,j0)
line([209 256],[256 256]);
hold off
title('Plot Equation s = m*i+b');
xlabel('Input Intensity Level,r');
ylabel('Output Intensity Level,s');

