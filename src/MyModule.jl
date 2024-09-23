module MyModule

"""
    hi = hello_world()
A simple function to return "Hello, World!"
"""
function hello_world()
    return "Hello, World!"
end

export foo, baz, qr
foo() = println("I am an exported function in MyModule!")
bar() = println("I am a non-exported function in MyModule")
baz() = println("I am another exported function in MyModule")

function qr(x, threshold)
    if x > threshold
        return true
    else
        return false
    end
end

end
