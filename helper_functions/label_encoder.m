function [new_labels] = label_encoder(labels)
    label_class = [0 1 2 3 4 5 6 7 8 9];
    label_object = {'airplane','automobile','bird','cat','deer','dog','frog','horse','ship','truck'};
    new_labels = categorical(labels, label_class, label_object);
end