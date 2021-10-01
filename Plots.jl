using Plots
using PyPlot
# Прямая
x = []
y = []
for i in 1:2:10
    push!(x , i)
    push!(y, i/i * 5)
end
plot(x,y)

#Парабола
x = []
y = []
for i in -10:1:10
    push!(x, i)
    push!(y, i^2)
end
plot(x,y)

# Гипербола
x = []
y = []
for i in -25:1:25
    push!(x, i)
    push!(y, 1/i)
end
plot(x,y)

#Круг
a = 0
b = 4π
c = range(a, b, length = 100)
plot(sin.(c), cos.(c))