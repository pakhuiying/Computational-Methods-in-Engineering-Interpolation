function [xmax,f_xmax] = golden(xlow,xupp, thresh, f,y0)
%golden = single variable optimisation function using golden ratio method
% fx = symbolic function f(x,y) to evaluate value given x and y
% y0 is the value to be held constant
% initialisation of variables
%xlow = lower bound of variable
%xupp = upper bound of variable
%tolerance is the threshold to terminate the loop

R = (sqrt(5) -1)/2; %golden ratio

l_o = xupp - xlow; %initialise initial range

d = R*l_o;

x_1 = xlow + d; %initialise x1

x_2 = xupp - d; %initialise x2

f_x_1 = f(x_1,y0); %evaluate function at x1

f_x_2 = f(x_2,y0); %evaluate function at x2

while (xupp - xlow > thresh) %stop when xupp - xlow<threshold

    if (f_x_2 > f_x_1)
        xupp = x_1; %eliminate [x_1,xupp], update xupp to be x_1
    else
        xlow = x_2; %eliminate [xlow,x_2], update xlow to be x_2
    end

    l_o = xupp - xlow; %update new distance between xupp and xlow
    d = R*l_o; %update new distance
    x_2 = xupp - d; %regenerate new x_2
    x_1 = xlow + d; %regenerate new x_1
    f_x_2 = f(x_2,y0); %evaluate function at new x_2
    f_x_1 = f(x_1,y0); %evaluate function at new x_1

end

xmax = xlow + (xupp - xlow)/2; %get x coord of maximum value

f_xmax = f(xmax,y0); %get maximum value
    
end
