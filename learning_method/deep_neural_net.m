function [net] = deep_neural_net(train_data, test_data, imageSize)
    netWidth = 16;
    layers = [
        imageInputLayer(imageSize)

        convolution2dLayer(3,netWidth,'Padding','same','Name','convInp')
        batchNormalizationLayer('Name','BNInp')
        reluLayer('Name','reluInp')

        convolutionalUnit(netWidth,1,'S1U1')
        reluLayer('Name','relu11')
        convolutionalUnit(netWidth,1,'S1U2')
        reluLayer('Name','relu12')

        convolutionalUnit(2*netWidth,2,'S2U1')
        reluLayer('Name','relu21')
        convolutionalUnit(2*netWidth,1,'S2U2')
        reluLayer('Name','relu22')

        convolutionalUnit(4*netWidth,2,'S3U1')
        reluLayer('Name','relu31')
        convolutionalUnit(4*netWidth,1,'S3U2')
        reluLayer('Name','relu32')

        averagePooling2dLayer(8,'Name','globalPool')
        fullyConnectedLayer(10,'Name','fcFinal')
        softmaxLayer('Name','softmax')
        classificationLayer('Name','classoutput')
    ];
    
    options = trainingOptions('sgdm', ...
    'InitialLearnRate',0.01, ...
    'MaxEpochs',2, ...
    'Shuffle','every-epoch', ...
    'ValidationData',test_data, ...
    'ValidationFrequency',30, ...
    'Verbose',false, ...
    'Plots','training-progress');
   
    %  net = trainNetwork(training_images, categorical( training_labels) , layers, options);
     net = trainNetwork(train_data, layers, options);

end
