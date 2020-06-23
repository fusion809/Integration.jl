function stepwise_simpsons(f, h, x, i, N)
    if i == 1 || i == N + 1
        return h / 3 * f(x)
    elseif (i % 2) == 1
        return 2 * h / 3 * f(x)
    else
        return 4 * h / 3 * f(x)
    end
end

"""
    simpsons(f, N, a, b)

Uses [Simpson's rule](http://mathworld.wolfram.com/SimpsonsRule.html) to approximate:

``\\displaystyle\\int_a^b f(x) dx``.

``N+1`` steps are used, if endpoints are included. 
"""
function simpsons(f, N, a, b)
    N = convert(Int64, N);
    h = (b-a)/N;
    y = 0;
    x = a;
    for i=1:N+1
        y = y + stepwise_simpsons(f, h, x, i, N);
        if i < N+1
            x = x + h;
        end
    end
    return y
end