clc;
clear;
close all;

% Generate random 8x8 intensity matrix (values [50, 150])
img = uint8(round(50 + 100 * rand(8)));

% Flatten, sort and find unique intensities and their frequencies
[unique_vals, ~, idx] = unique(img(:));
freq = accumarray(idx, 1);

% Compute CDF and equalized intensity mapping
cdf = cumsum(freq);
cdf_min = min(cdf(cdf > 0));
L = 256;
eq_map = round(((cdf - cdf_min) / (numel(img) - cdf_min)) * (L - 1));

% Map original intensities to equalized values
eq_img = img;
for k = 1:length(unique_vals)
    eq_img(img == unique_vals(k)) = eq_map(k);
end

% Plot histograms and images
figure;
subplot(2, 1, 1);
bar(unique_vals, freq, 'FaceColor', 'g');
title('Original Histogram');
xlabel('Intensity');
ylabel('Frequency');

subplot(2, 1, 2);
bar(0:L-1, histcounts(eq_img(:), 0:L), 'FaceColor', 'm');
title('Equalized Histogram');
xlabel('Intensity');
ylabel('Frequency');

figure;
subplot(1, 2, 1);
imshow(img);
title('Original Image');

subplot(1, 2, 2);
imshow(eq_img);
title('Equalized Image');