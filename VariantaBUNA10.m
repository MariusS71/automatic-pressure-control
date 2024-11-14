load VarBUNAPres1_0_255.mat
plot(Pres_0_255)
hold on
date1=Pres_0_255;

load VARBUNAPres2_0_255.mat
plot(Pres_0_255)
hold on
date2=Pres_0_255;

load VARBUNAPres3_0_255.mat
plot(Pres_0_255)
date3=Pres_0_255;
%%
hold on
 plot(2,70,'r*')
hold on
plot(4,108,'r*')

hold on
y = 70;
line([0,2],[y,y])
y = 108;
line([0,4],[y,y])

x = 2;
line([x, x],[0,70])

x = 4;
line([x, x],[0,108])

%%

t1=2;
y1=70*100/255;

t2=4;
y2=108*100/255;


u=150*100/255;
K=132*100/255;

Kf=132/150;

Tf= (t2-t1)*(1/(log((y1-Kf)/(y2-Kf))))


%%
clear
s = tf('s');
Kf=132/150;

Hf=Kf/((2.34*s+1)*(0.2*s+1));

%Hf=Kf/(2.1*s+1)
%Kf=132;

hold on 
step(150*Hf)


%% regulator pid cu raspuns impus

%eps=log(0.1)/(sqrt(pi^2+(log(0.1))^2))

eps=0.75;

%wn=-log(0.05*sqrt(1-eps^2))/(5*eps);

wn=1;

H0=wn^2/(s^2+2*eps*wn*s+wn^2);

Hd=H0/(1-H0);
Hpp=Kf/((2.34*s+1)*(0.2*s+1));

Hr=Hd/Hpp;

%%
Hd=c2d(Hpp,0.1,'zoh');
A= Hd.den{1};
B= Hd.num{1};

Hrdiscret=c2d(Hr,0.1,'zoh');
Ar= Hrdiscret.den{1};
Br= Hrdiscret.num{1};
% TO DO
% impart si sus si jos cu z la a 4 a  
% u(k)= 2.772 u(k-1) - 2.859 u(k-2) + 1.31 u(k-3) - 0.2231 u(k-4) +
%           + 0.0436 e(k-1) - 0.09294 e(k-2) + 0.06315 e(k-3) + 0.2231 + e(k-4)


%% incercare RST
clear
Kf=132/150;
s = tf('s');
Hpp=Kf/((2.34*s+1)*(0.2*s+1));
Hd=c2d(Hpp,0.3,'zoh');

%A= [1 -0.8897 0.06629];
%B= [16.44 6.866];

A= Hd.den{1};
B= Hd.num{1};


na=2;
nb=2;
d=0;

eps=0.75;
wn=1;

H0=wn^2/(s^2+2*eps*wn*s+wn^2);
H0d = c2d(H0, 0.3, 'tustin');
P=[H0d.den{1} 0];


ns=1;
nr=1;

M= [  1     0      0     0   
     A(2)   1      B(2)  0
     A(3)   A(2)   B(3)  B(2)
     0      A(3)   0     B(3) 
        ];

aux = M \ P';

S(1)=1;
S(2)=aux(2);

R(1)=aux(3);
R(2)=aux(4);


%% Urmarire
Hpp=Kf/((2.34*s+1)*(0.2*s+1));
Hd=c2d(Hpp,0.5,'zoh');

T = H0d.den{1}/ sum(B);

wn=1;
tt=4.5;

wnt = wn * tt;
z =0.75; %eps
s = tf('s');

H_0t = wnt^2 / (s^2 + 2 * z * wnt * s + wnt^2);
H_0dt = c2d(H_0t, 0.5, 'tustin');
Bm = H_0dt.num{1};
Am = H_0dt.den{1};



%% rst + eroare TO DO\
clear
Kf=132/150;
s = tf('s');
Hpp=Kf/((2.34*s+1)*(0.2*s+1));
Hd=c2d(Hpp,0.3,'zoh');

A= Hd.den{1};
B= Hd.num{1};
A1 = conv(A, [1, -1]);

eps=0.75;
wn=1;


H0=wn^2/(s^2+2*eps*wn*s+wn^2);
H0d = c2d(H0, 0.1, 'tustin');

M= [  1     0           0     0      0
     A1(2)   1          B(2)  0      0
     A1(3)   A1(2)      B(3)  B(2)   0
     A1(4)   A1(3)      0     B(3)   B(2)
     0      A1(4)       0     0      B(3)
        ];

P= [H0d.den{1} 0 0];

aux = M \ P';

S1(1)=1;
S1(2)=aux(2);
S=conv(S1, [1, -1]);

R(1)=aux(3);
R(2)=aux(4);
R(3)=aux(5);

%% Urmarire
T = H0d.den{1}/ sum(B);

tt=1;

wnt = wn * tt;
z =eps; %eps


H_0t = wnt^2 / (s^2 + 2 * z * wnt * s + wnt^2);
H_0dt = c2d(H_0t, 0.3, 'tustin');
Bm = H_0dt.num{1};
Am = H_0dt.den{1};



