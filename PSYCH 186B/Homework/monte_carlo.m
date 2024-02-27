function [within_circle,estimation_pi] = monte_carlo(n)
    within_circle = 0;
    for i = 1:n
        A = rand(1,2)*2-1;
        if A(1,1)^2+A(1,2)^2 <= 1
            within_circle = within_circle +1;
        end
    end
    estimation_pi = within_circle/n*4;
end