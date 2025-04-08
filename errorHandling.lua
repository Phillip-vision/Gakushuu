function divide(a, b)
    if b == 0 then
        error("Division by zero!")
    end
    return a / b
end

status, result = pcall(divide, 10, 0)

if status then
    print(result)
else
    print("Error: " .. result)
end