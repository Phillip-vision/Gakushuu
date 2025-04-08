print("enter a singular digit number: ")
local num1 = tonumber(io.read())
if num1 == nil then
    print("invalid")
    os.exit()
end

print("enter a second single digit number: ")
local num2 = tonumber(io.read())
if num2 == nil then
    print("invalid")
    os.exit()
end

print("enter an operator: ")
operator = io.read()

if operator == "+" then
    print("the sum is: " .. num1 + num2)
elseif operator == "*" then
    print("the sum is: " .. num1 * num2)
elseif operator == "-" then
    print("the sum is: " .. num1 - num2)
elseif operator == "/" then
    if num2 == 0 then
        print("Error: cannot divide by zero")
    else
    print("the sum is: " .. num1 / num2)
    end
else
    print("Invalid operator")
end