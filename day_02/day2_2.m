function bathroomCode = day2_2
    input = readFile('day2_input.txt');
    
    keyPad = {NaN, NaN, 1, NaN, NaN
              NaN,   2, 3, 4  , NaN
                5,   6, 7, 8  , 9
              NaN,  'A', 'B', 'C', NaN
              NaN, NaN, 'D', NaN, NaN};
    
    currentPos = [3, 1];
    bathroomCode = cell(1, size(input, 1));
    
    for i = 1 : size(input, 1)
        for j = 1 : length(input{i, 1})
            currentPos = moveInDirection(input{i, 1}(j), currentPos, keyPad);
        end
        bathroomCode{1, i} = keyPad{currentPos(1), currentPos(2)};
    end
end

function currentPos = moveInDirection(direction, currentPos, keyPad) 
    switch direction
        case 'U'
            go = [-1, 0];
        case 'D'
            go = [1, 0];
        case 'L'
            go = [0, -1];
        case 'R'
            go = [0, 1];
    end
    
    movedPos = handleOuterBounds(currentPos + go);
    
    if (isnan(keyPad{movedPos(1), movedPos(2)}))
        return
    else
        currentPos = movedPos;
        return
    end
end

function pos = handleOuterBounds(currentPos)
    if (currentPos(1) < 1)
        currentPos(1) = 1;
    end
    if (currentPos(1) > 5)
        currentPos(1) = 5;
    end
    if (currentPos(2) < 1)
        currentPos(2) = 1;
    end
    if (currentPos(2) > 5)
        currentPos(2) = 5;
    end
    
    pos = currentPos;
end


function input = readFile(fileName)
    fId = fopen(fileName);
    input = textscan(fId, '%s', 'delimiter', '\n');
    input = input{1, 1};
    fclose(fId);
end