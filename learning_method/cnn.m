function [predict] = cnn(train_data, test_data, imageSize)

    layers = [
        imageInputLayer(imageSize)

        convolution2dLayer(3,8,'Padding','same')
        batchNormalizationLayer
        reluLayer

        maxPooling2dLayer(2,'Stride',2)

        convolution2dLayer(3,16,'Padding','same')
        batchNormalizationLayer
        reluLayer

        maxPooling2dLayer(2,'Stride',2)

        convolution2dLayer(3,32,'Padding','same')
        batchNormalizationLayer
        reluLayer

        fullyConnectedLayer(10)
        softmaxLayer
        classificationLayer
    ];
    
    options = trainingOptions('sgdm', ...
    'InitialLearnRate',0.01, ...
    'MaxEpochs',4, ...
    'Shuffle','every-epoch', ...
    'ValidationData',test_data, ...
    'ValidationFrequency',30, ...
    'Verbose',false, ...
    'Plots','training-progress');


    %  net = trainNetwork(training_images, categorical( training_labels) , layers, options);
     net = trainNetwork(train_data, layers, options);

    % classify validation images and compute accuracy
    predict = classify(net, test_data{1,1});


end
