Hamming("GAGCCTACTAACGGGAT", "CATCGTAATGACGGCCT") # 7 различий
Hamming("ATGTCCTAGCTGCTCG", "ATGTCCTAGCTGCTCG") #Равны
Hamming("TACAGGATCGACGAGC", "TACAGGAGACGAGC") # Неравны
function Hamming(firstDNA, secondDNA)
    if length(firstDNA) != length(secondDNA)
        return "DNA is not equal"
    end
    counter = 0;
    for i = 1:length(firstDNA)
        if firstDNA[i] != secondDNA[i]
            counter += 1
        end
    end
    if counter == 0
        return "DNAs is equal"
    else 
        return "DNAs have $counter differences"
    end
end



    
    