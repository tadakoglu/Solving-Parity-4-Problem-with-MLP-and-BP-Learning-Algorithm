%TAYFUN ADAKOÐLU
%11253001
% PARITY 4 PROBLEMÝNÝN BACKPROPAGATION VE MULTILAYER PERCEPTRON ILE COZUMU ODEV 5
%Detaylý anlatýmým için bu projedeki mlp.m dosyasýný okuyunuz. 
%Saygýlarýmla

%EÐER YAPAY SÝNÝR AÐI YAKINSAMIYOR ÝSE TEKRAR ÇALIÞTIRINIZ
%FARKLI BAÞLANGIÇ PARAMETRE DEÐERLERÝ ATANACAKTIR ANCAK BU ÝÞLEME ÝHTÝYAÇ DUYULMA OLASILIÐI DÜÞÜKTÜR
%MÝNÝMUM NÖRON SAYILARINI SEÇMEYE ÇALIÞTIM.

clear; close all;


%PARITY 4 problemi için (x,t) eðitim kümesi, 

X=transpose([-1	-1	-1	-1;	-1	-1	-1	 1;	-1	-1	 1	-1;	-1	-1	 1	 1;	-1	 1	-1	-1;	-1	 1	-1	 1;	-1	 1	 1	-1;	-1	 1	 1	 1;	 1	-1	-1	-1;	 1	-1	-1	 1; 1	-1	 1	-1;	 1	-1	 1	 1;	 1	 1	-1	-1	;	 1	 1	-1	 1	;	 1	 1	 1	-1;	 1	 1	 1	 1]);	
T=[-1 1 1 -1 1 -1 -1 1 1 -1 -1 1 -1 1 1 -1];

%%%% NEDENÝNÝ HENÜZ ÇÖZEMEDÝM ANCAK TANGENT HÝPERBOLÝK ÝLE BÝR TÜRLÜ
%%%% PARITY 4 ÝÇÝN ÖÐRETEMEDÝM BU YÜZDEN AÐI LOGSÝG ÝLE ÖÐRETEBÝLMEK/EÐÝTEBÝLMEK  ÝÇÝN -1'LERÝ 0'A
%%%% DÖNÜÞTÜRÜYORUM.

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

h = [20,10]; % gizli katmanlardaki nöron sayýlarý. 1. katmanda 20 adet, 2. katmanda da 10 adet nöron kullanýldý.
%            % tek gizli katmanla bu parity 4 problemi yakýnsamýyor(ya da zor) izlediðim
%            % kadarýyla. ya da yaklaþýk (approximate steepest descent
%            % kullandýðýmýzdan(LMS) hata deðerini sýfýrlayamýyoruz her
%            % zaman...
           

[model,mse] = mlp(X,T,h);
plot(mse);
disp(['T = [' num2str(T) ']']);
Y = mlpPred(model,X);
disp(['Y = [' num2str(Y) ']']);