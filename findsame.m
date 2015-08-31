function [ val, count, x, xi] = findsame( x )
%FINDSAME for the array x returns the same values as in x but
%with no repetitions and the number of these values in the
%original array.
%%   [ val count ] = findsame( x )
%%  Input:
%   x - the original array or string
%%  Output:
%   val - the same value as in x with no repetition
%   count - the number of the coresponding value of val in the original
%   array x
%%  Running these code to get some examples:
%x = [1:10 2:9 3:8 4:7 5:6];
%[val count] = findsame(x)
%x = [1:4; 2:5; 3:6];
%[val count] = findsame(x)
%x = 'accdddbb';
%[val count] = findsame(x)
%%  Edited by X. Sun
%   My homepage: http://pamixsun.github.io
%%

if nargin < 1
    error(message('MATLAB:UNIQUE:NotEnoughInputs'));
end
nOut = nargout;
numelX = numel(x);

% Convert to double array for purposes of faster sorting.
% Additionally, FINDSAME calls DIFF, which requires double input.
whichclass = class(x);
isdouble = strcmp(whichclass, 'double');

if ~isdouble
    x = double(x);
end

% Sort if unsorted.  Only check this for long lists.

% checksortcut = 1000;
% 
% if numelX <= checksortcut || ~(issorted(x))
%     [x xi] = sort(x(:));
% else
%     x = x(:);
% end

[x, xi] = sort(x(:));

% Get the the same values as in x but without repetitions
indx = find(diff([x; x(end)+1]) ~= 0);
val = x(indx)';

% Create count if needed.
if nOut > 1
    count = diff([0; indx])';
end

% Re-convert to correct output data type using FEVAL.
if ~isdouble
    val = feval(whichclass, val);
end

end

