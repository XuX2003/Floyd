function [] = print_path(path, dist, i, j)
    if i == j
        disp('�����յ���ͬ���������������')
        return;
    end
    if path(i,j) == j   % �����ֿ���
    %��1����i��jû��·�����Ե���
        if dist(i,j) == Inf
            disp(['��',num2str(i),'��',num2str(j),'û��·�����Ե���'])
    %��2����i��j��ֱ�ӵ���
        else
            disp(['��',num2str(i),'��',num2str(j),'�����·��Ϊ'])
            disp([num2str(i),' ---> ',num2str(j)])
            disp(['��̾���Ϊ',num2str(dist(i,j))])
        end
    else  % �м侭�������ڵ㣺
        flag = path(i,j);
        result = [num2str(i), ' ---> '];
        while flag ~= j  % ֻҪk������j, ��һֱѭ����ȥ
            result = [result, num2str(flag), ' ---> ' ];
            flag = path(flag,j);
        end
        result = [result , num2str(flag)];
        disp(['��',num2str(i),'��',num2str(j),'�����·��Ϊ']);
        disp(result);
        disp(['��̾���Ϊ',num2str(dist(i,j))]);
    end
end