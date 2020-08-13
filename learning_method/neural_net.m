% imageSize = [32 32 3];
% pixelRange = [-4 4];
% imageAugmenter = imageDataAugmenter( ...
%     'RandXReflection',true, ...
%     'RandXTranslation',pixelRange, ...
%     'RandYTranslation',pixelRange);
% augimdsTrain = augmentedImageDatastore(imageSize,training_images,training_labels, ...
%     'DataAugmentation',imageAugmenter, ...
%     'OutputSizeMode','randcrop');


% netWidth = 16;
% layers = [
%     imageInputLayer([32 32 3],'Name','input')
%     convolution2dLayer(3,netWidth,'Padding','same','Name','convInp')
%     batchNormalizationLayer('Name','BNInp')
%     reluLayer('Name','reluInp')
%     
%     convolutionalUnit(netWidth,1,'S1U1')
%     additionLayer(2,'Name','add11')
%     reluLayer('Name','relu11')
%     convolutionalUnit(netWidth,1,'S1U2')
%     additionLayer(2,'Name','add12')
%     reluLayer('Name','relu12')
%     
%     convolutionalUnit(2*netWidth,2,'S2U1')
%     additionLayer(2,'Name','add21')
%     reluLayer('Name','relu21')
%     convolutionalUnit(2*netWidth,1,'S2U2')
%     additionLayer(2,'Name','add22')
%     reluLayer('Name','relu22')
%     
%     convolutionalUnit(4*netWidth,2,'S3U1')
%     additionLayer(2,'Name','add31')
%     reluLayer('Name','relu31')
%     convolutionalUnit(4*netWidth,1,'S3U2')
%     additionLayer(2,'Name','add32')
%     reluLayer('Name','relu32')
%     
%     averagePooling2dLayer(8,'Name','globalPool')
%     fullyConnectedLayer(10,'Name','fcFinal')
%     softmaxLayer('Name','softmax')
%     classificationLayer('Name','classoutput')
%     ];
% 
% function layers = convolutionalUnit(numF,stride,tag)
% layers = [
%     convolution2dLayer(3,numF,'Padding','same','Stride',stride,'Name',[tag,'conv1'])
%     batchNormalizationLayer('Name',[tag,'BN1'])
%     reluLayer('Name',[tag,'relu1'])
%     convolution2dLayer(3,numF,'Padding','same','Name',[tag,'conv2'])
%     batchNormalizationLayer('Name',[tag,'BN2'])];
% end

lgraph = layerGraph(layers);
figure('Units','normalized','Position',[0.2 0.2 0.6 0.6]);
plot(lgraph);