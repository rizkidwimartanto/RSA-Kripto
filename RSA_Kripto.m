clc;% Untuk clear command window
disp('RSA Encrypt-Decrypt Algorithm');
disp('-----------------------------------------');
clear all; close all;% Untuk clear variabel

% Menginput nilai p dan q
p = input('\nMasukkan Nilai p: ');
q = input('\nMasukkan Nilai q: ');

disp('Intaializing:');
n=p*q;% Perkalian dari p * q
tf=(p-1)*(q-1);%Calculate value of totien function

%Calculate the value of e
x=2;e=1;
while x > 1
    e=e+1;
    x=gcd(tf,e);%Search greatest common division
end

%Calculate the value of d
i=1;
d=0;
while i > 0
    d = d+1;
    x = e*d;
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
disp(['Public key (e) adalah: ' num2str(e)]);
disp(['Private key (d) adalah: ' num2str(d)]);

P = input('\nMasukkan pesan yang akan dikirim: ','s');
c = double(P);
disp('pesan asli: ');
disp(P);

disp('ascii asli: ');
disp(c);

%Encrypt

cipher= power(c,e);
cipher= mod(cipher,n);

disp('cipher: ');
disp(cipher);

%Decrypt
plain= power(cipher,d);
plain= mod(plain,n)+33;

disp('decrypt: ');
disp(plain);

disp('Pesan hasil decrypt: ');
disp(char(plain));%Convert double to char