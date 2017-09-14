
class InstructingKeypad
  def initialize
    @keypad = [['', '', '1', '', ''], ['', '2', '3', '4', ''],
               ['5', '6', '7', '8', '9'], ['', 'A', 'B', 'C', ''],
               ['', '', 'D', '', '']]
  end

  
  def get_instructions(from_file)
    File.open('./' + from_file, 'r')
  end

 
  def get_directions(from_file)
    directions = get_instructions(from_file)
	
x = 2
y = 2
result =''

directions.each_line do |line|
num = line.split('')
num.each do |move|

	x -= 1 if move == "U" && x > 0 && @keypad[x-1][y] != ''
    x += 1 if move == "D" && x < 4 && @keypad[x+1][y] != ''
    y -= 1 if move == "L" && y > 0 && @keypad[x][y-1] != ''
    y += 1 if move == "R" && y < 4 && @keypad[x][y+1] != ''

end
      result += @keypad[x][y].to_s
    end
    result
  end
end

yas = InstructingKeypad.new
puts yas.get_directions('input.txt')