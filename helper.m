 % % remember to add the datasets folder and its subfolders to the path
[training_images, training_labels] = import_data('training.mat');
[testing_images, testing_labels] = import_data('testing.mat');

% % concatenate training images/labels with testing images/labels
% images = cat(4, training_images, testing_images);
% labels = [training_labels; testing_labels];

% % label encoding
% label_class = [0 1 2 3 4 5 6 7 8 9];
% label_object = {'airplane','automobile','bird','cat','deer','dog','frog','horse','ship','truck'};
% training_labels = categorical(training_labels, label_class, label_object);
% testing_labels = categorical(testing_labels, label_class, label_object);

% % convert 4d array of color images to 3d array of grayscale images
train_gray_images = color2gray(training_images);
test_gray_images = color2gray(testing_images);

% % images to analyse
[analysis_imgs, analysis_labels] = analysis_images(training_images, training_labels);




% % hog feature vectors

% % training_hog_fv = hog_feature_vectors(training_images); %-> this takes too
% long so break it down
% tic
% training_hog_1 = hog_feature_vectors(training_images(:,:,:,1:10000));
% training_hog_2 = hog_feature_vectors(training_images(:,:,:,10001:20000));
% training_hog_3 = hog_feature_vectors(training_images(:,:,:,20001:30000));
% training_hog_4 = hog_feature_vectors(training_images(:,:,:,30001:40000));
% training_hog_5 = hog_feature_vectors(training_images(:,:,:,40001:50000));
% toc

% training_hog_fv = [training_hog_1; training_hog_2; training_hog_3; training_hog_4; training_hog_5];
% testing_hog_fv = hog_feature_vectors(testing_images);

% % fit a knn model on grayscale hog images
% [model, resub_loss, cross_val_model, cv_loss] = knn(training_hog_fv, training_labels, 5);

% % extract edges from training and testing images
% training_edges = get_edges(train_gray_images, 'Canny');
% testing_edges = get_edges(test_gray_images, 'Canny');
% 

% % fit a knn model on images with canny filter and hog
%training_edges_hog = hog_feature_vectors(training_edges);
%[model, resub_loss, cross_val_model, cv_loss] = knn(training_edges_hog, training_labels, 7 );



% https://uk.mathworks.com/help/matlab/ref/cat.html


