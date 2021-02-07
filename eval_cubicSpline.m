function out = eval_cubicSpline(a,x,y,value)
%interpolate cubic spline based on a
%a = values of cubicSpline (2nd derivatives of interior points)
%x and y are input arrays
%value is the x values we want to interpolate between the segment
%out is the outputof the interpolation between the segment

n = length(x);
N = length(value);
out = zeros(1,N);
for v = 1:N
    for i = 2:n
        if (value(v) < x(i) && value(v) > x(i-1))
            a1 = a(i-1)*(x(i)-value(v))^3/(6*(x(i)-x(i-1)));
            a2 = a(i)*(value(v) - x(i-1))^3/(6*(x(i)-x(i-1)));
            a3 = (y(i-1)/(x(i)-x(i-1)) - a(i-1)*(x(i)-x(i-1))/6)*(x(i) - value(v));
            a4 = (y(i)/(x(i)-x(i-1)) - a(i)*(x(i)-x(i-1))/6)*(value(v) - x(i-1));
            out(1,v) = a1+a2+a3+a4;
        end

    end
end

end

