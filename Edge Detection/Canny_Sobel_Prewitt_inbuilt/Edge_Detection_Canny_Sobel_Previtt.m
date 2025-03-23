I = imread('lena.png');
Ig = rgb2gray(I);

% Edge Detection using Canny
edges_canny = edge(Ig, 'Canny');

% Edge Detection using Sobel
edges_sobel = edge(Ig, 'Sobel');

% Edge Detection using Prewitt
edges_prewitt = edge(Ig, 'Prewitt');

% Displaying the original and edge-detected images
subplot(2, 2, 1);
imshow(Ig);
title('Original Image');

subplot(2, 2, 2);
imshow(edges_canny);
title('Edge Detected (Canny)');

subplot(2, 2, 3);
imshow(edges_sobel);
title('Edge Detected (Sobel)');

subplot(2, 2, 4);
imshow(edges_prewitt);
title('Edge Detected (Prewitt)');
