function pvalue = calpvalue(aucs, sigma)

% sigma
l = [1, -1];
% l * sigma * l'
% diff(aucs)
z = abs(diff(aucs)) / sqrt(l * sigma * l');

pvalue = 2 * (1 - normcdf(z, 0, 1));

end