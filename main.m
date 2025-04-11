%% 随机生成一个digraph
% V = 5;
% dist = inf(V); % 初始化距离矩阵 主对角线为0，其余为inf
% path = zeros(V); % 初始化路径矩阵 主对角线为-1，其余为所在列的索引
% for i = 1: V
%    path(:, i) = i;
% end
% for i = 1: V
%     for j = 1: V
%         if i ~= j
%             if rand > 0.5
%                 dist(i, j) = randi(10); % 赋一个10以内的权重
%             else
%                 continue
%             end
%         else
%             path(i, j) = -1;
%             dist(i, j) = 0;
%         end
%     end
% end
V = input('请输入节点个数：');
dist = input('请输入邻接距离矩阵：');
% dist = [0 1 -3 2 -4; 3 0 -4 1 -1; 7 4 0 5 3; 2 -1 -5 0 -2; 8 5 1 6 0];
origin = input('请输出起点：');
destination = input('请输出终点：');
path = zeros(V); % 初始化路径矩阵 主对角线为-1，其余为所在列
for i = 1: V
   path(:, i) = i;
end
for i = 1: V
    for j = 1: V
        if i == j 
            path(i, j) = -1;
        else
            continue
        end
    end
end
%% Floyd_algorithm
for k = 1: V
    for i = 1: V
        for j = 1: V
            if dist(i, j) > dist(i, k) + dist(k, j) % 如果i,j两个节点间的最短距离大于i和k的最短距离+k和j的最短距离
                dist(i, j) = dist(i, k) + dist(k, j); % 那么我们就令这两个较短的距离之和取代i,j两点之间的最短距离
                path(i, j) = path(i, k); % 起点为i，终点为j的两个节点之间的最短路径要经过的节点更新为path(i,k)
            else
                continue
            end
        end
    end
end
print_path(path, dist, origin, destination);
