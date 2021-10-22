global squareOfTheSum = 0
global sumOfTheSquare = 0
maxNumber = parse(Int, readline())
for i = 1:maxNumber
    global squareOfTheSum += i
    global sumOfTheSquare += i^2
end
global squareOfTheSum = squareOfTheSum^2
result = squareOfTheSum-sumOfTheSquare
println(result)

