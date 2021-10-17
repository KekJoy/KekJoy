mutable struct GameOfLife
    current_frame::Matrix{Int}
    next_frame::Matrix{Int}
end

function stepgame!(state::GameOfLife)
    cr   = state.current_frame
    next = state.next_frame
    for i in 1:n
        for g in 1:m
            x = cr[i, g]
            d = 0
            if g == n || g == -1
                d += cr[i , mod1(g,m)]
            end
            if i == m || i == -1
               d += cr[mod1(i, n), g]
            end
            if g == -1 && i == -1 || g == -1 && i == m || g == m && i == -1|| g == n && i == n
                d += cr[mod1(i,n), mod1(g,m)]
            end
            if i < n # Сосед снизу 
                d += cr[i+1, g]
            end
            if i < n && g < m  # Справа снизу
                d += cr[i+1, g+1]
            end
            if g < m # Справа
                d += cr[i, g+1]
            end
            if i > 1 # Сверху    
                d += cr[i-1, g]
            end
            if i > 1 && g > 1  #Сверху слева
                d += cr[i-1, g-1]
            end
            if g > 1 #Левый
                d += cr[i, g-1]
            end
            if g > 1 && i < n # Снизу слева
                d += cr[i+1, g-1]
            end
            if i > 1 && g < m # Сверху справо
                d += cr[i-1, g+1]  
            end

            if d == 3  
                if x == 0
                    x = 1
                end
            end
            if d < 2
                if x == 1
                    x= 0
                end
            end
            if d > 3 
                if x == 1
                    x = 0
                end
            end
            next[i, g] = x
        end
    end
    # swap
    state.current_frame = next
    state.next_frame = cr 
    return nothing
end


using Plots

n = 20
m = 20

game = GameOfLife(rand(0:1, n, m), zeros(n, m))

anim = @animate for time = 1:100
    stepgame!(game)
    cr = game.current_frame
    heatmap(cr)
end
gif(anim, "LIFE.gif", fps = 10)
