clc;
clear all;
close all;

I = im2double(imread('lena.png')); % Original image
Wm = im2double(imread('watermark.png')); % Watermark image

Wm = rgb2gray(Wm); % Convert watermark to grayscale 

% DWT on each color channel of the original image
for i = 1:3
    [LL(:,:,i), LH(:,:,i), HL(:,:,i), HH(:,:,i)] = dwt2(I(:,:,i), 'haar');
end

% Resize watermark to match LL dimensions
Wm_resized = imresize(Wm, size(LL(:,:,1)));

% Embedding strength
alpha = 0.6; 

% Embed watermark into LL sub-band of each color channel
for i = 1:3
    LL_wm(:,:,i) = LL(:,:,i) + alpha * Wm_resized;
end

% Inverse DWT to get the watermarked image
for i = 1:3
    wm_img(:,:,i) = idwt2(LL_wm(:,:,i), LH(:,:,i), HL(:,:,i), HH(:,:,i), 'haar');
end

% Display results
figure;
subplot(1, 3, 1); imshow(I); title('Host');
subplot(1, 3, 2); imshow(Wm); title('Watermark');
subplot(1, 3, 3); imshow(wm_img); title('Watermarked');

imwrite(wm_img, 'watermarked_image.png');
