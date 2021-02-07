function A = polyInterp(x,y,m)
%polynomial interpolation function
%   x,y are input vectors of x and y values
% output matrix A with coefficients of a
% m = highest order of x
n = length(x);

X = zeros(m+1,m+1); %matrix for storing coefficients of a

Y = zeros(m+1,1); %matrix for storing yx

for i = 0:m %compute first row of X (power 0 to m)
    sum_x = 0;
    for j = 1:n %sum through the length of x
        sum_x = sum_x + x(j)^i;
    end    
    X(1,i+1) = sum_x;
end

%compute rest of the rows using prev row values to avoid recomputation

for i = 2:m+1 %row index. start from row 2 as row 1 has been computed
    for j = 1:m+1 %column index
        if (j+1 > m+1) %if value is not found in prev row
            sum_x = 0;
            power = i+(m-1); %get the power
            for k = 1:n
                sum_x = sum_x + x(k)^power;
            end
            X(i,j) = sum_x;
        else
            X(i,j) = X(i-1,j+1); %if value can be found in prev row, take prev row
        end
    end
end



for j = 0:m %iterate through powers
    sum_y = 0;
    for k = 1:n %sum through the length of x and y
        sum_y = sum_y + x(k)^j*y(k);
    end
    Y(j+1,1) = sum_y;
end

A = X\Y;

end

