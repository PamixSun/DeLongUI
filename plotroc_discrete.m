function plotroc_discrete(samples)
%PLOTEOC_DISCRETE
% Guven samples drawn from continuous and/or discete distrbutions, 
% plot ROC curves.
% 
% Edited by X. Sun.
% 2014/12

k = size(samples.ratings, 1);
linecolor = get(gca,'colororder');
linecolorindex = repmat(1 : size(linecolor, 1), ...
    1, ceil(k / size(linecolor, 1)));
linecolorindex = linecolorindex(1 : k);

data.c = samples.spsizes;
m = data.c(1);
n = data.c(2);
for i = 1 : k
    data.x = samples.ratings(i, :);
    M = getCountMatrix_improved(data);
    M = flip(M, 2);
    tpr = cumsum(M(1, :)) / m;
    fpr = cumsum(M(2, :)) / n;
    plot(fpr, tpr, 'Color', linecolor(linecolorindex(i), :));
    hold on;
end
hold off;
axis equal;
axis([0, 1, 0, 1]);
xlabel('FPR');
ylabel('TPR');

end