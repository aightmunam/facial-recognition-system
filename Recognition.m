function OutputName = Recognition(TestImage, m, A, Eigenfaces)

ProjectedImages = [];
Train_Number = size(Eigenfaces,2);

% COMPUTING PROJECTION CO-EFFICIENTS
for i = 1 : Train_Number
    temp = Eigenfaces'*A(:,i);
    ProjectedImages = [ProjectedImages temp]; 
end

% EXTRACTING PCA FEATURES OF TEST IMAGE FOR MATCHING
InputImage = imread(TestImage);

temp = InputImage(:,:,1);

[irow icol] = size(temp);
InImage = reshape(temp',irow*icol,1);
Difference = double(InImage)- m; % CENTERING
ProjectedTestImage = Eigenfaces'*Difference; % FEATURE VECTOR OF TEST IMAGE

% COMPUTING EUCLIDEAN DISTANCE BETWEEN FEATURE MATRICES OF TRAINING SET vs
% FEATURE MATRIX OF TESTING IMAGE
Euc_dist = [];

for i = 1 : Train_Number
    q = ProjectedImages(:,i);
    temp = ( norm( ProjectedTestImage - q ) )^2;
    Euc_dist = [Euc_dist temp];
end

% THE IMAGE WITH LEAST EUC. DISTANCE WILL BE INDENTIFIED IMAGE
[Euc_dist_min , Recognized_index] = min(Euc_dist);
OutputName = strcat(int2str(Recognized_index),'.jpg');
