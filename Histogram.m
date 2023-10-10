% 准备数据
%data = data;

% 绘制直方图
histogram(data, 'BinWidth', 5);

% 设置横坐标和纵坐标的距离
xticks(0:5:max(data));
yticks(0:10:length(data));

% 添加标题和标签
title('男女生混合身高直方图');
xlabel('身高');
ylabel('频次');

% 显示图形