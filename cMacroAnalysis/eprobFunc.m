function c = eprobFunc(x)
% PLPLOT visualizes a power-law distributional model with empirical data.
%    Source: http://www.santafe.edu/~aaronc/powerlaws/
% 
%    PLPLOT(x, xmin, alpha) plots (on log axes) the data contained in x 
%    and a power-law distribution of the form p(x) ~ x^-alpha for 
%    x >= xmin. For additional customization, PLPLOT returns a pair of 
%    handles, one to the empirical and one to the fitted data series. By 
%    default, the empirical data is plotted as 'bo' and the fitted form is
%    plotted as 'k--'. PLPLOT automatically detects whether x is composed 
%    of real or integer values, and applies the appropriate plotting 
%    method. For discrete data, if min(x) > 50, PLFIT uses the continuous 
%    approximation, which is a reliable in this regime.
%
%    Example:
%       xmin  = 5;
%       alpha = 2.5;
%       x = xmin.*(1-rand(10000,1)).^(-1/(alpha-1));
%       h = plplot(x,xmin,alpha);
%
%    For more information, try 'type plplot'
%
%    See also PLFIT, PLVAR, PLPVA

% Version 1.0   (2008 February)
% Copyright (C) 2008-2011 Aaron Clauset (Santa Fe Institute)
% Distributed under GPL 2.0
% http://www.gnu.org/copyleft/gpl.html
% PLFIT comes with ABSOLUTELY NO WARRANTY
% 
% No notes
% 

% reshape input vector
x = reshape(x,numel(x),1);
% initialize storage for output handles
% h = zeros(2,1);

% select method (discrete or continuous) for plotting
if     isempty(setdiff(x,floor(x))), f_dattype = 'INTS';
elseif isreal(x),    f_dattype = 'REAL';
else                 f_dattype = 'UNKN';
end
if strcmp(f_dattype,'INTS') && min(x) > 50
    f_dattype = 'REAL';
end

% estimate xmin and alpha, accordingly
switch f_dattype
    
    case 'REAL'
        n = length(x);
        c = [sort(x) (n:-1:1)'./n];

    case 'INTS'
        n = length(x);        
        q = unique(x);
        c = hist(x,q)'./n;
        c = [[q; q(end)+1] 1-[0; cumsum(c)]]; c(c(:,2)<10^-10,:) = [];

    otherwise
        fprintf('Error: x must contain only reals or only integers.\n');
        return;
end

