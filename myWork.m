close all 

IMaa = imread('Img1.png');

% Corresponding ground truth binary images
IM1 = imread('Img1_GT.png'); 
% Binarizes the ground truth images using a threshold of 0 and stores the results in variables BE1 
BE1 = imbinarize(IM1,0); 

figure('Name', 'Input image vs binary image for GT')
imshowpair(IM1,BE1,'montage'); % Displays original image and its binary equivalent side by side.

%% Pre-processing the input image
IMa = imadjustn(IMaa); % adjusts the intensity values of the images to enhance their contrast.

figure('Name', 'Pre-processed image')
imshowpair(IMaa,IMa,'montage');

%% Threshold Localization
IMa = im2double(IMa);

figure('Name', 'Threshold Localization')
[value,IMa] = image_BGT(IMa); % retrieves the threshold value (value) and the thresholded image (IMa).
Toutput_image1 = imbinarize(IMa,value); % Binarizes the pre-processed image IMa using the threshold value obtained from image_BGT.
imshowpair(IMa,Toutput_image1,'montage'); % Displays a montage of the pre-processed image IMa and the thresholded binary image Toutput_image1.
similarity1_1 = jaccard(Toutput_image1,BE1); % Computes the Jaccard similarity coefficient between Toutput_image1 and the ground truth binary image BE1.

%% Marr-Hildreth(MH) edge detector detector for edge detection
BE1_1 = rgb2gray((im2double(BE1))); % Converts the ground truth binary images BE1 to grayscale and doubles their precision.

figure('Name', 'Marr-Hilldreth Edge Detection')
[IMa,S1_1,S1_2] = image_MHEDM(IMa);
imshowpair(S1_1,S1_2,'montage');
similarity2_1 = jaccard(S1_1,round(BE1_1));
similarity2_2 = jaccard(S1_2,round(BE1_1));

%% Clustering 
figure('Name', 'Clustering')
[IMa,S1,Sa] = Clustering(IMa);
imshow(S1,[]);
similarity3_1 = jaccard(S1,round(BE1_1));
similarity3_2 = jaccard(Sa,round(BE1_1));

%% Clustering in cut
figure('Name', 'Clustering Output')
imshow(Sa,[]);
