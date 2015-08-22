

function balance(word) 
    local length = string.len(word)
    local word = string.upper(word)

    -- If Word has no characters or 2 characters then not balanced
    if length == 0 or length == 2 then
        print(word .. " DOES NOT BALANCE")
        return
    end

    -- If Word has one character then is balanced by itself
    if length == 1 then
        print(word .. " - 0")
        return
    end

    for center = 2, length - 1, 1 do
        local left = 0
        for l = 1, center -1, 1 do
            left = left + (center - l) * (string.byte(word:sub(l,l)) - (string.byte('A') - 1))
        end

        local right = 0
        for r = center + 1, length, 1 do
            right = right + (r - center) * (string.byte(word:sub(r,r)) - (string.byte('A') - 1))
        end

        if left == right then
            print(word:sub(1, center - 1) .. " " ..
                  word:sub(center, center) .. " " ..
                  word:sub(center + 1, length) ..
                  " - " ..  left)
            return
        end
    end
    
    -- no match
    print(word .. " DOES NOT BALANCE")
end   

balance("CONSUBSTANTIATION")
balance("WRONGHEADED")
balance("UNINTELLIGIBILITY")
balance("SUPERGLUE")
