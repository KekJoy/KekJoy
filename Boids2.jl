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

xmin, xmax = 1, 300
ymin, ymax = 1, 300

function init_boids()
    array_boids = []
    for i = 1:20 
        boid = Boid( rand(1:100), rand(1:100), 20, 50 , 2, 50)
        push!(array_boids, boid)
    end
    return array_boids
end

# boid1 = Boid( 17 , 60, 20, 50 , 2, 50)
# boid2 = Boid( 60 ,50 , 20, 50 , 2, 50)
# boid3 = Boid( 38 ,40 , 20, 50 , 2, 50)
# boid4 = Boid(49 ,30 , 20, 50 , 2, 50)
# boid5 = Boid( 28, 20, 20, 50 , 2, 50)
# boid6 = Boid( 91,10 , 20, 50 , 2, 50)
# array_boids1 = [boid1, boid2, boid3, boid4, boid5, boid6]







function areas_of_visibility(boid, array_boids)
    array_vision = []
    for i = 1:length(array_boids) 
        wdth = sqrt((array_boids[i].x - boid.x)^2 + (array_boids[i].y - boid.y)^2)
        if wdth < boid.visibility
            push!(array_vision, array_boids[i])
        end
    end
    println(length(array_vision))
    #filter!(e -> e != boid, array_vision)
    #deleteat!(array_vision, array_vision .== boid);
    return array_vision
end


function alignment(boid, array_boids)
    array_vision = areas_of_visibility(boid, array_boids)
    new_dx = 0
    new_dy = 0
    for i = 1:length(array_vision)
        new_dx += array_vision[i].dx
        new_dy += array_vision[i].dy
    end
    new_dx = new_dx / length(array_vision)
    new_dy = new_dy / length(array_vision)
    return new_dx, new_dy
end

function  update_boids(array_boids)
    for g = 1:length(array_boids)
        boid = array_boids[g]
        boid.dx = alignment(boid, array_boids)
        boid.dy = alignment(boid, array_boids)
        len = sqrt(boid.dx^2+boid.dy^2)
        if len > boid.speed
            boid.dx = boid.dx * boid.speed/len
            boid.dy = boid.dy * boid.speed/len
        end
        boid.x += boid.speed * boid.dx
        boid.y += boid.speed * boid.dy
    end
end

function cohesion(boid, array_boids)
    array_vision[] = areas_of_visibility(boid, array_boids)

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