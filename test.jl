using Plots
# Прямая
x = []
y = []
for i in 1:2:10
    push!(x , i)
    push!(y, i/i * 5)
end
plot(x,y)