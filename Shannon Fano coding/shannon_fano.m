% Ranges and frequencies :
ranges = [1 30; 31 59; 60 63; 64 100; 101 130; 131 159; 160 200; 201 255];
freq = [2048, 2048, 2048, 2048, 819, 819, 3277, 3277];
prob = freq / sum(freq); 

% Probabilities and ranges sorted in descending order :
[prob, idx] = sort(prob, 'descend');
ranges = ranges(idx, :);

% Codes and cumulative probabilities :
codes = cell(1, length(prob));

% Shannon-Fano coding :
for i = 1:length(prob)
    if i == 1
        codes{i} = '0';
    elseif i == length(prob)
        codes{i} = '1';
    else
        if mod(i, 2) == 0
            codes{i} = strcat(codes{i-1}, '1');
        else
            codes{i} = strcat(codes{i-1}, '0');
        end
    end
end

% Result :
for i = 1:length(codes)
    fprintf('Range: %d-%d, Code: %s\n', ranges(i, 1), ranges(i, 2), codes{i});
end
