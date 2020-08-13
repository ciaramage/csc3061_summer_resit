function [cell_arr] = matrix2cell( matrix_of_images, matrix_of_labels)    
    cell_arr = cell(1,2);
    
        cell_arr{1,1} = matrix_of_images;
        cell_arr{1,2} = matrix_of_labels;
end