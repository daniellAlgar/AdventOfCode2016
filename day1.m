function blocksAway = day1
    input = load('day1_1_input.mat');
    path = input.ans;

    pathWalked = [0, 0];
    currentDir = 'N';

    for i = 1: length(path)
        move = regexp(path{i}, '\d+|\D', 'match');
        newDir = move{1};
        blocks = str2double(move{2});
        
        currentDir = updateCurrentDir(currentDir, newDir);
        
        if (strcmp(currentDir, 'N'))
                go = [0, 1];
            elseif (strcmp(currentDir, 'W'))
                go = [-1, 0];
            elseif (strcmp(currentDir, 'S'))
                go = [0, -1];
            elseif (strcmp(currentDir, 'E'))
                go = [1, 0];
        end
        
        for j = 1: blocks
            pathWalked(end + 1, 1 : 2) = pathWalked(end, 1 : 2) + go;
        end
    end
    
    blocksAway = abs(pathWalked(end, 1)) + abs(pathWalked(end, 2));
end

function currentDir = updateCurrentDir(lastDir, newDir)
    left = ['N'; 'W'; 'S'; 'E'];
    right = ['N'; 'E'; 'S'; 'W'];
    
    if (strcmp(newDir, 'L'))
        b = circshift(left, -find(left == lastDir));
    else
        b = circshift(right, -find(right == lastDir));
    end
    
    currentDir = b(1);
end