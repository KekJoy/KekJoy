# Кортеж(нельзя изменить после объявления) и массивы - упорядоченные данные



# Словари не упорядоченные данные
# Объявление: Dict(String => String, String=> String)
# Новая запись: dict["Name"] = "Name"
#Tuples - Картеж
English = ("I", "am", "hamburger")
English[3]  # - обращение к элементу картежа


#Arrays - Массивы
tier_list = ["1", "2", "3", "4"]
tier_list[4]= "Gold" #- Добавление или изменение элемента массива
push!(tier_list, 21) # Добавить в конец
pop!() # Удалить из конца 
g = rand(4, 4)


#Loop - Петля 
# Ex1
bruh = ["one","two","three","Fous"]
bruh = 1
while i <= length(bruh)
    moment = bruh[i]
    println("Bruh $moment, is detected")
    bruh+=1
end

# Ex2
for n in 1:10 || for n = 1:10
    println(n)
end

# Ex3
for moment in bruh
    println("Bruh $moment, is detected")
end
# Ex4
m, n = 5, 5
A = zeros(m,n)
for i in 1:m 
    for j in 1:n # Либо писать в строчку for in 1:n, for j in 1:n
        A[i, j] = i + j
    end
end


A # Я ЖИВОЙ
C = [i+j for i in 1:m, j in 1:n]

# Ex6
for n in 1:10
    A = [i + j for i in 1:n, j in 1:n]
    display(A)
end

#Conditionals - 
x = rand(1:10)
y = rand(1:10)
if x > y
    println("$x больше чем $y")
elseif y > x
    println("$y больше чем $x")
else
    println("$x и $y равны")
end
#=
a ? b : c Идентично коду выше 
Пример: =#
b = max(x,y)
d = min(x, y) 
(x>y) || (x<y) ? println("$b больше чем $d") : println("$x и $y равны")

#Function - Функции
function sayhi(name) #or "sayhi(name) = println("Hi $name, it's great to see you!")
    println("Hi $name, it's great to see you!")    
end

function f(x) || f(x) = x^2
    x^2
end

sayhi("Sasha")
f(64)

#Anonymous functions - Анонимыне функции 
sayhi = name -> println("Hi $name, it's great to see you!")
f = x -> x^2
sayhi("GG WP")
f(9)

#Я не знаю как это обозвать
v = [3, 5, 2]
sort(v) #Построчная сортировка
v

#Обратное тому что выше
sort!(v)
v

#Трансляция
# f() != f.()
A = [i+3*j for j in 0:2, i in ]

B = f.(A)

#Packages - Библеотеки
#Ex1

#Pkg.add("Good") 
using Good

#Ex2
Pkg.add("Colors")
using Colors
pack - distinguishable_colors(200)
rand(pack, 3,3)