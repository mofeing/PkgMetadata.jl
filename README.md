# PkgMedata.jl

[![CI](https://github.com/mofeing/PkgMetadata.jl/actions/workflows/CI.yml/badge.svg)](https://github.com/mofeing/PkgMetadata.jl/actions/workflows/CI.yml)

A small library for parsing `[metadata]` of `Project.toml` files from installed packages in the environment.

An example is shown in `test/PkgDemo`.

```toml
name = "PkgDemo"
uuid = "3736cb39-e601-445f-987c-61a75079cc79"

[metadata]
target = "greet"
array = ["hello", "world"]

[metadata.sub]
subtarget = "subgreet"
```

`PkgMetadata` exports the `metadata` function which returns a `Dict` from package names to parsed metadata. If `PkgDemo` is added to the current environment, the result will be the following:

```julia
julia> using PkgMetadata

julia> metadata()
Dict{String, Dict{String, Any}} with 1 entry:
  "PkgDemo" => Dict("sub"=>Dict{String, Any}("subtarget"=>"subgreet"), "array"=>["hello", "world"], "target"=>"greet")
```