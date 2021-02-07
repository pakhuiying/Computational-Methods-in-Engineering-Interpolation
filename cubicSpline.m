function a = cubicSpline(x,y)
%cubic spline function
%x and y are input arrays
%a = 2nd derivatives of interior points
n = length(x);
M = zeros(n); %matrix M to store second derivative coefficients
Y = zeros(1,n); %matrix Y to store y values
for i = 2:n-1 %iterate over interior points. excludes end points
    M(i,i-1) = x(i) - x(i-1);   
    M(i,i) = 2*(x(i+1) - x(i-1));
    M(i,i+1) = x(i+1) - x(i);
end   
    %to make it a sq matrix
M(1,1) = 1; %second deriv of start point = 0
M(n,n) = 1; %second deriv of end point = 0

for i = 2:n-1
    Y(1,i) = 6/(x(i+1) - x(i))*(y(i+1) - y(i)) + 6/(x(i) - x(i-1))*(y(i-1) - y(i));
end

a = M\Y';

end

