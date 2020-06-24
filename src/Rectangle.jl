"""
    rectangle(f::Function, N::Number, a::Number, b::Number)

Numerically approximates:

``\\displaystyle\\int_a^b f(x) dx``

using the rectangle rule with ``N+1`` steps (including the endpoints). 
"""
function rectangle(f::Function, N::Number, a::Number, b::Number)
    N = convert(Int64, N);
    h = (b-a)/N;
    y = 0;
    x = a;
    for i=1:N+1
        y += h*f(x)
        if i < N+1
            x = x + h;
        end
    end
    return y
end