function [aucs, delongcov] = fastDeLong(samples)
%FASTDELONGCOV
%The fast version of DeLong's method for computing the covariance of 
%unadjusted AUC.
%% Reference:
% @article{sun2014fast,
%   title={Fast Implementation of DeLong's Algorithm for Comparing the Areas Under Correlated Receiver Operating Characteristic Curves},
%   author={Xu Sun and Weichao Xu},
%   journal={IEEE Signal Processing Letters},
%   volume={21},
%   number={11},
%   pages={1389--1393},
%   year={2014},
%   publisher={IEEE}
% }
%% [aucs, delongcov] = fastDeLong(samples)
%% 
% Edited by Xu Sun.
% Homepage: https://pamixsun.github.io
% Version: 2014/12
%%

if sum(samples.spsizes) ~= size(samples.ratings, 2) || numel(samples.spsizes) ~= 2
    error('Argument mismatch error');
end

z = samples.ratings;
m = samples.spsizes(1);
n = samples.spsizes(2);
x = z(:, 1 : m);
y = z(:, m + 1 : end);
k = size(z, 1);

tx = zeros(k, m);
ty = zeros(k, n);
tz = zeros(k, m + n);

for r = 1 : k
    tx(r, :) = midrank(x(r, :));
    ty(r, :) = midrank(y(r, :));
    tz(r, :) = midrank(z(r, :));
end

% tz

aucs = sum(tz(:, 1 : m), 2) / m / n - (m + 1) / 2 / n;

v01 = (tz(:, 1 : m) - tx(:, :)) / n;
v10 = 1 - (tz(:, m + 1 : end) - ty(:, :)) / m;

sx = cov(v01')';
sy = cov(v10')';

delongcov = sx / m + sy / n;

end