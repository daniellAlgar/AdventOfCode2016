function blocksAway = day1_2
    [~, pathWalked] = day1_1;
    
    pathWalkedLength = length(pathWalked) - 1;
    
    for i = 1 : pathWalkedLength
        currentCoord = pathWalked(i, 1 : 2);
        for j = i + 1 : pathWalkedLength
            if (isequal(currentCoord, pathWalked(j, 1 : 2)))
                blocksAway = abs(currentCoord(1)) + abs(currentCoord(2));
                return
            end
        end
    end 
end