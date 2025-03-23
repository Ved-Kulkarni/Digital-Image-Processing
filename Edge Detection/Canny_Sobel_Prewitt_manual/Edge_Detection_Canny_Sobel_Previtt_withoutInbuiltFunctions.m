Ig = rgb2gray(imread('lena.png'));

% Sobel operator kernels
sobel_x = [-1 0 1; -2 0 2; -1 0 1];
sobel_y = [-1 -2 -1; 0 0 0; 1 2 1];

% Canny Edge Detection (Manual)
Gx = conv2(double(Ig), sobel_x, 'same');
Gy = conv2(double(Ig), sobel_y, 'same');
grad_mag = sqrt(Gx.^2 + Gy.^2);
edges_canny = uint8(grad_mag / max(grad_mag(:)) * 255);

% Sobel Edge Detection (Manual)
edges_sobel = uint8(grad_mag / max(grad_mag(:)) * 255);

% Prewitt operator kernels
prewitt_x = [-1 0 1; -1 0 1; -1 0 1];
prewitt_y = [-1 -1 -1; 0 0 0; 1 1 1];

% Prewitt Edge Detection (Manual)
Gx_pre = conv2(double(Ig), prewitt_x, 'same');
Gy_pre = conv2(double(Ig), prewitt_y, 'same');
edges_prewitt = uint8(sqrt(Gx_pre.^2 + Gy_pre.^2) / max(sqrt(Gx_pre.^2 + Gy_pre.^2), [], 'all') * 255);

% Display the results
figure;
subplot(2,2,1), imshow(Ig), title('Original Image');
subplot(2,2,2), imshow(edges_canny), title('Manual Canny');
subplot(2,2,3), imshow(edges_sobel), title('Manual Sobel');
subplot(2,2,4), imshow(edges_prewitt), title('Manual Prewitt');
