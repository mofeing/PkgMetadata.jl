using Test
using Pkg
using PkgMetadata

path = Dict(:PkgDemo => joinpath(@__DIR__, "PkgDemo"))

@testset begin
    @test isempty(metadata())

    Pkg.develop(path=path[:PkgDemo])

    @test metadata() isa Dict{String,Dict{String,T}} where {T<:Any}
    @test metadata() == Dict(
        "PkgDemo" => Dict(
            "target" => "greet",
            "array" => ["hello", "world"],
            "sub" => Dict("subtarget" => "subgreet")
        )
    )
end