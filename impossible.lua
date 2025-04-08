local win_conditions = {
    -- 横
    { {1,1}, {1,2}, {1,3} },
    { {2,1}, {2,2}, {2,3} },
    { {3,1}, {3,2}, {3,3} },
    -- 縦
    { {1,1}, {2,1}, {3,1} },
    { {2,1}, {2,2}, {3,2} },
    { {1,3}, {2,3}, {3,3} },
    -- ななめ
    { {1,1}, {2,2}, {3,3} },
    { {1,3}, {2,2}, {3,1} },
}

-- Create a 3x3 board as a table
local board = {
    { " ", " ", " " }, -- First row
    { " ", " ", " " }, -- Second row
    { " ", " ", " " }  -- Third row
}

-- Function to display the Tic-Tac-Toe board
function displayBoard(board)
    for i = 1, 3 do -- loop through each row
        print(board[i][1] .. " | " .. board[i][2] .. " | " .. board[i][3])
        if i < 3 then -- If it’s not the last row, print a separator
            print("---------")
        end
    end
end

-- Function to allow a player to make a move
function playerMove(board, player)
    local row, col
    repeat
        print("Player " .. player .. ", enter your move (row col): ")
        row, col = io.read("*n", "*n")
        io.read()
    until row >= 1 and row <= 3 and col >= 1 and col <= 3 and board[row][col] == " "
    board[row][col] = player
end

-- Function to find the best possible move for the given player
function findBestMove(board, player)
        -- Loop through all predefined winning lines (rows, columns, diagonals)
    for _, line in ipairs(win_conditions) do
        -- Initialize counters and a variable to track an empty spot
        local count_player, count_empty, empty_spot = 0, 0, nil

        -- Check each position in the current line
        for _, pos in ipairs(line) do
            local r, c = pos[1], pos[2] -- Extract row and column from the position
            -- If the current cell belongs to the player, count it
            if board[r][c] == player then
                count_player = count_player + 1
                -- If the current cell is empty, count it and store its coordinates
            elseif board[r][c] == " " then
                count_empty = count_empty + 1
                empty_spot = {r, c}
            end
        end
        -- If the player has 2 marks in this line and 1 empty cell, return that move
        -- This means the player can either win or block here
        if count_player == 2 and count_empty == 1 then
            return empty_spot -- a winning or blocking move found!
        end
    end
    return nil -- no immediate win/block found
end

-- Function to make a CPU move that blocks or wins
function cpuMove(board)
    local move = findBestMove(board, "O") -- Try to win
    if not move then
        move = findBestMove(board, "X") -- Try to block
    end
    if move then
        board[move[1]][move[2]] = "O"
        print("CPU (O) played at row " .. move[1] .. ", column " .. move[2])
    else
    -- If no immediate threat, pick a random move
    local row, col
    repeat
        row = math.random(1, 3)
        col = math.random(1, 3)
    until board[row][col] == " "  -- Ensure it’s an empty spot
    board[row][col] = "O"
    print("CPU (O) played at row " .. row .. ", column " .. col)
end
end

-- Function to check if the board is full (for a tie)
function isBoardFull(board)
    for i = 1, 3 do
        for j = 1, 3 do
            if board[i][j] == " " then
                return false -- An empty space was found
            end
        end
    end
    return true -- No empty spaces left
end

-- Function to check if a player has won
function checkWinner(board)
    for _, line in ipairs(win_conditions) do
        local a, b, c = line[1], line[2], line[3]
        local val1 = board[a[1]][a[2]]
        local val2 = board[b[1]][b[2]]
        local val3 = board[c[1]][c[2]]

        if val1 ~= " " and val1 == val2 and val2 == val3 then
            return val1 -- Return "X" or "O"
        end
    end
    return nil -- No winner yet
end

-- Main game loop
local currentPlayer = "X" -- Player 1 starts
local winner = nil

while not winner do
    displayBoard(board)

    if currentPlayer == "X" then
        playerMove(board, currentPlayer)
    else
        cpuMove(board)
    end

    winner = checkWinner(board)

    if winner then
        displayBoard(board)
        print("Player " .. winner .. " wins!")
        break -- End the game if there is a winner
    elseif isBoardFull(board) then
        displayBoard(board)
        print("It's a tie!")
        break -- End the game if the board is full and no winner
    else
        if currentPlayer == "X" then
            currentPlayer = "O"
        else
            currentPlayer = "X"
        end
    end
end