

#Uses Fisher-Yates shuffle
def shuffle(list)
    for i in 0 .. (list.length - 2)
        j = i + rand(list.length - i)
        list[i], list[j] = list[j], list[i]
    end
end

in1 = [1,2,3,4,5,6,7]
shuffle(in1)
print in1
puts

in2 = ["apple", "blackberry", "cherry", "dragonfruit",
       "grapefruit", "kumquat", "mango", "nectarine", 
       "persimmon", "raspberry", "raspberry"]
shuffle(in2)
print in2
puts

in3 = ["a", "e", "i", "o", "u"]
shuffle(in3)
print in3




