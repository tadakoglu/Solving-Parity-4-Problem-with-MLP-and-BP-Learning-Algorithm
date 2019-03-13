function y = mlpPred(model, X)
% Multilayer perceptron prediction
% Input:
%   model: model structure
%   X: d x n data matrix
% Ouput:
%   Y: p x n response matrix
W = model.W;
L = length(W)+1;
Z = cell(L);
Z{1} = X;
for l = 2:L
    Z{l} = SigmoidTF(W{l-1}'*Z{l-1});
    
    %%%%%BURASI PARITY-4 PROBLEM�N� LOGS�G �LE ��ZMEK ���N 0'A D�N��T�R�LEN DE�ERLER� GER�
    %%%%%Y�KLER.
    Z{l} = round(Z{l});
    
end
y = Z{L};

