function [] = dnn_analysis(train_images, train_labels, test_images, test_labels, isColor)
    
    % set imageSize
    if isColor
        imageSize = [32 32 3];
    else 
        imageSize = [32 32 1];
    end
    
    pixelRange = [-4 4];
    imageAugmenter = imageDataAugmenter( ...
        'RandXReflection',true, ...
        'RandXTranslation',pixelRange, ...
        'RandYTranslation',pixelRange);
    train_data = augmentedImageDatastore(imageSize,train_images,train_labels, ...
        'DataAugmentation',imageAugmenter, ...
        'OutputSizeMode','randcrop');
    
    test_data = matrix2cell(test_images, test_labels);
    
    trainedNet = deep_neural_net(train_data, test_data, imageSize);

    [test_predict,probs] = classify(trainedNet,test_images);
    validationError = mean(test_predict ~= test_labels);
    
    train_predict = classify(trainedNet,train_images);
    trainError = mean(train_predict ~= train_labels);
    
    disp("Training error: " + trainError*100 + "%")
    disp("Validation error: " + validationError*100 + "%")

    figure('Units','normalized','Position',[0.2 0.2 0.4 0.4]);
    cm = confusionchart(label_encoder(uint8(train_labels)), label_encoder(uint8(train_predict)));
    cm.Title = 'Confusion Matrix for Training Data';
    cm.ColumnSummary = 'column-normalized';
    cm.RowSummary = 'row-normalized';
    
    figure('Units','normalized','Position',[0.2 0.2 0.4 0.4]);
    cm = confusionchart(label_encoder(uint8(test_labels)), label_encoder(uint8(test_predict)));
    cm.Title = 'Confusion Matrix for Validation Data';
    cm.ColumnSummary = 'column-normalized';
    cm.RowSummary = 'row-normalized';
    
    figure
    idx = randperm(size(test_images,4),9);
    for i = 1:numel(idx)
        subplot(3,3,i);
        imshow(test_images(:,:,:,idx(i)));
        prob = num2str(100*max(probs(idx(i),:)),3);
        predClass = char(test_predict(idx(i)));
        title([predClass,', ',prob,'%'])
    end
end