function [xmax,ymax,fmax, cache] = gradAscent(h0, h1, f, x0,y0, thresh)
    %gradient ascent implemented recursively
    %h0, h1 represents choosing 2 h values arbitrarily
    %f = function f(x,y)
    %x0,y0 starting values
    %thres = threshold for termination
    %cache is a matrix that stores the intermediate values of the step. 
    %For cache, rows represent the number of steps. Columns represent the x,y,f(x,y) values of the steps
    syms x y
    dx = matlabFunction(diff(f,x)); %diff wrt x
    dy = matlabFunction(diff(f,y)); %diff wrt y

    %gradient evaluated at starting point
    dx_start = dx(x0,y0);
    dy_start = dy(x0,y0);


    z = f(x0,y0); %evaluate height of function at starting point
    
    cache = [x0,y0,z]; %initialise cache with starting values

    
    while (abs(dx_start) > thresh && abs(dy_start) > thresh)
           
        syms h %h is a parameter which is a measure of distance from starting pt
        x_h = matlabFunction(x0 + dx_start*h); %x as a function of h
        y_h = matlabFunction(y0 + dy_start*h); %y as a function of h

        %get xupp and xlow for 2 h values
        x_range = x_h([h0,h1]);
    
        if (x_range(1) < x_range(2))
            xlow = x_range(1);
            xupp = x_range(2);
        else
            xlow = x_range(2);
            xupp = x_range(1);
        end 

        %compute max x value for a given y0 using golden ratio
        [xmax_temp, f_xmax_temp] = golden(xlow,xupp, thresh, f, y0);
       

        %get xupp and xlow for 2 h values
        y_range = y_h([h0,h1]);

        if (y_range(1) < y_range(2))
            ylow = y_range(1);
            yupp = y_range(2);
        else
            ylow = y_range(2);
            yupp = y_range(1);
        end 
        

        %compute max y value given the xmax using golden ratio
        [ymax_temp, f_ymax_temp] = golden(ylow,yupp, thresh, f, xmax_temp);
        

        cache_temp = [xmax_temp, ymax_temp, f(xmax_temp,ymax_temp)];
        cache = [cache; cache_temp];

        x0 = xmax_temp;
        y0 = ymax_temp;
        
        dx_start = dx(x0,y0);
        dy_start = dy(x0,y0);
        

    end

    xmax = x0;
    ymax = y0;
    
    fmax = f(x0,y0);

    
end