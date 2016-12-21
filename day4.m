function [sectorIdSum, words, val] = day4
    input = readInput('day4_input.txt');
    val = cell(0, 3);

    for i = 1 : length(input)
        [uniq, ~, J] = unique(input{i, 1});
        occ = histc(J, 1 : numel(uniq));
        [~, ind] = sort(occ, 'descend');
        
        if strcmp(uniq(ind(1 : 5)), input{i, 3})
            val{end + 1, 1} = input{i, 1};
            val{end, 2} = input{i, 2};
            val{end, 3} = input{i, 3};
        end
    end
    
    sectors = cellfun(@(x) str2double(x), val(:, 2), 'UniformOutput', false);
    sectorIdSum = sum([sectors{:}]);
    
    words = cell(0, 1);
    for i = 1 : size(val, 1)
        words{end + 1, 1} = shift(val{i, 1}, val{i, 2});
    end
end

function word = shift(string, sectorId)
    alph = 'abcdefghijklmnopqrstuvwxyz';
    word = '';
    
    for i = 1 : length(string)
        ind = find(alph == string(i));
        r = rem(str2double(sectorId) + ind, 26);
        if r == 0
            word = [word, alph(ind)];
        else
            word = [word, alph(r)];
        end
    end
end

function res = readInput(fileName)
    fId = fopen(fileName);
    input = textscan(fId, '%s', 'delimiter', '\n');
    fclose(fId);
    input = input{1, 1};
    
    res = cell(length(input), 3);
    
    for i = 1 : length(input)
        [~, ~, c] = regexp(input{i, 1}, '(.*)-(\d+)\[(.*)\]');
        res{i, 1} = strrep(input{i, 1}(1 : c{1, 1}(1, 2)), '-', '');
        res{i, 2} = input{i, 1}(c{1, 1}(2, 1) : c{1, 1}(2, 2));
        res{i, 3} = input{i, 1}(c{1, 1}(3, 1) : c{1, 1}(3, 2));
    end
end