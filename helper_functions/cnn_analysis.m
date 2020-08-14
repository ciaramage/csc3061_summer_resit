function [] = cnn_analysis(train_images, train_labels, test_images, test_labels, isColor, isAugmented)
    rng(10) % for reproducability
        
    if isColor
        imageSize = [32 32 3];
        title = 'Color';
    else 
        imageSize = [32 32 1];
        title = 'Grayscale';
    end
    
    if isAugmented
        pixelRange = [-4 4];
        imageAugmenter = imageDataAugmenter( ...
            'RandXReflection',true, ...
            'RandXTranslation',pixelRange, ...
            'RandYTranslation',pixelRange);

        train_data = augmentedImageDatastore(imageSize,train_images,train_labels, ...
            'DataAugmentation',imageAugmenter, ...
            'OutputSizeMode','randcrop');
        title = title + '-Augmented';
    else
        train_data = matrix2cell(train_images, train_labels);
    end
    
    test_data = matrix2cell(test_images, test_labels);
    
    predict = cnn(train_data, test_data, imageSize);

    % % confusion matrix
    figure('Units','normalized','Position',[0.2 0.2 0.4 0.4]);
    cm = confusionchart(label_encoder(uint8(test_labels)),label_encoder(uint8(predict)));
    cm.Title = 'Confusion Matrix for' + title + 'Validation Data';
    cm.ColumnSummary = 'column-normalized';
    cm.RowSummary = 'row-normalized';
    
end