clear all
clc
close all

% SETTING TRAINING AND TESTING IMAGES PATHS
TrainDatabasePath = 'C:\Users\Munam Malik\Downloads\AI\AI\TrainDatabase';
TestDatabasePath = 'C:\Users\Munam Malik\Downloads\AI\AI\TestDatabase';

% TAKING TEST IMAGE INPUT
prompt = {'Enter test image name (a number between 1 to 10):'};
dlg_title = 'RECOGNITION';
num_lines = 1;
def = {'1'};

% READING TEST IMAGE
TestImage  = inputdlg(prompt,dlg_title,num_lines,def);
TestImage = strcat(TestDatabasePath,'\',char(TestImage),'.jpg');
im = imread(TestImage); 

% READING AND ALIGNING IMAGES
T = alignImages(TrainDatabasePath);

% COMPUTIG PCA
[m, A, Eigenfaces] = pcaFuntion(T);

% DISPLAYING MEAN FACE
Meanface(T);

% RECOGNIZATION USING MIN. EUCLIDEAN DISTANCE
OutputName = Recognition(TestImage, m, A, Eigenfaces);

% PLOTTING IDENTIFIED PERSON
figure;SelectedImage = strcat(TrainDatabasePath,'\',OutputName);
SelectedImage = imread(SelectedImage);

subplot(1,2,1);imshow(im);
title('Test Image');
subplot(1,2,2);imshow(SelectedImage);
title('Original Image');
