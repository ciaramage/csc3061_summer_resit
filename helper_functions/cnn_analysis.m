

imageSizeColor = [32 32 3];
imageSizeGrayscale = [32 32 1];

train_data = matrix2cell(training_images, training_labels);
test_data = matrix2cell(testing_images, testing_labels);

analysis_data = matrix2cell(analysis_imgs, analysis_labels);


pixelRange = [-4 4];
imageAugmenter = imageDataAugmenter( ...
    'RandXReflection',true, ...
    'RandXTranslation',pixelRange, ...
    'RandYTranslation',pixelRange);
augimdsTrain = augmentedImageDatastore(imageSizeColor,training_images,training_labels, ...
    'DataAugmentation',imageAugmenter, ...
    'OutputSizeMode','randcrop');


%     validation = testing_labels;
% 
%     total = 0;
%     for i=1:length(pred)
%         if uint8(pred(i)) == uint8(validation(i))
%             total = total +1;
%         end
%     end