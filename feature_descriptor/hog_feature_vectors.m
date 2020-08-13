function [feature_vectors] = hog_feature_vectors(images)
    % store the hog feature vectors for each images
    feature_vectors = [];
    
    % convert color images to grayscale
    if size(images,3)==3
        images = color2gray(images);
    end
    
    for i=1: size(images, 3)
        img = images(:,:,:,i);
        fv = calculate_hog(img);
        feature_vectors = [feature_vectors; fv];
    end

end