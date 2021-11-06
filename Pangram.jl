Pangram("The quick brown fox jumps over the lazy dog.")
function Pangram(text)
    alphabet = 'a':'z'
    lower_text = lowercase(text)
    summary = 0
    for i in 1:leng th(lower_text)
        if lower_text[i] ⊆ alphabet
             
    end
    if summary == 4089
        return "This is Pangram"
    else
        return "This is not a Pangram"
    end
end
