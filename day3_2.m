function nrOfTriangles = day3_2
    input = readInput('day3_input.txt');
    nrOfTriangles = 0;
    
    for i = 1 : 3 : length(input)
        triangle = input(i : i + 2, 1);
        if (triangle(1) + triangle(2) > triangle(3) && ...
            triangle(1) + triangle(3) > triangle(2) && ...
            triangle(2) + triangle(3) > triangle(1))
            nrOfTriangles = nrOfTriangles + 1;
        end
    end
end

function input = readInput(fileName)
    fId = fopen(fileName);
    raw = textscan(fId, '%d %d %d', 'delimiter', '\n');
    fclose(fId);
    input = cat(1, raw{1, 1}(:), raw{1, 2}(:), raw{1, 3}(:));
end