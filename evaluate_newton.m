function fx = evaluate_newton(value,x, B)
%evaluate newton's divided difference interpolating polynomial
%value = the x values array we want to interpolate
%x is an array
%B = output from newton function
n = length(x);
N = length(value);
fx = zeros(1,N);

for v = 1:N
    X = zeros(1,n-1); %initialise X with 1, not multiplying with any x
    x_product = 1;

    for i = 1:n-1
        x_product = x_product * (value(v) - x(i));
        X(1,i) = x_product;
    end

    X = [1, X];

    fx(v) = B*X';
end



end

