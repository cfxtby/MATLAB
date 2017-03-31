function theta=Newton(x,y)
x=x';
m = size(x, 1);
n = size(x, 2) + 1;

%add x_0
x = [ones(m,1), x];

positive = find(y == 1);%positives
negative = find(y == 0);%negatives

%plot data
figure
plot(x(positive, 2), x(positive, 3),'r+');
hold on;
plot(x(negative, 2), x(negative, 3),'go');
legend('Admitted','Not Admitted');

% first iteration
theta = zeros(n, 1);%initialization
z = x * theta;
h = ones(m,1)./(1 + exp(-z));%logistic model
cost_function_pre = sum(y .* log(h)+(1-y).*log(ones(m,1)-h), 1);%likelihood function

%compute first-derivation and second derivation
G = zeros(n , 1);
H = zeros(n, n);
for i = 1:n
    dif = y - h;
    G(i) = sum(dif.* x(:, i), 1)/m;

    const_sum = h.*(ones(m,1)-h);
    for j = 1:n
        H(i,j) = -sum(const_sum.* x(:, i).*x(:,j), 1)/m;
    end
end
theta = theta - pinv(H)*G;%update theta

% second iteration
z = x * theta;
h = ones(m,1)./(1 + exp(-z));
cost_function = sum(y .* log(h)+(1-y).*log(ones(m,1)-h), 1);%likelihood

thred = 0.00001;
max_iter = 1500;
iters = 2;
while(abs(cost_function - cost_function_pre) >= thred && iters < max_iter)
    iters = iters + 1;
    cost_function_pre = cost_function;

    G = zeros(n , 1);
    H = zeros(n, n);
    for i = 1:n
        dif = y - h;
        G(i) = sum(dif.* x(:, i), 1)/m;

        const_sum = h.*(ones(m,1)-h);
        for j = 1:n
            H(i,j) = -sum(const_sum.* x(:, i).*x(:,j), 1)/m;
        end
    end
    theta = theta - pinv(H)*G;

    z = x * theta;
    h = ones(m,1)./(1 + exp(-z));
    cost_function = sum(y .* log(h)+(1-y).*log(ones(m,1)-h), 1);

    fprintf([num2str(iters) '; cost function:' num2str(cost_function) '\n']);
end

hold on;
x_axis = x(:,2);
y_axis = (-theta(1).*x(:,1) - theta(2).*x(:,2))/theta(3);
plot(x_axis, y_axis,'-');
legend('Training Data','Linear regression');

end