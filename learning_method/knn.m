function [model, resub_loss, cross_val_model, cv_loss] = knn(data, labels, num_neighbours)
    
    % initialize a knn model
    model = fitcknn(data, labels,'NumNeighbors', num_neighbours);

    % resub loss
    resub_loss = resubLoss(model);
    
    % construct a crossvalidated classifier
    cross_val_model = crossval(model);
    
    % examine the cross validation loss
    cv_loss = kfoldLoss(cross_val_model);
    
end
