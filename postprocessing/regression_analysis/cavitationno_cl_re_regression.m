clear; clc; close all;
%% Find the functional expression for cavitation number in terms of coefficient of lift and Reynolds number
%x1 - Coefficient of lift
%x2 - Reynolds number
%y - Cavitation number

x1 = [0.2255; 0.2259; 0.2357; 0.2404; 0.2411; 0.2415; 0.2406]; %x1 - Coefficient of lift
x2 = [523598.2818; 560270.5956; 603054.7681; 704922.2547; 770117.1951; 841424.4594; 937179.8544]; %x2 - Reynolds number
y = [2.2707; 2.2973; 2.33333; 2.43243; 2.51351; 2.61261; 2.77477]; %y - Cavitation number

Y = log(y);
X1 = log(x1);
X2 = log(x2);

X = [X1 X2];
[B,~,~,~,STATS] = regress(Y,X);

alpha = B(1);
beta = B(2);

term1 = x1.^alpha;
term2 = x2.^beta;
xgiven = term1.*term2;

plot(xgiven,y,'*m');

cl_range = linspace(min(x1),max(x1),100);
re_range = linspace(min(x2),max(x2),100);

term1_model = cl_range.^alpha;
term2_model = re_range.^beta;


ymodel = term1_model.*term2_model;
hold on;
plot(ymodel,ymodel)
axis square;
xlabel_str = ['$c_l^{' num2str(alpha) '}Re^{' num2str(beta) '}$'];
xlabel(xlabel_str,'interpreter','latex');
ylabel('$\sigma_i$','interpreter','latex');