import cv2
import numpy as np

# Load the image
image = cv2.imread("mt_fuji_japan.jpg")

Ig = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
# Separate the RGB channels
B = image[:, :, 0]  # Blue channel
G = image[:, :, 1]  # Green channel
R = image[:, :, 2]  # Red channel

# Manually compute grayscale as the average of R, G, and B channels
gray = ((R + G + B) / 3).astype(np.uint8)

# Calculate threshold
threshold = np.sum(gray) / gray.size
bw_image = cv2.threshold(gray, threshold, 255, cv2.THRESH_BINARY)[1]

# Separate color channels
blue_image, green_image, red_image = image.copy(), image.copy(), image.copy()
blue_image[:, :, 1:] = 0  # Keep only blue
green_image[:, :, (0, 2)] = 0  # Keep only green
red_image[:, :, :2] = 0  # Keep only red

# Display all images
cv2.imshow("Original Image", image)
cv2.imshow("Grayscale Image (using inbuilt function)", Ig)
cv2.imshow("Grayscale Image (Manual)", gray)
cv2.imshow("Black & White Image", bw_image)
cv2.imshow("Blue Image", blue_image)
cv2.imshow("Green Image", green_image)
cv2.imshow("Red Image", red_image)

#keep the images until any key is pressed and then destroy them
cv2.waitKey(0)
cv2.destroyAllWindows()