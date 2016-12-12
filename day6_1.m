function errorCorr = day6_1
    input = readInput('day6_input.txt');
    errorCorr = '';

    for i = 1 : length(input{1, 1})
        errorCorr = [errorCorr, mode(cellfun(@(x) x(i), input))];
    end
end

function input = readInput(fileName)
    fId = fopen(fileName);
    input = textscan(fId, '%s', 'delimiter', '\n');
    fclose(fId);
    input = input{1, 1};
end