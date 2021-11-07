using Plots

mutable struct Boid
    x::Float64
    y::Float64
    dx::Float64 
    dy::Float64
    speed::Float64
    visibility::Float64
end

mutable struct Vectro2D
    x::Float64
    y::Float64
end

function Base.:+(a::Vectro2D,b::Vectro2D)
    c = Vectro2D(a.x+b.x,a.y+b.y)
end



boid = Boid(5,7,1,1,2,5)

xmin, xmax = 1, 300
ymin, ymax = 1, 300
@gif for i = 1:30
    boid.x += boid.speed
    boid.y += boid.speed
    plot([boid.x], [boid.y], ylims = (ymin, ymax), xlims = (xmin, xmax), legend=false, markershape=:pentagon)
end

# пункт 2

array_boids = []
for i = 1:5 
    boid = Boid( rand(1:100), rand(1:100), 1, 1, 2, 5)
    push!(array_boids, boid)
end

xmin, xmax = 1, 300
ymin, ymax = 1, 300
x = [boid.x for boid in array_boids]
y = [boid.y for boid in array_boids]
@gif for i = 1:30
    for g = 1:length(array_boids)
        array_boids[g].x += array_boids[g].speed
        array_boids[g].y += array_boids[g].speed
        x[g] = array_boids[g].x
        y[g] = array_boids[g].y
    end
    plot(x, y, 
        ylims = (ymin, ymax), 
        xlims = (xmin, xmax), 
        legend=false, 
        markershape=:pentagon, 
        seriestype = :scatter
    )
end

#пункт 3

function init_boids()
    array_boids = []
    for i = 1:5 
        boid = Boid( rand(1:100), rand(1:100), 20, 50 , 2, 5)
        push!(array_boids, boid)
    end
    return array_boids
end

function  update_boids(array_boids)
    for g = 1:length(array_boids)
        boid = array_boids[g]
        len = sqrt(boid.dx^2+boid.dy^2)
        if len > boid.speed
            boid.dx = boid.dx * boid.speed/len
            boid.dy = boid.dy * boid.speed/len
        end
        boid.x += boid.speed * boid.dx
        boid.y += boid.speed * boid.dy
    end
end

function rule_one(boid, array_boids)

end

function show_boids(array_boids)
    xmin, xmax = 1, 300
    ymin, ymax = 1, 300
    x = [boid.x for boid in array_boids]
    y = [boid.y for boid in array_boids]
    plot(x, y, 
        ylims = (ymin, ymax), 
        xlims = (xmin, xmax), 
        legend=false, 
        markershape=:pentagon, 
        seriestype = :scatter)
end



array_boids = init_boids()
@gif for i = 1:30
    update_boids(array_boids)
    show_boids(array_boids)
end