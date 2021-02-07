function [B,F] = newton(x,y)
%newton interpolation function
%x is a cell array of 1xn that contains tuples of coordinates
%y is an array
%array B that contains b0, b1...,bn coefficients
B = [y(1)]; %to store intermediate values of recursion.
%initialise B with f(x0)
Fx = newton_recursive(x,y);
B(end + 1) = Fx;

    function fx = newton_recursive(x,y)
        n = length(y);
        if (n == 2) %base case of recursion
            fx = (y(n) - y(n-1))/(x{1,n}(2) - x{1,n-1}(1));
        else
            f = zeros(1,n-1); %store all fx values
            X = cell(1,n-1); %store x divided difference as a tuple in cell
            
            for i=1:n-1
                f(i) = (y(i+1) - y(i))/(x{1,i+1}(2) - x{1,i}(1));
                X{1,i} = [x{1,i}(1), x{1,i+1}(2)]; %get range of x values
            end
            
            B(end+1) = f(1); %store first number of every fx
            fx = newton_recursive(X,f); %repeat operation recursively
        end
        
    end


end

