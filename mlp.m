function [model, mse] = mlp(X, Y, h)
% Multilayer perceptron
% Input:
%   X: d x n data matrix %%  e�itim seti giri�(input) k�mesi
%   Y: p x n response matrix %% e�itim seti hedef(target) k�mesi
%   h: L x 1 vector specify number of hidden nodes in each layer l %% her
%   bir katmandaki n�ron say�s�. mesela [2,3] , 1. gizli katmanda iki tane
%   ve 2. gizli katmanda 3 tane n�ron bulundu�unu g�sterir. 
%   Bunun d���ndaki giri� ve ��k�� i�lemlerini yapan katmanlardaki n�ronlar�n say�s� giri� ve target e�itim seti
%   k�mesinden otomatik olarak ayarlan�r.
% Ouput:
%   model: model structure
%   mse: mean square error % ortalama kare hata.
h = [size(X,1);h(:);size(Y,1)]; %% burada g�r�ld��� �zere X giri� vekt�rleri k�memizin sat�r say�s� yapay sinir a�� giri�i say�s� otomatik olarak al�nd�. ayn� i�lem target(hedef) k�me i�inde yap�ld�. gizli katmanlar ve bu katmanlardaki n�ron say�lar� h ile �nceden belirlenmi�ti.
L = numel(h); %% numel eleman say�s�n� hesaplar bu durumda L gizli katman say�s� olacakt�r.
W = cell(L-1);
for l = 1:L-1
    W{l} = randn(h(l),h(l+1)); %% mesela ilk d�ng�de 1. katman n�ron say�s� x 2. katman n�ron say�s� w1 de�erini olu�turur. {} indisleme i�in kullan�l�r.
end
Z = cell(L); %% katman say�s� x katmansay�s� b�y�kl���nde bo� matrix
Z{1} = X;
eta = 1/size(X,2);
% eta=0.04;
maxiter = 20000; %% maximum iterasyon say�s� belirledik

mse = zeros(1,maxiter);
for iter = 1:maxiter
%     forward %1. ad�m ileri y�nl� yay�l�m
    for l = 2:L
        Z{l} = SigmoidTF(W{l-1}'*Z{l-1});
    end
%     backward %2. ad�m geri y�nl� yay�l�m
    E = Y-Z{L};
    mse(iter) = mean(dot(E(:),E(:))); % ortalama kare hesaplad�k. burada LMS WidrofHoff kural�n�n genelle�tirmi� hali kullan�ld�, backpropagation algorithm MSE..
    for l = L-1:-1:1
        df = Z{l+1}.*(1-Z{l+1});
        dG = df.*E;
        dW = Z{l}*dG';
        W{l} = W{l}+eta*dW;
        E = W{l}*dG;
    end
end
mse = mse(1:iter); %aproximate yani yakla��k MSE(ORTALAMA KARE HATA) de�eri al�nd���ndan k. iterasyonda uyguland���ndaki olu�an ger�ek hata de�eri ortalam hata de�eri olarak kabul edilir.
model.W = W;