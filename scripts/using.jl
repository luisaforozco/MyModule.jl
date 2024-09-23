include("../src/MyModule.jl")

# Example 1
using .MyModule: foo
foo()
baz()
MyModule.baz()

# Example 2
using LinearAlgebra
LinearAlgebra
lu
parentmodule(lu)

using LinearAlgebra: lu
lu
LinearAlgebra
LinearAlgebra.svd
using LinearAlgebra: LinearAlgebra, lu
lu
LinearAlgebra
LinearAlgebra.svd

# Example 4 (restart REPL): conflicts with existing identifier.
using LinearAlgebra
qr
qr = false
parentmodule(qr)

using .MyModule
qr
parentmodule(qr)
qr(3, 5)
