using MyModule
using Documenter

DocMeta.setdocmeta!(MyModule, :DocTestSetup, :(using MyModule); recursive = true)

const page_rename = Dict("developer.md" => "Developer docs") # Without the numbers
const numbered_pages = [
    file for file in readdir(joinpath(@__DIR__, "src")) if
    file != "index.md" && splitext(file)[2] == ".md"
]

makedocs(;
    modules = [MyModule],
    authors = "Luisa Orozco <l.orozco@esciencecenter.nl>, Abel Soares Siqueira <abel.s.siqueira@gmail.com>",
    repo = "https://github.com/luisaforozco/MyModule.jl/blob/{commit}{path}#{line}",
    sitename = "MyModule.jl",
    format = Documenter.HTML(; canonical = "https://luisaforozco.github.io/MyModule.jl"),
    pages = ["index.md"; numbered_pages],
)

deploydocs(; repo = "github.com/luisaforozco/MyModule.jl")
