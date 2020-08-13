function [gray_imgs] = color2gray(color_imgs)
IMG_HEIGHT = 32;
IMG_WIDTH = 32;
NUM_IMGS = size(color_imgs,4);

gray_imgs = zeros(IMG_HEIGHT, IMG_WIDTH, 1,NUM_IMGS);

for i = 1:NUM_IMGS
    gray_imgs(:,:,:,i) = rgb2gray(color_imgs(:,:,:,i));
end

gray_imgs = uint8(gray_imgs);

end