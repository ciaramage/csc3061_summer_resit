function [img_edges] = get_edges(images, edge_type) 
    img_edges = zeros(size(images));
    for i=1:length(images)
        img_edges(:,:,i) = edge(images(:,:,i), edge_type);
    end
end