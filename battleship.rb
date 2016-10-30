#globalvariable
@g_array = []



# Your code here
def generate_board(y,x)
  # horizontal_len = Array.new(x, '-')
  # horizontal_len = Array.new(x){[1,2,3,4,5,6,7].sample}
  # board = Array.new(y){horizontal_len}
  # return board
  board = [ ['-','-','-','-','-','-','-','-','-','-'],
            ['-','-','-','-','-','-','-','-','-','-'],
            ['-','-','-','-','-','-','-','-','-','-'],
            ['-','-','-','-','-','-','-','-','-','-'],
            ['-','-','-','-','-','-','-','-','-','-'],
            ['-','-','-','-','-','-','-','-','-','-'],
            ['-','-','-','-','-','-','-','-','-','-'],
            ['-','-','-','-','-','-','-','-','-','-'],
            ['-','-','-','-','-','-','-','-','-','-'],
            ['-','-','-','-','-','-','-','-','-','-']
          ]
end

def format_board(board)
  puts "      A  B  C  D  E  F  G  H  I  J"
  i =1
  board.each do |row|
    print " #{i} | " if i < 10
    print " #{i}| " if 10 == i
    row.each do |e|
      print " #{e} "
    end#endrowloop
    puts ""
    i += 1
  end#endboardloop
end

def convert_coord_to_index(y,x, board)
  coord_storage = [[],[]]
  board.each_with_index do |row, row_i|
    row.each_with_index do |e, e_i|
      if e_i + 1 == x && row_i + 1 == y
        coord_storage[1] << e_i #if coord_storage[1].empty?
        coord_storage[0] << row_i
      end#endif
    end#endrowloop
  end#endboardloop
  return coord_storage.flatten
end

def replace_empty(coord,board,replacer)
  board[coord.first-1][coord.last-1] = replacer
end

def check_direction(coord1,coord2)
  case
  when coord1.last == coord2.last
    return "vertical"
  when coord1.first == coord2.first
    return "horizontal"
  else
    return "not there yet"
  end
end

def horizontal_range(coord1,coord2)
  x1 = coord1.last
  x2 = coord2.last
  x_array = []
  inc = (x1-x2)/(x1-x2).abs

  until x1 == x2
    x2 += inc
    x_array << x2
  end

  temp_arr = Array.new(x_array.length,coord1.first)
  coord_arr = temp_arr.zip(x_array)
end

def vertical_range(coord1,coord2)
  y1 = coord1.first
  y2 = coord2.first
  y_array = []
  inc = (y1-y2)/(y1-y2).abs

  until y1 == y2
    y2 += inc
    y_array << y2
  end
  temp_arr = Array.new(y_array.length,coord1.last)
  coord_arr = y_array.zip(temp_arr)
end

def set_board(coord1,coord2,board,piece)
  coord_arr = []
  case check_direction(coord1,coord2)
    when "horizontal"
      coord_arr = horizontal_range(coord1,coord2)
    when "vertical"
      coord_arr = vertical_range(coord1,coord2)
    else
        "try again"
  end #endcase

  coord_arr.each do |coord|
    replace_empty(coord,board,piece)
  end
end

def see_in_element(coord,board)
  y = coord.first
  x = coord.last
  yx_index = convert_coord_to_index(y,x, board)
  board[yx_index.first][yx_index.last]
end

def is_avail?(coord_array,board)
  status = true
  coord_array.each do |coord|
    if see_in_element(coord,board) != '-'
      return false
      break
    end
  end
  status
end


def place_ship(coord1,coord2,ship,board,ship_hash)
  # arr = [] #testing
  check_dimension = check_dimension(coord1,coord2,ship,ship_hash)
  check_quantity = ship_hash[ship][1] > 0
  check_coord = (coord1+coord2).select {|i| i > 10}.count == 0
  # p coord1 #test
  # p coord2 #test
  selected_coord = []
  if check_dimension && check_quantity && check_coord
    case check_direction(coord1,coord2)
    when "horizontal"
      # p 'asdasd' #test
      selected_coord = horizontal_range(coord1,coord2)
    when "vertical"
      selected_coord = vertical_range(coord1,coord2)
    else
      "try again"
    end#endCase
  else
    "did not pass dimension, quantity and check coordinates"
    do_nothing
  end#endif

  selected_coord

  if is_avail?(selected_coord,board)
    store_array_for_later(selected_coord)#testing
    selected_coord.each do |coord|
      replace_empty(coord,board,ship[0])
    end#end selectedcoordloop
  ship_hash[ship][1] -= 1
  else
    "place again because there already a ship there"
    do_nothing
  end
end

#this would store all the coordinate ranges for later tracking
def store_array_for_later(array)
  @g_array << array #globalvariable
end

#spits out the game tracker in the beginning
#use this to keep track of how the player is doing
def beginning_tracker
  #[[g_array],[size],[name],[status],[count]]
  track_arr = [
                [[],[5],["Carrier"],["A"],[0]],
                [[],[4],["Battleship"],["A"],[0]],
                [[],[3],["cruiser"],["A"],[0]],
                [[],[2],["Destroyer"],["A"],[0]],
                [[],[2],["Destroyer"],["A"],[0]],
                [[],[1],["Submarine"],["A"],[0]],
                [[],[1],["Submarine"],["A"],[0]]
              ]
  used_arrays = []
  @g_array.each do |array_range|
    track_arr.each do |sets|
      # p array_range.length
      # p sets[1][0]
      if array_range.length == sets[1][0] && sets[0].empty? && !used_arrays.include?(array_range)
        sets[0] = array_range
        used_arrays << array_range
      else
        do_nothing
      end#end if
    end#end track_arr loop
  end#end g_arry loop
  track_arr
end

def check_dimension(coord1,coord2,ship,hash)
#check to see if the dimensions match
      #if horizontal check if the increments for x is plausible
      #if vertical check if the increments for y is plausible
      #if try again, set check_dimension to false
  called_size = 0
  case check_direction(coord1,coord2)
  when "horizontal"
    called_size = (coord1.last - coord2.last).abs
  when "vertical"
    called_size = (coord1.first - coord2.first).abs
  else
    called_size = 0
  end
  # p called_size #test
  return !!(hash[ship][0]==called_size)
end

def total_num_quant(hash)
  quant = 0
  hash.each do |ship,info|
    quant += info[1]
  end
  quant
end

#----------------------------random generator
def randomize_coord
  x = rand(10)+1
  y = rand(10)+1
  coord = [y,x]
end

#automate the board
def generate_random_board(hash,board)
  coord1 = randomize_coord
  selected_coord = []
  tries = 0

  until total_num_quant(hash) == 0 #|| tries > 500
  coord1 = randomize_coord
    until see_in_element(coord1,board) == '-'
      coord1 = randomize_coord
    end#enduntil
          ycoord1 = coord1.first
          xcoord1 = coord1.last
          ship = choose_avail(hash).sample
          direction = random_dir
          operation = random_ops
          if direction == "horizontal"
            if operation == 'minus'
              xcoord2 = xcoord1 - hash[ship][0]
              xcoord2 = 0 if !check_boundary(xcoord2)
            elsif operation == 'add'
              xcoord2 = xcoord1 + hash[ship][0]
              xcoord2 = 0 if !check_boundary(xcoord2)
            end
            ycoord2 = ycoord1
          elsif direction == "vertical"
            if operation == 'minus'
              ycoord2 = ycoord1 - hash[ship][0]
              ycoord2 = 0 if !check_boundary(ycoord2)
            elsif operation == 'add'
              ycoord2 = ycoord1 + hash[ship][0]
              ycoord2 = 0 if !check_boundary(ycoord2)
            end#endif
            xcoord2 = xcoord1
          else#endsbigif
            do_nothing
          end
  #     store new values
          coord2 = [ycoord2, xcoord2]
          if !coord2.include?0
            place_ship(coord1,coord2,ship,board,hash)
          else
            do_nothing
          end
  tries += 1
  total_num_quant(hash)
  end#enduntil
end

def do_nothing
end

def check_boundary(coord)
  !!(coord > 0 && coord < 11)
end



def random_dir
  ["horizontal","vertical"].sample
end

def random_ops
  ['minus','add'].sample
end

def choose_avail(hash)
  avail_ship = []
  hash.each do |ship,info|
    avail_ship << ship if info.last > 0
  end
  avail_ship
end

#-------------------------------------------

# def create_tracker_hash(hash)
#   #hash: coord_range, size, status
#   tracker_hash ={
#     "Carrier" => [[],[hash["Carrier"][0]],["A"]],
#     "Battleship" => [[],[hash["Battleship"][0]],["A"]],
#     "cruiser" => [[],[hash["cruiser"][0]],["A"]],
#     "Destroyer" => [[],[hash["Destroyer"][0]],["A"]],
#     "Submarine" => [[],[hash["Submarine"][0]],["A"]]
#   }
#   @g_array.each do |array_range|
#     case array_range.count
#     when 5
#       tracker_hash["Carrier"][0] = array_range
#     when 4
#   end
#   tracker_hash
# end

#scan the board and collect all the ships into their own array or hash, store coordinates
# key: letter of ship
# 1st array: store the coordinates
# 2nd array: size of the ship
# # Not yet!!! 3rd array: count how many times the array has been hit or been called
# #   if the person hits any coordinate in the array, increase count to one
# #   and compare it to the
# 3rd array: call status (active or sunk)
#
#
# #after every hit
# check the stored coordinates and if they are all x then change status to sunk


#name, size, quantity
ship_hash ={
            "Carrier" => [5, 1],
            "Battleship" => [4, 1],
            "cruiser" => [3, 1],
            "Destroyer" => [2, 2],
            "Submarine" => [1, 2],
            }

board = generate_board(10,10)
# format_board(board)
generate_random_board(ship_hash,board)
# p @g_array
p beginning_tracker
format_board(board)


# p ship_hash
# p coord = randomize_coord
# p see_in_element(coord,board)
# p choose_avail(ship_hash).sample
# p board
# format_board(board)
# coord = find_coord(2,2,board)
# replace_empty(coord,board,"x")
# p coord
# p board[1][2] = 2
# format_board(board)
# p board
# p set_board([2,4],[2,6],board,"X")
# format_board(board)
# see_in_element([2,5],board)
# p is_avail?([[1, 7], [2, 7], [3, 7]],board)
# place_ship([7,2],[7,4],"Cruiser",board,ship_hash)
# format_board(board)
# p ship_hash
# p total_num_quant(ship_hash)
