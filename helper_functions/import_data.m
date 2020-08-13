function [images, labels] = import_data(file_name)

 struct = load(file_name);
 data = struct.data;
 labels = struct.labels;

 IMAGE_HEIGHT = 32;
 IMAGE_WIDTH = 32;
 RGB = 3;
 NUM_IMAGES = length(data);
 
 % access each image using -> images(height, width, rgb, imageIndx)
 
 images = zeros(IMAGE_HEIGHT, IMAGE_WIDTH, RGB, NUM_IMAGES);
 
 for im = 1:NUM_IMAGES
     image_info = struct.data;
     % indexes to separate red, green, and blue
     red_pix = image_info(im,1:1024);
     green_pix = image_info(im, 1025:2048);
     blue_pix = image_info(im, 2049:3072);
     
     images(:,:,1,im) = reshape(red_pix, IMAGE_HEIGHT, IMAGE_WIDTH);
     images(:,:,2,im) = reshape(green_pix, IMAGE_HEIGHT, IMAGE_WIDTH);
     images(:,:,3,im) = reshape(blue_pix, IMAGE_HEIGHT, IMAGE_WIDTH);
     
     images = uint8(images);
     labels = categorical(labels);
 end
end