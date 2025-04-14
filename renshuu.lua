-- AIをを利用せずに試みましたコードです
print("welcome to the random number game")
local playAgain = "again"
repeat
    print("choose a number")
local attempts = 0
local number = math.random(100)
repeat
attempts = attempts + 1
    userInput = tonumber(io.read())
    if userInput == nill then
     print("input error: choose a number")
    elseif userInput > number then
         print("too high")
    elseif userInput < number then
         print("too low")
    elseif userInput == number then
         print("good job!")
    end
until userInput == number
print("You made " .. attempts .. " attempts. Input the word again to play once more, or enter any key to quit")
playAgain = io.read()
until playAgain ~= "again"

print("thanks for playing")



    


