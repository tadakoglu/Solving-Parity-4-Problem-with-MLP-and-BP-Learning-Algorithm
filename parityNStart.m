%TAYFUN ADAKO�LU
%11253001
% PARITY 4 PROBLEM�N�N BACKPROPAGATION VE MULTILAYER PERCEPTRON ILE COZUMU ODEV 5
%Detayl� anlat�m�m i�in bu projedeki mlp.m dosyas�n� okuyunuz. 
%Sayg�lar�mla

%E�ER YAPAY S�N�R A�I YAKINSAMIYOR �SE TEKRAR �ALI�TIRINIZ
%FARKLI BA�LANGI� PARAMETRE DE�ERLER� ATANACAKTIR ANCAK BU ��LEME �HT�YA� DUYULMA OLASILI�I D���KT�R
%M�N�MUM N�RON SAYILARINI SE�MEYE �ALI�TIM.

clear; close all;


%PARITY 4 problemi i�in (x,t) e�itim k�mesi, 

X=transpose([-1	-1	-1	-1;	-1	-1	-1	 1;	-1	-1	 1	-1;	-1	-1	 1	 1;	-1	 1	-1	-1;	-1	 1	-1	 1;	-1	 1	 1	-1;	-1	 1	 1	 1;	 1	-1	-1	-1;	 1	-1	-1	 1; 1	-1	 1	-1;	 1	-1	 1	 1;	 1	 1	-1	-1	;	 1	 1	-1	 1	;	 1	 1	 1	-1;	 1	 1	 1	 1]);	
T=[-1 1 1 -1 1 -1 -1 1 1 -1 -1 1 -1 1 1 -1];

%%%% NEDEN�N� HEN�Z ��ZEMED�M ANCAK TANGENT H�PERBOL�K �LE B�R T�RL�
%%%% PARITY 4 ���N ��RETEMED�M BU Y�ZDEN A�I LOGS�G �LE ��RETEB�LMEK/E��TEB�LMEK  ���N -1'LER� 0'A
%%%% D�N��T�R�YORUM.

for d1=1:size(X,1)
    for d2= 1:size(X,2)
        if X(d1,d2)==-1
            X(d1,d2) =0;
        end
    end
end
for dt1=1:size(T,2)    
        if T(dt1)==-1
            T(dt1) =0;
        end
end

h = [20,10]; % gizli katmanlardaki n�ron say�lar�. 1. katmanda 20 adet, 2. katmanda da 10 adet n�ron kullan�ld�.
%            % tek gizli katmanla bu parity 4 problemi yak�nsam�yor(ya da zor) izledi�im
%            % kadar�yla. ya da yakla��k (approximate steepest descent
%            % kulland���m�zdan(LMS) hata de�erini s�f�rlayam�yoruz her
%            % zaman...
           

[model,mse] = mlp(X,T,h);
plot(mse);
disp(['T = [' num2str(T) ']']);
Y = mlpPred(model,X);
disp(['Y = [' num2str(Y) ']']);