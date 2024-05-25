function [value,IMx] = image_BGT(IMx) % calculates the optimal threshold value for binarizing an input grayscale image IMx
[m,n] = size(IMx); % dimensions of the input image
IMx_max = max(IMx(:)); % maximum and minimum intensity values in the image IMx.
IMx_min = min(IMx(:)); 
T0 = 0.5*((IMx_max) + (IMx_min)); % Initializes the threshold value T0 as the midpoint between the maximum and minimum intensity values.
R1 = 1; % Initializes counters for regions R1 and R2
R2 = 1;
 while true
    for i = 1:m
        for j = 1:n           
            if IMx(i,j)>T0
                G1(R1) = IMx(i,j); %% region R1
                R1 = R1 + 1;
            else
                G2(R2) = IMx(i,j); %% region R2
                R2 = R2 + 1;
            end
        end
    end

ave1 = mean(G1);
ave2 = mean(G2);
T = (ave1 + ave2)/2;

if abs(T0-T) < 0.001
    break;
end 
    T0 = T;
 end
%%value = T0;
value = 0.68;
end


