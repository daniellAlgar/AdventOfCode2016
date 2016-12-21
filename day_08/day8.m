function [nrOfLitPixels, screen] = day8_1
    input = readInput('day8_input.txt');
    screen = false(6, 50);

    for i = 1 : length(input)
        if ~isempty(strfind(input{i, 1}, 'rect'))
            [rows, cols] = parseRect(input{i, 1});
            screen(1: rows, 1: cols) = true;
        else 
            screen = parseRotate(input{i, 1}, screen);
        end
    end
    
    nrOfLitPixels = sum(screen(:));
end

function [rows, cols] = parseRect(rect)
    [~ ,~ ,~, d] = regexp(rect, '(\d+)x(\d+)', 'match');
    cols = str2double(rect(d{1, 1}(1, 1) : d{1, 1}(1, 2)));
    rows = str2double(rect(d{1, 1}(2, 1) : d{1, 1}(2, 2)));
end

function screen = parseRotate(rotate, screen)
    [~, ~, ~, d] = regexp(rotate, '(\d)+$', 'match');
    steps = str2double(rotate(d{1, 1}(1, 1) : d{1, 1}(1, 2)));

    if (~isempty(strfind(rotate, 'row'))) 
        [~, ~, ~, d] = regexp(rotate, 'rotate row y=(\d+)', 'match');
        y = str2double(rotate(d{1, 1}(1, 1): d{1, 1}(1, 2)));
        screen(y + 1, :) = circshift(screen(y + 1, :), [0, steps]);
    else
        [~, ~, ~, d] = regexp(rotate, 'rotate column x=(\d+)', 'match');
        x = str2double(rotate(d{1, 1}(1, 1) : d{1, 1}(1, 2)));
        screen(:, x + 1) = circshift(screen(:, x + 1), [steps, 0]);
    end
end

function input = readInput(fileName)
    fId = fopen(fileName);
    input = textscan(fId, '%s', 'delimiter', '\n');
    fclose(fId);
    input = input{1, 1};
end