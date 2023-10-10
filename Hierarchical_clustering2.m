% 假设有一个包含多个四维向量的矩阵 data
%data = data; % 填入实际的数据

% 使用分级聚类算法进行聚类
distMatrix = pdist(data); % 计算样本点之间的距离矩阵
linkageMatrix = linkage(distMatrix, 'complete');
% 使用平均连接方法构建聚类树(修改'average'、‘complete’、'single'可以实现平均连接，全连接（最远）、单连接（最近）)

% 可视化聚类过程的树状图
figure;
dendrogram(linkageMatrix, 0); %本来只显示30个样本，调整后面参数为0显示完整的树状图

% 设置图形属性
title('分级聚类');
xlabel('样本点');
ylabel('距离');