% THIS FUNCTION JUST DISPLAY MEAN FACE OF WHOLE TRAINING SET
function [ output_args ] = Meanface( T)
T = mean(T,2);
face = reshape(T, 180, 200);
face = uint8(face);
face = face';
figure
imshow(face);
title('Mean Image');
output_args = 0;
end

