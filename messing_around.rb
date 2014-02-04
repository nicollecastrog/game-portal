def new_board
  @array = Array.new(9)
end

def next_turn
  if @turn == 1
    @turn = 2
  else 
   @turn = 1
  end
end

def directions
  puts ("Player #{@turn}, make your move by entering the number (0-8) that corresponds to where you'd like to make a move.")
  puts ("0|1|2")
  puts ("3|4|5")
  puts ("6|7|8")
end


def add_mark(ans)
  if @array[ans] == nil && @turn == 1
    @array[ans] = 'X'
    puts "Current Game: "
    puts "#{@array[0]} | #{@array[1]} | #{@array[2]}"
    puts "-"*10
    puts "#{@array[3]} | #{@array[4]} | #{@array[5]}"
    puts "-"*10
    puts "#{@array[6]} | #{@array[7]} | #{@array[8]}"
    puts "\nPlayer #{@turn} marked space #{ans}"
  elsif @array[ans] == nil && @turn == 2
    @array[ans] = 'O'
    puts "Current Game: "
    puts "#{@array[0]} | #{@array[1]} | #{@array[2]}"
    puts "-"*10
    puts "#{@array[3]} | #{@array[4]} | #{@array[5]}"
    puts "-"*10
    puts "#{@array[6]} | #{@array[7]} | #{@array[8]}"
    puts "\nPlayer #{@turn} marked space #{ans}"
  else
    puts "That space is taken. Choose a different space"
    ans = gets.chomp.to_i
  end
end

def check_rows?
    i = 0
    while i < 9 do
        if (@array[i] != nil && @array[i] == @array[(i+1)] && @array[i] == @array[(i+2)])
          return true
        else
          i += 3
        end
    end
    return false
end
    
def check_columns?
    for i in 0...3
        if (@array[i] != nil && @array[i] == @array[(i+3)] && @array[i] == @array[(i+6)])
          return true
        else
          i += 2
        end
    end
    return false
end

def check_diagonals?  
  if (@array[0] != nil && @array[0] == @array[4] && @array[0] == @array[8])
    return true
  elsif (@array[2] != nil && @array[2] == @array[4] && @array[2] == @array[6])
    return true
  end
  return false
end

def check_full_board?  
  i = 0
  while i < 9 do
    if @array[i] == nil
      return false
    else
      i += 1     
    end
  end
  return true
end 

def game_over?
  if check_rows? || check_columns? || check_diagonals?
    puts "You win!"
  elsif check_full_board?
    puts "It's a tie"
  else
    play
  end
end

def play
  next_turn
  directions
  ans = gets.chomp.to_i
  add_mark(ans)
  game_over?
end


new_board
@turn = 2
play







