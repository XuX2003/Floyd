function [] = print_path(path, dist, i, j)
    if i == j
        disp('起点和终点相同，请检查后重新输入')
        return;
    end
    if path(i,j) == j   % 分两种可能
    %（1）从i到j没有路径可以到达
        if dist(i,j) == Inf
            disp(['从',num2str(i),'到',num2str(j),'没有路径可以到达'])
    %（2）从i到j可直接到达
        else
            disp(['从',num2str(i),'到',num2str(j),'的最短路径为'])
            disp([num2str(i),' ---> ',num2str(j)])
            disp(['最短距离为',num2str(dist(i,j))])
        end
    else  % 中间经过其他节点：
        flag = path(i,j);
        result = [num2str(i), ' ---> '];
        while flag ~= j  % 只要k不等于j, 就一直循环下去
            result = [result, num2str(flag), ' ---> ' ];
            flag = path(flag,j);
        end
        result = [result , num2str(flag)];
        disp(['从',num2str(i),'到',num2str(j),'的最短路径为']);
        disp(result);
        disp(['最短距离为',num2str(dist(i,j))]);
    end
end