-- AIをを利用せずに試みましたコードです
print("welcome to the random number game")
local playAgain = "again"
repeat
    print("choose a number")
attempts = 0
local number = math.random(100)
repeat
attempts = attempts + 1
    i = tonumber(io.read())
    if i == null then
     print("input error: choose a number")
    elseif i > number then
         print("too high")
    elseif i < number then
         print("too low")
    elseif i == number then
         print("good job!")
    else
          print("whats going on")
    end
until i == number
print("You made " .. attempts .. " attempts. Input the word again to play once more, or enter any key to quit")
playAgain = io.read()
until playAgain ~= "again"

print("thanks for playing")



    


