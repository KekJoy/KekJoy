using Plots
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

#Квадрат
xup = []
xdown = []
yup = []
ydown = []
for i in 1:10
    push!(xup , i)
    push!( yup , (i/i) *5)
end
for g in range 1:10
    push!(xdown , i)
    push!(ydown , (i/i) * 1)
end
plot(xup , yup, xdowm, ydown)

