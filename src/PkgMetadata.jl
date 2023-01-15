baremodule PkgMetadata

export metadata

using Pkg
using TOML: parsefile
using Base.Iterators: map, filter
using Base: Fix1, haskey, |>, =>, Dict
using Base.Filesystem: joinpath

projectfiles() = map(dep -> joinpath(dep.second.source, "Project.toml"), Pkg.API.dependencies())

# curry map
cmap(f) = Fix1(map, f)

# curry filter
cfilter(f) = Fix1(filter, f)

metadata() = projectfiles() |> cmap(parsefile) |> cfilter(info -> haskey(info, "metadata")) |> cmap() do info
                 info["name"] => info["metadata"]
             end |> Dict

end
