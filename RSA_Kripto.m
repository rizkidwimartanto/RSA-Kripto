clc;% Untuk clear command window
disp('RSA Encrypt-Decrypt Algorithm');
disp('-----------------------------------------');
clear all; close all;% Untuk clear variabel

% Menginput nilai p dan q
p = input('\nMasukkan Nilai p: ');
q = input('\nMasukkan Nilai q: ');

disp('Intaializing:');
n=p*q;% Perkalian dari p * q
tf=(p-1)*(q-1);%Menghitung nilai fungsi totien

%Calculate the value of e
x=2;y=1;
while x > 1
    y=y+1;
    x=gcd(tf,y);%Cari divisi umum terbesar
end

%Calculate the value of d
i=1;
a=0;
while i > 0
    a = a+1;
    x = y*a;
    x = mod(x,20);
    if x == 1
        i = 0; 
    end
end

%clc;
disp(['Nilai (p) adalah: ' num2str(p)]);
disp(['Nilai (q) adalah: ' num2str(q)]);
disp(['Nilai (n) adalah: ' num2str(n)]);
disp(['Nilai totien function (tf) adalah: ' num2str(tf)]);
disp(['Public key (e) adalah: ' num2str(y)]);
disp(['Private key (d) adalah: ' num2str(a)]);

P = input('\nMasukkan pesan yang akan dikirim: ','s');
c = double(P);
disp('pesan asli: ');
disp(P);

disp('ascii asli: ');
disp(c);

%Encrypt

cipher= power(c,y);
cipher= mod(cipher,n);

disp('cipher: ');
disp(cipher);

%Decrypt
plain= power(cipher,a);
plain= mod(plain,n)+33;

disp('decrypt: ');
disp(plain);
