clear ;
syms F h0 theta1 theta2 theta3 theta4 theta5 theta6 theta7 ;
syms F0y F1y F2y F3y F4y F5y F6y l1 la a i Xmla Xmlb Yml delta;
syms F0x F1x F2x F3x F4x F5x F6x;
g = 9.8;
l = 0.18*90; %l1为虚拟锚链长度 
M0 = 28.12;
vf = 36;  %风速
vs = 1.5;
H = 18;
Mq = 1200;
hfb = 2;
Rf = 1;
Mfb = 1000;
lgg = 1;
Rgg = 0.025;
Mgg = 10;
lgt = 1;
Rgt = 0.15;
Mgt = 100;
p = 1025;
pi = 3.14159265;
h0 = 0.60005;
%h0 = 0.65:0.0001:0.85;
delta = -1;
%F6y = -1;
la = 0;
tic
while delta<0
    F = (hfb-h0)*2*Rf*vf.^2*0.625;
    F0y = p*pi*Rf.^2*h0*g-Mfb*g;
    F1y = F0y + p*pi*Rgg.^2*lgg*g-Mgg*g;
    F2y = F1y + p*pi*Rgg.^2*lgg*g-Mgg*g;
    F3y = F2y + p*pi*Rgg.^2*lgg*g-Mgg*g;
    F4y = F3y + p*pi*Rgg.^2*lgg*g-Mgg*g;
    F5y = F4y + p*pi*Rgt.^2*lgt*g-(Mgt+Mq)*g;
    F6y = F5y - M0*l*g;
    F0x = F + 374*2*Rf*h0*vs.^2;
    theta1 = atan((2*F0y + p*pi*Rgg.^2*lgg*g-Mgg*g)/(2*F0x+374*2*Rgg*lgg));
    F1x = F0x +374*2*Rgg*lgg*sin(theta1);
    theta2 = atan((2*F1y + p*pi*Rgg.^2*lgg*g-Mgg*g)/(2*F1x+374*2*Rgg*lgg));
    F2x = F1x +374*2*Rgg*lgg*sin(theta2);
    theta3 = atan((2*F2y + p*pi*Rgg.^2*lgg*g-Mgg*g)/(2*F2x+374*2*Rgg*lgg));
    F3x = F2x +374*2*Rgg*lgg*sin(theta3);
    theta4 = atan((2*F3y + p*pi*Rgg.^2*lgg*g-Mgg*g)/(2*F3x+374*2*Rgg*lgg));
    F4x = F3x +374*2*Rgg*lgg*sin(theta4);
    theta5 = atan((2*F4y + p*pi*Rgt.^2*lgt*g-(Mgt+Mq)*g)/(2*F4x+374*2*Rgt*lgt));
    F5x = F4x +374*2*Rgt*lgt*sin(theta5);
    F6x =F5x;
    l1 = F6y/(M0*g);
    a=F/(M0*g);
    theta7 = atan(l1/a);
    Yml=sqrt((l+l1).^2+a.^2)-sqrt(l1.^2+a.^2);
    delta = h0+lgg*(sin(theta1)+sin(theta2)+sin(theta3)+sin(theta4))+lgt*sin(theta5)+Yml - H;
    h0 = h0+0.0001;
end
toc
i = 'Wrong';
if theta7>(16*pi/180) || theta5<(85*pi/180)
    fprintf('%s\n',i);
    F = (hfb-h0)*2*Rf*vf.^2*0.625;
    F0y = p*pi*Rf.^2*h0*g-Mfb*g;
    F1y = F0y + p*pi*Rgg.^2*lgg*g-Mgg*g;
    F2y = F1y + p*pi*Rgg.^2*lgg*g-Mgg*g;
    F3y = F2y + p*pi*Rgg.^2*lgg*g-Mgg*g;
    F4y = F3y + p*pi*Rgg.^2*lgg*g-Mgg*g;
    F5y = F4y + p*pi*Rgt.^2*lgt*g-(Mgt+Mq)*g;
    F6y = F5y - M0*l*g;
    F0x = F + 374*2*Rf*h0*vs.^2;
    theta1 = atan((2*F0y + p*pi*Rgg.^2*lgg*g-Mgg*g)/(2*F0x+374*2*Rgg*lgg));
    F1x = F0x +374*2*Rgg*lgg*sin(theta1)*vs.^2;
    theta2 = atan((2*F1y + p*pi*Rgg.^2*lgg*g-Mgg*g)/(2*F1x+374*2*Rgg*lgg));
    F2x = F1x +374*2*Rgg*lgg*sin(theta2)*vs.^2;
    theta3 = atan((2*F2y + p*pi*Rgg.^2*lgg*g-Mgg*g)/(2*F2x+374*2*Rgg*lgg));
    F3x = F2x +374*2*Rgg*lgg*sin(theta3)*vs.^2;
    theta4 = atan((2*F3y + p*pi*Rgg.^2*lgg*g-Mgg*g)/(2*F3x+374*2*Rgg*lgg));
    F4x = F3x +374*2*Rgg*lgg*sin(theta4)*vs.^2;
    theta5 = atan((2*F4y + p*pi*Rgt.^2*lgt*g-(Mgt+Mq)*g)/(2*F4x+374*2*Rgt*lgt));
    F5x = F4x +374*2*Rgt*lgt*sin(theta5)*vs.^2;
    F6x =F5x;
    l1 = F6y/(M0*g);
    a=F/(M0*g);
    theta7 = atan(l1/a);
end
    Xmla = a*log((l-la+sqrt(l1.^2+a.^2))/a);
    Xmlb = a*log((l-la+sqrt((l1+l).^2+a.^2))/a);
    i = lgg*(cos(theta1)+cos(theta2)+cos(theta3)+cos(theta4))+lgt*cos(theta5)+Xmlb-Xmla;
