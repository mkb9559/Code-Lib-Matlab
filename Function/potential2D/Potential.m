%% Parameter 
clc;
clear all;
x_min = 0;
x_max = 60;
y_min = 0;
y_max = 30;
z_max = 5;
step  = 0.1;
%% Init
Xsqe=x_min:step:x_max;
Ysqe=y_min:step:y_max;
map=0*meshgrid(Xsqe,Ysqe);

%% obstacles
% x0,y0,sigmax,sigmay,A
obsPoint=[20 23 3 3 10,
          15 5 1 1 20];
% x_s,x_e,y_s,y_e,sigmax,sigmay,A
obsLine=[15 45 23 23 1.4 1.4 0.6,
         30 45 9 9 1.4 1.4 0.6];

for i=1:length(obsPoint(:,1))
    mp=Gauss2D(obsPoint(i,:),Xsqe,Ysqe);
    map=SumPotential(z_max,mp,map);
end
for i=1:length(obsLine(:,1))
    mp=LineGauss2D(obsLine(i,:),Xsqe,Ysqe,step);
    map=SumPotential(z_max,mp,map);
end

%% Result
figure(1);
mesh(Xsqe,Ysqe,map);
% contour(Xsqe,Ysqe,map,z_max)
xlabel('${x}(m)$','fontsize',18,'interpreter','latex');
ylabel('${y}(m)$','fontsize',18,'interpreter','latex');
zlabel('${z}$','fontsize',18,'interpreter','latex');
title('Potential~Field','fontsize',18,'interpreter','latex');
set(gca,'FontSize',18);
axis([x_min x_max y_min y_max 0 z_max]);
axis equal;
colorbar

figure(2);
hold on;
viewK=10;
[gx,gy] = gradient(map);
contour(Xsqe,Ysqe,map,z_max);
quiver(Xsqe,Ysqe,viewK*gx,viewK*gy);
xlabel('${x}(m)$','fontsize',18,'interpreter','latex');
ylabel('${y}(m)$','fontsize',18,'interpreter','latex');
zlabel('${z}$','fontsize',18,'interpreter','latex');
title('Gradient','fontsize',18,'interpreter','latex');
set(gca,'FontSize',18);
axis([x_min x_max y_min y_max]);
axis equal;
