%アトラクタ再構成 and False Nearest Neighbor modified by Cao(1997)
clear all;close all;
load data;

Fs = 3.2;   %入力周波数
T = 1/Fs;
tau = T/4;  %再構成アトラクタの時間遅れ
tau = round(tau/dt);   %sec 2 step

N_ = N-3*tau;
%時間遅れ座標の計算
for i =1:N_

   x1(i) = x(i);
   x2(i) = x(i+tau);
   x3(i) = x(i+2*tau);
   x4(i) = x(i+3*tau);
end


figure;
scatter3(x1,x2,x3,2,x4);
colorbar;
xlabel('x(t)','FontSize',12);
ylabel('x(t+\tau)','FontSize',12);
zlabel('x(t+2\tau)','FontSize',12);

figure;plot(x1,x2);
figure;plot(x1,x3);
figure;plot(x1,x4);
figure;plot(x3,x1.^2+x2.^2);


for l = M1:M2-1
    if dv(l-1)>0 & dv(l)<0
        xp(Flg) = x(l);
        vp(Flg) = v(l);
        Flg = Flg + 1;
    end
end
figure;plot(xp,vp,'o');xlim([-0.5 0.5]);ylim([-0.5 0.5]);