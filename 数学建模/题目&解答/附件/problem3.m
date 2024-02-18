clc;clear;
A=readtable("49类单品-历史日定价.xlsx");
B=readtable("49类单品-历史日销量.xlsx");
date=[table2array(A(2:end,1))];
price=[table2array(A(2:end,2:end))];
sales_volume=[table2array(B(2:end,2:end))];
num=[];
for i=1:49
price1=price(:,i);
sales_volume1=sales_volume(:,i);
price1(find(isnan(price1)))=[];
sales_volume1(find(isnan(sales_volume1)))=[];
linearmodel=polyfit(price1,sales_volume1,1);
slope = linearmodel(1); % 斜率
intercept = linearmodel(2); % 截距
hold on;
price1_fit = 0:0.1:max(price1)+1; % 用于绘制回归线的 x 值范围
sales_volume1_fit = polyval(linearmodel, price1_fit); % 计算回归线上的 y 值
%plot(price1_fit, sales_volume1_fit, 'r-',LineWidth=1.5,Color='b'); % 绘制回归线
hold off;
% disp('回归方程：');
disp(['y = ' num2str(slope) ' * x + ' num2str(intercept)]);
end