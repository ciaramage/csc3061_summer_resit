function [brighter_images] = brighten_images(images, method)

    % this function will be used to brighten an image using the method passed
    % in. control will be given to a switch statement

    switch method
        case 'power_law'
            brighter_images = power_law(images);
        case 'linear'
            brighter_images = linear(images);
        case 'histogram_equalization'
            brighter_images = histogram_equalization(images);
    end
end