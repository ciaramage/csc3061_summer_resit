 function [angle, magnitude] = calculate_gradient(img)
        
        % % -------------------
        % calculate gradient
        % % -------------------
        % convert uint8 matrix to double matrix
        img = double(img);

        % number of rows and columns in image
        nRows = size(img,1);
        nColumns = size(img,2);

        % X and Y gradients
        x_grad = img;
        y_grad = img;

        for x=1:nColumns -2
            x_grad(:,x)=(img(:,x)-img(:,x+2));
        end
        for y=1:nRows -2
            y_grad(y,:)=(img(y,:)-img(y+2,:));
        end
        
        % matrix containing the angle of each edge gradient
        angle =atand(x_grad./y_grad);
        magnitude=sqrt(x_grad.^2 + y_grad.^2);
        
        % remove redundant pixels in each image
        angle(isnan(angle))=0;
        magnitude(isnan(magnitude))=0;              
 end