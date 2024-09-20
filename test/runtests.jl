using MyModule
using Test


@testset "MyModule.jl" begin
    @test MyModule.hello_world() == "Hello, World!"
end
