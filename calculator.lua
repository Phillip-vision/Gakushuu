while true do
    print("\nSimple Calculator: ")
    print("Enter 'quit' to exit")

    -- Read first number
    io.write("Enter the first number: ")
    local input1 = io.read()
    if input1 == "quit" then break end -- Exit condition
    local num1 = tonumber(input1)

    -- Error checking for the first number
    if notnum1 then
        print("Hey! that's invalid!!")
        goto continue -- Jump to the start of the loop
    end

    -- Read the second number
    io.write("Enter the second number: ")
    local input2 = io.read()
    if input2 == "quit" then break end
    local num2 = tonumber(input2)

    --Error checking for the second number
    if not num2 then 
        print ("Hey! thats no good!")
    goto continue
end

-- Read operator
io.write("Enter an operator (+, -, *, /): ")
local operator = io.read()

-- Perform calculation based on the operator
local result
if operator == "+" then
    result = num1 + num2
elseif operator == "-" then
        result = num1 - num2
    elseif operator == "*" then
        result = num1 * num2
    elseif operator == "/" then
        result = num1 / num2
        if num2 == 0 then
            print("Hey! That ain't right!")
            goto continue
        end
        result = num1 / num2
    else
        print("That operator is not correct")
        goto continue
    end

    -- Display result
    print("Result:" .. result)
    
    ::continue:: -- Label for restarting the loop
end

print ("See ya later alligator")