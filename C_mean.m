%步骤1载入数据
%data = randn(700,4);
% 步骤2：初始化聚类中心
K = 2; % 聚类数
%centers = data(randperm(size(data, 1), K), :); % 随机选择K个样本作为初始聚类中心
% 步骤3：迭代更新聚类中心
maxIterations = 100; % 最大迭代次数
for iter = 1:maxIterations
    % 计算每个样本到每个聚类中心的距离
    distances = pdist2(data, centers);
    
    % 分配样本到最近的聚类中心
    [~, assignments] = min(distances, [], 2);
    
    % 更新聚类中心的位置
    for k = 1:K
        centers(k, :) = mean(data(assignments == k, :));
    end
    
    % 检查聚类中心是否收敛
    if iter > 1 && isequal(assignments, prevAssignments)
        break;
    end
    
    prevAssignments = assignments;
end%迭代过程

% 步骤4：显示结果
disp("聚类中心：");
disp(centers);
disp("样本分配：");
disp(assignments);

% 可视化聚类结果，彩色代表肺活量,不同类别用不同形状表示
hold on;
for k = 1:K
    idx = assignments == k;
    if k == 1
        scatter3(data(idx, 1), data(idx, 2), data(idx, 3), 50, data(idx, 4), 'o', 'filled');
   %elseif k == 2
        %scatter3(data(idx, 1), data(idx, 2), data(idx, 3), 50, data(idx, 4), 'd', 'filled');
   %elseif k == 3
        %scatter3(data(idx, 1), data(idx, 2), data(idx, 3), 50, data(idx, 4), '+', 'filled');
   %elseif k == 4
      %scatter3(data(idx, 1), data(idx, 2), data(idx, 3), 50, data(idx, 4), '^', 'filled');

    else
        scatter3(data(idx, 1), data(idx, 2), data(idx, 3), 50, data(idx, 4), 's', 'filled');
    end
end%可视化过程
hold off;
colormap jet;
colorbar;
xlabel('身高');
ylabel('体重');
zlabel('50m成绩');
title('C均值聚类结果可视化');