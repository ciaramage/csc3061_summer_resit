rng(10) % for reproducability
% imageSizeColor = [32 32 3];
% imageSizeGrayscale = [32 32 1];
% train_data = matrix2cell(training_images, training_labels);
% test_data = matrix2cell(testing_images, testing_labels);
% 
% analysis_data = matrix2cell(analysis_imgs, analysis_labels);
% 
% 
% pixelRange = [-4 4];
% imageAugmenter = imageDataAugmenter( ...
%     'RandXReflection',true, ...
%     'RandXTranslation',pixelRange, ...
%     'RandYTranslation',pixelRange);
% 
% augimdsTrain = augmentedImageDatastore(imageSizeColor,training_images,training_labels, ...
%     'DataAugmentation',imageAugmenter, ...
%     'OutputSizeMode','randcrop');
gray_augimdsTrain = augmentedImageDatastore(imageSizeColor,train_gray_images,training_labels, ...
    'DataAugmentation',imageAugmenter, ...
    'OutputSizeMode','randcrop');

%  gray_train_data = matrix2cell(train_gray_images, training_labels);
%  gray_test_data = matrix2cell(test_gray_images, testing_labels);



% color_cnn_predict = cnn(train_data, test_data, imageSizeColor);
% grayscale_cnn_predict = cnn(gray_train_data, gray_test_data, imageSizeGrayscale);
% augmented_color_cnn_predict = cnn(augimdsTrain, test_data,imageSizeColor);
 augmented_grayscale_cnn_predict = cnn(gray_augimdsTrain, gray_test_data,imageSizeGrayscale);


    validation = testing_labels;

    total = 0;
    for i=1:length(validation)
        if uint8(augmented_color_cnn_predict(i)) == uint8(validation(i))
            total = total +1;
        end
    end

% % confusion matrix
figure('Units','normalized','Position',[0.2 0.2 0.4 0.4]);
cm = confusionchart(label_encoder(uint8(testing_labels)),label_encoder(uint8(augmented_color_cnn_predict)));
cm.Title = 'Confusion Matrix for Augmented Grayscale Validation Data';
cm.ColumnSummary = 'column-normalized';
cm.RowSummary = 'row-normalized';