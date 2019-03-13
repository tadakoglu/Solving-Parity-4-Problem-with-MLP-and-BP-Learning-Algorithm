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
    
    %%%%%BURASI PARITY-4 PROBLEMÝNÝ LOGSÝG ÝLE ÇÖZMEK ÝÇÝN 0'A DÖNÜÞTÜRÜLEN DEÐERLERÝ GERÝ
    %%%%%YÜKLER.
    Z{l} = round(Z{l});
    
end
y = Z{L};

