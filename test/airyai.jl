# AiryAi(x)
@testset "Airy Ai(x)" begin
    @test abs(rectangle(x -> airyai(x), 1e8, 0, 100) - 1.0/3.0) < 1e-6
    @test simpsons(x -> airyai(x), 1e6, 0, 100) ≈ 1.0/3.0
    @test trapezoidal(x -> airyai(x), 1e6, 0, 100) ≈ 1.0/3.0
    @test laguerre_quadrature(x -> airyai(x), 120, 1) ≈ 1.0/3.0
    @test legendre_quadrature(x -> airyai(x), 1000, 0, 100) ≈ 1.0/3.0
    @test chebyshev_quadrature(x -> airyai(x), 1, 100000, 0, 100) ≈ 1.0/3.0
    @test chebyshev_quadrature(x -> airyai(x), 2, 100000, 0, 100) ≈ 1.0/3.0
end