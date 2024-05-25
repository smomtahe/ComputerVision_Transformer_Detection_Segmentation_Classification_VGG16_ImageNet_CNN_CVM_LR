function [IMx,S1,S2] = image_MHEDM(IMx)
%% calling
IMx = rgb2gray(im2double(IMx));
S1 = edge(IMx,'log'); %  Laplacian of Gaussian (LoG) method (Marr-Hildreth method) for edge detection.
S2 = edge(IMx,'canny'); % Canny edge detection 
S1 = im2double(S1);
S2 = im2double(S2);
end

%  edge detection algorithms to the input grayscale image IMx using the Marr-Hildreth and Canny methods