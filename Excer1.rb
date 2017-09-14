
class InstructingKeypad
  def initialize
    @keypad = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  
  def get_instructions(from_file)
    File.open('./' + from_file, 'r')
  end

 
  def get_directions(from_file)
    directions = get_instructions(from_file)
	
	x = 1
y = 1
result =''

directions.each_line do |line|
num = line.split('')
num.each do |move|

	x -= 1 if move == "U" && x > 0
    x += 1 if move == "D" && x < 2
    y -= 1 if move == "L" && y > 0
    y += 1 if move == "R" && y < 2

end
      result += @keypad[x][y].to_s
    end
    result
  end
end

yas = InstructingKeypad.new
puts yas.get_directions('input.txt')