function [images, labels] = create_image_dataset()

[training_images, training_labels] = import_data('training.mat');
[testing_images, testing_labels] = import_data('testing.mat');

%concatenate training images/labels with testing images/labels
images = cat(4, training_images, testing_images);
labels = [training_labels; testing_labels];

% encoding for the labels
label_class = [0,1,2,3,4,5,6,7,8,9];
label_object = ["airplane","automobile","bird","cat","deer","dog","frog","horse","ship","truck"];

%create new random index for dataset using randperm
idx = randperm(length(labels));
% use the new indices to shuffle the array
labels = labels(idx,:);

end
    
