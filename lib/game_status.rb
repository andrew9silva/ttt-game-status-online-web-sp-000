require "pry"
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)
  WIN_COMBINATIONS.detect{|combo| board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] && position_taken?(board, combo[0])}
end

def full?(board)
  if WIN_COMBINATIONS.any?{|combo| board[combo[0]] == " "}
    false
  else
    true
  end
end

def draw?(board)
  if !won?(board) && full?(board)
   return true
 elsif !won?(board) && !full?(board)
   return false
 else won?(board)
   return false
 end
end

def over?(board)
  if draw?(board) || full?(board) || won?(board)
    true
  else
    false
  end
end


def winner(board)
  win_combo = won?(board)
  if win_combo
    board[win_combo[0]]
  else
    nil
  end
end
