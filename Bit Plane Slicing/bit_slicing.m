inputImage = imread("dog.jpg"); % Load the input image
originalImage = inputImage; % Store the original image

% Convert to grayscale if the image is in color
if size(inputImage, 3) == 3
    inputImage = rgb2gray(inputImage);
end

% Initialize a figure to display results
figure;

% Display the original image
subplot(3, 4, 1);
imshow(originalImage);
title('Original Image');

% Display the grayscale of the image
subplot(3, 4, 2);
imshow(inputImage);
title('Grayscale Image');

% bit-plane slicing and visualize each bit-plane
for bitLevel = 1:8
    % current bit-plane
    currentBitPlane = bitget(inputImage, bitLevel);
    
    % Display the extracted bit-plane
    subplot(3, 4, bitLevel + 4); % Allocate a specific subplot position (starting from the 5th slot)
    
    % Convert the extracted bit-plane to a logical array for visualization
    imshow(logical(currentBitPlane)); 
    
    % title to indicate which bit-plane is being displayed
    title(['Bit Plane ', num2str(bitLevel)]);

end

% title to the figure
sgtitle('Bit-Plane Slicing Results');
