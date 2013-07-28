class SudokuSolver
  attr_accessor :puzzle

  def initialize(puzzle)
    @puzzle = puzzle
  end

end

class Puzzle < Array

  def initialize(puzzle)
    puzzle.each do |line|
      self.push(line.map { |number| Square.new(number) })
    end
  end

end

class Square

  attr_accessor :value

  def initialize(value)
    @value = value
  end

  def solved?
    @value != 0
  end

end
