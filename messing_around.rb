def new_board
  x = 0
  @array = Array.new(9){x+=0}
end

def next_turn
  if @turn == 1
    @turn = 2
  else 
   @turn = 1
  end
end


def add_mark(ans)
  if @array[ans] == 0 && @turn == 1
    @array[ans] = 1
    print @array
    puts "\nPlayer #{@turn} marked space #{ans}"
  elsif @array[ans] == 0 && @turn == 2
    @array[ans] = 2
    print @array
    puts "\nPlayer #{@turn} marked space #{ans}"
  else
    puts "That space is taken. Choose a different space"
  end
end

def check_rows
    i = 0
    while i < 9 do
        if (@array[i] != 0 && @array[i] == @array[(i+1)] && @array[i] == @array[(i+2)])
            return @array[i]
            puts "You win!"
        end
        i += 3
    end
    return 0
end
    
def check_columns
    for i in 0...3
        if (@array[i] != 0 && @array[i] == @array[(i+3)] && @array[i] == @array[(i+6)])
            return @array[i]
            puts "You win!"
        end
    end
    return 0  
end

def check_diagonals  
  for i in 0...3
        if (@array[i] != 0 && @array[i] == @array[(i+4)] && @array[i] == @array[(i+8)])
            return @array[i]
            puts "You win!"
        elsif (@array[i] != 0 && @array[i] == @array[(i+2)] && @array[i] == @array[(i+4)])
            return @array[i]
            puts "You win!"
        end
    end
    return 0     
end

def check_empty_move  
  i = 0
    while i < 9 do
        if (@array[i] == 0)
            return i
        end
        i += 1
    end
    return -1
    puts "It's a tie!"
end 

def directions
  puts ("Make you move by entering the number (0-8) that corresponds to where you'd like to make a mark.")
  puts ("0|1|2")
  puts ("3|4|5")
  puts ("6|7|8")
end

def play
  next_turn
  directions
  ans = gets.chomp.to_i
  add_mark(ans)
  check_rows
  check_columns
  check_diagonals
  check_empty_move
end


new_board
@turn = 1
directions
ans = gets.chomp.to_i
add_mark(ans)
8.times {play}







