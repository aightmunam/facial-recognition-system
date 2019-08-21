function T = alignImages(TrainDatabasePath)

% PICKING FILES
TrainFiles = dir(TrainDatabasePath);
Train_Number = 0;

% CALCULATING NUMBER OF IMAGES, EXCLUDING OTHER AUTOMATICALLY GENERATED SYSTEM FILES
for i = 1:size(TrainFiles,1)
    if not(strcmp(TrainFiles(i).name,'.')|strcmp(TrainFiles(i).name,'..')|strcmp(TrainFiles(i).name,'Thumbs.db'))
        Train_Number = Train_Number + 1;
    end
end

% SORTED RETURN MATRIX
T = [];
for i = 1 : Train_Number
    
%     CREATING FILE PATH
    str = int2str(i);
    str = strcat('\',str,'.jpg');
    str = strcat(TrainDatabasePath,str);
%     READING IMAGES AND CONVERTING TO GRAY-SCALED IMAGES
    img = imread(str);
    img = rgb2gray(img);
    [irow, icol] = size(img);
    
%     RESHAPING 2D IMAGE VECTORS TO 1D IMAGE VECTORS
    temp = reshape(img', irow*icol, 1);
    
%     ADDING NEW IMAGE
    T = [T temp];                    
end