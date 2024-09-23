# Extending loaded functions
struct Point2D
    x::Any
    y::Any
end

struct Point3D
    x::Any
    y::Any
    z::Any
end

function distance(p1::Point2D, p2::Point2D)
    return sqrt((p1.x - p2.x)^2 + (p1.y - p2.y)^2)
end

function distance(p1::Point3D, p2::Point3D)
    return sqrt((p1.x - p2.x)^2 + (p1.y - p2.y)^2 + (p1.z - p2.z)^2)
end

distance(Point2D(0, 0), Point2D(3, 4))
distance(Point3D(0, 0, 0), Point3D(2, 3, 6))
distance(Point2D(0, 0), Point3D(1, 2, 3))

println(Point2D(0, 0))


import Base: show
function show(io::IO, p::Point2D)
    print(io, "2D point: ($(p.x), $(p.y))")
end

function Base.show(io::IO, p::Point2D)
    print(io, "2D point: ($(p.x), $(p.y))")
end
