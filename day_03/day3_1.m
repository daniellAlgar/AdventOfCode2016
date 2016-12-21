function nValidTriangles = day3_1
    input = readInput('day3_input.txt');
    nValidTriangles = 0;
    
    for i = 1 : size(input, 1)
        if (input(i, 1) + input(i, 2) > input(i, 3) && ...
            input(i, 1) + input(i, 3) > input(i, 2) && ...
            input(i, 2) + input(i, 3) > input(i, 1))
            nValidTriangles = nValidTriangles + 1;
        end
    end
end

function input = readInput(fileName)
    fId = fopen(fileName);
    input = textscan(fId, '%d %d %d', 'delimiter', '\n');
    input = [input{1, 1}, input{1, 2}, input{1, 3}];
    fclose(fId);
end