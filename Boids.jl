mutable struct Boid
    x::Int64
    y::Int64
    dx::Int64 
    dy::Int64
    speed::Int64
    visibility::Int64
end

speed = 5
vision = 3
counter_boids = 50
length = 100
width = 100

#Наполнение массива экземплярами boid структуры Boid
array_boids = []
for i = 1:counter_boids 
    boid = Boid( rand(1:length), rand(1:width), 1, 1, speed, vision)
    push!(array_boids, boid)
end

#Правило срелней позиции Cohesion
function averge_positon(array_vision)
    sumX = 0
    sumY = 0
    for i = 1:length(array_vision)
        sumX += array_vision[i].x
        sumY += array_vision[i].y
    end
    sumX = sumX/lenght(array_vision)
    sumY = sumY/lenght(array_vision)
    return sumX && sumY
end

#Определние кол-ва птиц входящих в ралиус видимости рассматриваемой птицы.
for i = 1:length(array_boids)
    array_vision = []
    for n = 1:length(array_boids) # Нужно удлить саму проверяемую птицу
        wdth = sqrt((array_boids[n].x - array_boids[i].x)^2 +(array_boids[n].y - array_boids[i].y)^2) # Определяем расстояние от птицы i до птицы n
        if wdth <= vision # Если расстояние меньше или равно ридусу видимостито
            push!(array_vision, array_boids[n]) # добовлем птицу n в массив, где хранятся птицы находящиеся в области видимости птицы i
        end
    end
    # Использую массив рассчитываем новое положение птицы по правилам
    averge_positon(array_vision)
end






    
