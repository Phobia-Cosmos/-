clc;clear;
A=readtable("蔬菜品类日定价.xlsx");
B=readtable("蔬菜品类日销量.xlsx");
date=table2array(A(:,1));
price=table2array(A(:,2:7));
sales_volume=table2array(B(:,2:7));
for i=1:6
price1=price(:,i);
sales_volume1=sales_volume(:,i);
figure()
plot(price1, sales_volume1,".",LineWidth=2,Color='k'); % 原始数据点
% 进行线性回归拟合
linearmodel=polyfit(price1,sales_volume1,1);
slope = linearmodel(1); % 斜率
intercept = linearmodel(2); % 截距
hold on;
price1_fit = 0:0.1:max(price1)+1; % 用于绘制回归线的 x 值范围
sales_volume1_fit = polyval(linearmodel, price1_fit); % 计算回归线上的 y 值
plot(price1_fit, sales_volume1_fit, 'r-',LineWidth=1.5,Color='b'); % 绘制回归线
hold off;
disp('回归方程：');
disp(['y = ' num2str(slope) ' * x + ' num2str(intercept)]);
end