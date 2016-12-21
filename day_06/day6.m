function [errorCorr, origMsg] = day6
    input = readInput('day6_input.txt');
    errorCorr = '';
    origMsg = '';

    for i = 1 : length(input{1, 1})
        column = cellfun(@(x) x(i), input);
        errorCorr = [errorCorr, mode(column)];
        
        [uniqueA, ~, J] = unique(column);
        [~, l] = min(histc(J, 1 : numel(uniqueA)));
        origMsg = [origMsg, uniqueA(l)];
    end
end

function input = readInput(fileName)
    fId = fopen(fileName);
    input = textscan(fId, '%s', 'delimiter', '\n');
    fclose(fId);
    input = input{1, 1};
end