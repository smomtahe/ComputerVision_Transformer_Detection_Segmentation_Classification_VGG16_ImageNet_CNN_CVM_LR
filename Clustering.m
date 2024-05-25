function [IMx,S, Sa] = Clustering(IMx) % k-means clustering
IMx_data = reshape(IMx,[],1);
IMx_data = double(IMx_data);
%Performs k-means clustering on the 1D image data with k = 3, meaning it divides the data into 3 clusters. It returns the cluster indices idx indicating which cluster each pixel belongs to, and the cluster centroids c.
[idx c] = kmeans(IMx_data,3); 
IM_idx = reshape(idx,size(IMx)); % Reshapes the cluster indices back into the original image shape, so each pixel in the image is assigned a cluster index.
S = IM_idx;
Sa = S == 3; % Creates a binary mask where pixels belonging to cluster 3 are set to 1, and pixels belonging to other clusters are set to 0.
Sa = im2double(Sa); % Converts the binary mask to double precision for consistency.

end
    
% clusters the input image into 3 clusters using k-means clustering and returns the clustered image along with a binary image highlighting pixels belonging to cluster 3.
% partition the input image's pixels into three clusters.
%The function returns three variables:

%IMx: The original input image.
%S: The clustered image where each pixel is assigned a cluster index.
%Sa: A binary mask highlighting pixels belonging to cluster 3.






