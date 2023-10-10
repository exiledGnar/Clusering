% 读取Excel文件的指定列
filename = 'C:/Users/Yahoo/Desktop/临时文件夹/模式识别第二次作业/2023年模式识别与机器学习数据集汇总.xls'; % 替换为实际的文件路径和文件名
sheet = 1; % Excel文件中的工作表索引
columnRange = 'C:F'; % 要读取的列范围，这里是第2、3、4和5列
data = readmatrix(filename, 'Sheet', sheet, 'Range', columnRange);
data = data(2:end, :);%去掉第一行的文字

%%
%去除异常数据
% 设置条件
condition = (data(:, 1) > 200)|(data(:, 1) < 150);  % 身高
% 根据条件删除行
data(condition, :) = [];
% 设置条件
condition = (data(:, 2) > 100)|(data(:, 2) < 45);  % 体重
% 根据条件删除行
data(condition, :) = [];
% 设置条件
condition = (data(:, 3) > 11)|(data(:, 3) < 5);  % 50m
% 根据条件删除行
data(condition, :) = [];
% 设置条件
condition = (data(:, 4) > 6000)|(data(:, 4) < 2000);  % 肺活量
% 根据条件删除行
data(condition, :) = [];

%%
%归一化
% 要归一化的列索引
% 获取矩阵的列数
numColumns = size(data, 2);

% 对每一列进行归一化
% 指定归一化范围
minRange = 0;
maxRange = 1;

% 对每一列进行归一化
for col = 1:4
    columnData = data(:, col);  % 获取当前列的数据
    minVal = min(columnData);     % 获取当前列的最小值
    maxVal = max(columnData);     % 获取当前列的最大值
    normalizedColumn = (columnData - minVal) / (maxVal - minVal) * (maxRange - minRange) + minRange;  % 归一化当前列到指定范围
    data(:, col) = normalizedColumn;  % 将归一化后的列数据替换回原矩阵
end

% 显示归一化后的矩阵
%disp(data);

