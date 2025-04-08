math.randomseed(os.time())  -- Initialize random generator based on current time
local secretNumber = math.random(1, 100)
local attempts = 0
local guess = nil

print("Welcome to the Number Guessing Game!")
print("I've picked a number between 1 and 100. Can you guess it?")

repeat
    repeat
        print("Enter your guess: ")
        local input = io.read()
        guess = tonumber(input)

        if not guess then
            print("oh no! invalid input detected!!")
        end
    until guess -- Repeat until a valid number is entered

    attempts = attempts + 1

    if guess < secretNumber then
        print("Too low! Try again.")
    elseif guess > secretNumber then
        print("Too high! Try again.")
    end
until guess == secretNumber

print("Congratulations! You are a weiner!! You guessed the number in " .. attempts .. " attempts.")