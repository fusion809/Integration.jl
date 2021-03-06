# Gaussian curve test
printstyled("Integrate exp(-x^2) from minus infinity to positive infinity and comparing the result to the analytical solution, sqrt(pi)\n"; color = :red)
@testset "Gaussian" begin
    printstyled("Running: adaptive_simpsons_rule with ε=1e-7\n"; color = :magenta)
    @time @test adaptive_simpsons_rule(x -> exp(-x^2), -100, 100, 1e-7) ≈ sqrt(pi)
    printstyled("Running: chebyshev_quadrature with k=1\n"; color = :magenta)
    @time @test chebyshev_quadrature(x -> exp(-x^2), 433, 1, -100, 100) ≈ sqrt(pi)
    printstyled("Running: chebyshev_quadrature with k=2\n"; color = :magenta)
    @time @test chebyshev_quadrature(x -> exp(-x^2), 432, 2, -100, 100) ≈ sqrt(pi)
    printstyled("Running: chebyshev_quadrature with k=3\n"; color = :magenta)
    @time @test chebyshev_quadrature(x -> exp(-x^2), 216, 3, -100, 100) ≈ sqrt(pi)
    printstyled("Running: chebyshev_quadrature with k=4\n"; color = :magenta)
    @time @test chebyshev_quadrature(x -> exp(-x^2), 216, 4, -100, 100) ≈ sqrt(pi)
    printstyled("Running: hermite_quadrature with k=2\n"; color = :magenta)
    @time @test hermite_quadrature(x -> 1.0, 1, 2) ≈ sqrt(pi)
    printstyled("Running: jacobi_quadrature with α=β=1\n"; color = :magenta)
    @time @test jacobi_quadrature(x -> exp(-x^2), 87019, 1, 1, -100, 100) ≈ sqrt(pi)
    # Laguerre integrates over [0, inf], so result must be
    # multiplied by 2
    printstyled("Running: laguerre_quadrature (results multiplied by 2, as laguerre only integrates over the semi-infinite domain)\n"; color = :magenta)
    @time @test laguerre_quadrature(x -> 2*exp(-x^2), 46, 1) ≈ sqrt(pi)
    printstyled("Running: legendre_quadrature\n"; color = :magenta)
    @time @test legendre_quadrature(x -> exp(-x^2), 433, -100, 100) ≈ sqrt(pi)
    printstyled("Running: lobatto_quadrature\n"; color = :magenta)
    @time @test lobatto_quadrature(x -> exp(-x^2), 434, -100, 100) ≈ sqrt(pi)
    printstyled("Running: radau_quadrature\n"; color = :magenta)
    @time @test radau_quadrature(x -> exp(-x^2), 349, -100, 100) ≈ sqrt(pi)
    printstyled("Running: rectangle_rule_left\n"; color = :magenta)
    @time @test rectangle_rule_left(x -> exp(-x^2), 276, -100, 100) ≈ sqrt(pi)
    printstyled("Running: rectangle_rule_midpoint\n"; color = :magenta)
    @time @test rectangle_rule_midpoint(x -> exp(-x^2), 276, -100, 100) ≈ sqrt(pi)
    printstyled("Running: rectangle_rule_right\n"; color = :magenta)
    @time @test rectangle_rule_right(x -> exp(-x^2), 276, -100, 100) ≈ sqrt(pi)
    printstyled("Running: rombergs_method\n"; color = :magenta)
    @time @test rombergs_method(x -> exp(-x^2), 12, -100, 100) ≈ sqrt(pi)
    printstyled("Running: simpsons_rule\n"; color = :magenta)
    @time @test simpsons_rule(x -> exp(-x^2), 268, -100, 100) ≈ sqrt(pi)
    printstyled("Running: simpsons38_rule\n"; color = :magenta)
    @time @test simpsons38_rule(x -> exp(-x^2), 780, -100, 100) ≈ sqrt(pi)
    printstyled("Running: trapezoidal_rule\n"; color = :magenta)
    @time @test trapezoidal_rule(x -> exp(-x^2), 276, -100, 100) ≈ sqrt(pi)
end
