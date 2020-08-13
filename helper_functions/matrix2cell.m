function [cell_arr] = matrix2cell( matrix_of_images, matrix_of_labels)    
    cell_arr = cell(size(matrix_of_images,4),2);
    for i=1:size(matrix_of_images,4)
        cell_arr{i,1} = matrix_of_images(:,:,:,i);
        cell_arr{i,2} = matrix_of_labels(i);
    end    
end