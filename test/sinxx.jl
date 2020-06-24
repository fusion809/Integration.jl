# sin(x)/x function
function sinxx(x)
    return sinc(x/pi);
end

sol_8 = 1.562225466889056293352345138804502677227824980541083456384;

@testset "sinxx" begin
    @test abs(rectangle(sinxx, 1e8, 0, 100) - sol_8) < 1e-6
    @test simpsons(sinxx, 100000, 0, 100) ≈ sol_8
    @test trapezoidal(sinxx, 100000, 0, 100) ≈ sol_8
    @test legendre_quadrature(sinxx, 1e8, 0, 100) ≈ sol_8
    @test chebyshev_quadrature(sinxx, 1, 100000, 0, 100) ≈ sol_8
    @test chebyshev_quadrature(sinxx, 2, 100000, 0, 100) ≈ sol_8
end