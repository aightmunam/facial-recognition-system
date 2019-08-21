% m                      - Mean of the training database
% Eigenfaces             - Eigen vectors of the covariance matrix of the training database
% A                      - Matrix of centered image vectors
function [m, A, Eigenfaces] = pcaFuntion(T)

% TAKING MEAN OF TRAINING SET
m = mean(T,2);
Train_Number = size(T,2);

% MEAN-CENTERING WHOLE DATASET
A = [];  
for i = 1 : Train_Number
    temp = double(T(:,i)) - m;
    A = [A temp]; 
end

% COMPUTING COVARIACNE MATRIX
L = A' * A;

% D contains EIGEN-VALUES and V contains EIGEN-VECTORS
[V D] = eig(L);

% SORTING AND THRESHOLDING EIGENVECTORS DEPENDING UPON EIGEN-VALUES. LESS
% THAN 1 ARE DISCARDED
L_eig_vec = [];
for i = 1 : size(V,2) 
    if( D(i,i)>1 )
        L_eig_vec = [L_eig_vec V(:,i)];
    end
end

% COMPUTING EIGEN-FACES (EIGEN_VECTORS OF COVARIANCE MATRIX)
Eigenfaces = A * L_eig_vec;