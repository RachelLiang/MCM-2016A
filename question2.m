clear ;
syms F h0 theta1 theta2 theta3 theta4 theta5 theta6 theta7 ;
syms F0y F1y F2y F3y F4y F5y F6y l1 la a i Xmla Xmlb Yml delta;
g = 9.8;
l = 22.05;  %l1为虚拟锚链长度 
vf = 36;  %风速
vs = 0;
hfb = 2;
Rf = 1;
Mfb = 1000;
lgg = 1;
Rgg = 0.025;
Mgg = 10;
lgt = 1;
Rgt = 0.15;
Mgt = 100;
Mq = 1200;
p = 1025;
H = 18;
M0 = 7;
pi = 3.14159265;
h0 = 0.60005;
delta = -1;
F6y = -1;
la = 0;
tic
while delta<0
    F = (hfb-h0)*2*Rf*vf^2*0.625;
    F0y = p*pi*Rf^2*h0*g-Mfb*g;
    F1y = F0y + p*pi*Rgg^2*lgg*g-Mgg*g;
    F2y = F1y + p*pi*Rgg^2*lgg*g-Mgg*g;
    F3y = F2y + p*pi*Rgg^2*lgg*g-Mgg*g;
    F4y = F3y + p*pi*Rgg^2*lgg*g-Mgg*g;
    F5y = F4y + p*pi*Rgt^2*lgt*g-(Mgt+Mq)*g;
    F6y = F5y - M0*l*g;
    theta1 = atan((2*F0y + p*pi*Rgg^2*lgg*g-Mgg*g)/(2*F));
    theta2 = atan((2*F1y + p*pi*Rgg^2*lgg*g-Mgg*g)/(2*F));
    theta3 = atan((2*F2y + p*pi*Rgg^2*lgg*g-Mgg*g)/(2*F));
    theta4 = atan((2*F3y + p*pi*Rgg^2*lgg*g-Mgg*g)/(2*F));
    theta5 = atan((2*F4y + p*pi*Rgt^2*lgt*g-(Mgt+Mq)*g)/(2*F));
    l1 = F6y/(M0*g);
    a=F/(M0*g);
    Yml=sqrt((l+l1).^2+a.^2)-sqrt(l1.^2+a.^2);
    delta = h0+lgg*(sin(theta1)+sin(theta2)+sin(theta3)+sin(theta4))+lgt*sin(theta5)+Yml - H;
    h0 = h0+0.0001;
end
toc
    Xmla = a*log((l-la+sqrt(l1.^2+a.^2))/a);
    Xmlb = a*log((l-la+sqrt((l1+l).^2+a.^2))/a);
    i = lgg*(cos(theta1)+cos(theta2)+cos(theta3)+cos(theta4))+lgt*cos(theta5)+Xmlb-Xmla;
    
%problem2
if F6y >0
        theta7 = 1;
        Mq = 2600;
        while theta7>(16*pi/180) || theta5<(85*pi/180)
            delta = -1;
            h0 = 0.60005;
            while delta<0
                F = (hfb-h0)*2*Rf*vf^2*0.625;
                F0y = p*pi*Rf^2*h0*g-Mfb*g;
                F1y = F0y + p*pi*Rgg^2*lgg*g-Mgg*g;
                F2y = F1y + p*pi*Rgg^2*lgg*g-Mgg*g;
                F3y = F2y + p*pi*Rgg^2*lgg*g-Mgg*g;
                F4y = F3y + p*pi*Rgg^2*lgg*g-Mgg*g;
                F5y = F4y + p*pi*Rgt^2*lgt*g-(Mgt+Mq)*g;
                F6y = F5y - M0*(l-la)*g;
                theta1 = atan((2*F0y + p*pi*Rgg^2*lgg*g-Mgg*g)/(2*F));
                theta2 = atan((2*F1y + p*pi*Rgg^2*lgg*g-Mgg*g)/(2*F));
                theta3 = atan((2*F2y + p*pi*Rgg^2*lgg*g-Mgg*g)/(2*F));
                theta4 = atan((2*F3y + p*pi*Rgg^2*lgg*g-Mgg*g)/(2*F));
                theta5 = atan((2*F4y + p*pi*Rgt^2*lgt*g-(Mgt+Mq)*g)/(2*F));
                l1 = F6y/(M0*g);
                a=F/(M0*g);
                Yml=sqrt((l-la+l1).^2+a.^2)-sqrt(l1.^2+a.^2);
                delta = h0+lgg*(sin(theta1)+sin(theta2)+sin(theta3)+sin(theta4))+lgt*sin(theta5)+Yml - H;
                h0 = h0 + 0.0001
            end
            h0 = h0 - 0.00005;
            F = (hfb-h0)*2*Rf*vf^2*0.625;
            F0y = p*pi*Rf^2*h0*g-Mfb*g;
            F1y = F0y + p*pi*Rgg^2*lgg*g-Mgg*g;
            F2y = F1y + p*pi*Rgg^2*lgg*g-Mgg*g;
            F3y = F2y + p*pi*Rgg^2*lgg*g-Mgg*g;
            F4y = F3y + p*pi*Rgg^2*lgg*g-Mgg*g;
            F5y = F4y + p*pi*Rgt^2*lgt*g-(Mgt+Mq)*g;
            F6y = F5y - M0*(l-la)*g;
            theta1 = atan((2*F0y + p*pi*Rgg^2*lgg*g-Mgg*g)/(2*F));
            theta2 = atan((2*F1y + p*pi*Rgg^2*lgg*g-Mgg*g)/(2*F));
            theta3 = atan((2*F2y + p*pi*Rgg^2*lgg*g-Mgg*g)/(2*F));
            theta4 = atan((2*F3y + p*pi*Rgg^2*lgg*g-Mgg*g)/(2*F));
            theta5 = atan((2*F4y + p*pi*Rgt^2*lgt*g-(Mgt+Mq)*g)/(2*F));
            l1 = F6y/(M0*g);
            a=F/(M0*g);
            theta7 = atan(l1/a);
            Mq = Mq+1;
        end
        
    end
%plot(h0,delta);
