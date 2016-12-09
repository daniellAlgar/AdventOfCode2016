function bathroomCode = day2_1
    input = readFile('day2_input.txt');
    
    keyPad = [1, 2, 3
              4, 5, 6
              7, 8, 9];
    currentPos = [2, 2];
    bathroomCode = zeros(1, size(input, 1));
    
    for i = 1 : size(input, 1)
        for j = 1 : length(input{i, 1})
            currentPos = currentPos + moveInDirection(input{i, 1}(j));
            if (currentPos(1) < 1)
                currentPos(1) = 1;
            end
            if (currentPos(1) > 3)
                currentPos(1) = 3;
            end
            if (currentPos(2) < 1)
                currentPos(2) = 1;
            end
            if (currentPos(2) > 3)
                currentPos(2) = 3;
            end
        end
        bathroomCode(1, i) = keyPad(currentPos(1), currentPos(2));
    end    
end

function go = moveInDirection(direction) 
    switch direction
        case 'U'
            go = [-1, 0]; return
        case 'D'
            go = [1, 0]; return
        case 'L'
            go = [0, -1]; return
        case 'R'
            go = [0, 1];
    end
end

function input = readFile(fileName)
    fId = fopen(fileName);
    input = textscan(fId, '%s', 'delimiter', '\n');
    input = input{1, 1};
    fclose(fId);
end