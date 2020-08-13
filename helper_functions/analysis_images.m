function [imgs, categories] = analysis_images(training_images, training_labels)
% this function returns an array of images. one image per each category

    imgs= zeros(32,32,3,10);
    idx = [1,2,4,5,7,8,9,10,28,31];
    categories = [];

    for i=1:length(idx)
        imgs(:,:,:,i) = training_images(:,:,:,idx(i));
        categories = [categories; training_labels(idx(i))];
    end
    
    imgs = uint8(imgs);
end