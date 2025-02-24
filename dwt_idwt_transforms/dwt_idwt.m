clc;
clear all;
close all;

url='https://imgs.search.brave.com/eUt9huxzUVB-nq3XQzMSqGXdVSY5-wENGENFU1VE8-0/rs:fit:500:0:0:0/g:ce/aHR0cDovL2xlbm5h/Lm9yZy9sZW5fc3Rk/LmpwZw';
I=imread(url);
imshow(I);
title('Original image');

Ig=rgb2gray(I);
imshow(Ig);
title('Grayscale image');

% to get dwt transformed parts of the image
[LL, LH, HL, HH] = dwt2(Ig, 'haar');
% to reconstruct image using idwt 
Ig_reconstructed = idwt2(LL, LH, HL, HH, 'haar');
imshow(uint8(Ig_reconstructed));
title('Reconstructed image');

figure;
subplot(2,2,1), imshow(LL, []), title('Low-Low (approximation)');
subplot(2,2,2), imshow(LH, []), title('Low-High');
subplot(2,2,3), imshow(HL, []), title('High-Low');
subplot(2,2,4), imshow(HH, []), title('High-High');