using Test

@testset "using_MyModule_foo" begin
    using MyModule: foo
    foo()
    @test_throws UndefVarError bar()
    @test_throws UndefVarError baz()
    @test_throws UndefVarError MyModule.baz()
end

@testset "using_MyModule" begin
    using MyModule
    foo()
    baz()
    @test_throws UndefVarError bar()
    MyModule.bar()
end

@testset "using_LinearAlgebra" begin
    using LinearAlgebra
    LinearAlgebra
    lu
    @test parentmodule(lu) == LinearAlgebra
end

@testset "using_lu" begin
    using LinearAlgebra: lu
    lu
    @test_throws UndefVarError LinearAlgebra
    @test_throws UndefVarError LinearAlgebra.svd
    using LinearAlgebra: LinearAlgebra, lu
    lu
    LinearAlgebra
    LinearAlgebra.svd
end

@testset "conflicting_identifier_1" begin
    using LinearAlgebra
    #@test_throws ErrorException qr = false # doesn't throw
    #qr = false # this is possible in this test
    @test parentmodule(qr) == LinearAlgebra

    using MyModule
    @test parentmodule(qr) == LinearAlgebra
    @test_throws MethodError qr(3, 5)
end

@testset "conflicting_identifier_2" begin
    using MyModule
    @test parentmodule(qr) == MyModule
    @test qr(3, 5) == false

    using LinearAlgebra
    @test parentmodule(qr) == MyModule
end
