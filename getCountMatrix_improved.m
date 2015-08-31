function M = getCountMatrix_improved(data)
%GETCOUNTMATRIX constructs a matrix whose elements represent the number of
% each element value occurred in each class. The column represents the 
% element value in ascending order, the row represents the class whose 
% order is the same as data.c indicates.
% 
% The computational complexity of this function is NlogN, where N is the
% number of elements in data.x.
% 
% Edited by X. Sun.
% Version: 2014/6/6

% Check if the arguments are legal.
if(sum(data.c) ~= length(data.x(:)))
    error('The Input data are not matched with each other!');
end

% Get the number of classes
N = length(data.c);

% Sort the sequence with unique value and return the number of each element
[val, count, ~, si] = findsame(data.x);

% Get the number of unique values
nv = length(val);

% Construct the cumulate number sequence, which will be used to determine the
% class of each element is the sorted sequence
cumcount = cumsum(data.c);

% Construct the objective matrix
M = zeros(N, nv);

index = 1;
for i = 1 : nv
    for j = 1 : count(i)
        % Determine which class's respective element's number to increase 
        c = find(si(index) - cumcount <= 0);
        if length(c) >= 1
            M(c(1), i) = M(c(1), i) + 1;
        else
            error('Error happened!');
        end
        % Increase the index
        index = index + 1;
    end
end

end