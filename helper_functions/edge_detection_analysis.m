edge_types = ["Sobel","Prewitt","Roberts","log","zerocross","Canny","approxcanny"];

% images to analyse
[imgs, lbls] = analysis_images(training_images, training_labels);
gray_imgs = color2gray(imgs);


figure('Name','Edge Extraction Analysis');
title('Analysis of Edge Extraction Methods');
xlabel('Edge Extraction Methods');
ylabel('Image Category');
pos = 1;
for i=1: size(gray_imgs,3)
    for j = 1:length(edge_types)
        subplot(size(gray_imgs,3),length(edge_types),pos);
        pos= pos+1;
        imshow(edge(gray_imgs(:,:,i),edge_types(j)));
        title(string(lbls(i))+"-"+edge_types(j));
    end
end
