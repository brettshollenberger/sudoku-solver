class SudokuSolver
  attr_accessor :puzzle

  def initialize(puzzle)
    @puzzle = puzzle
  end

end

class Puzzle < Array

  def initialize(puzzle)
    puzzle.each_with_index do |line, x|
      self.push(line.each_with_index.map { |number, y| Square.new(number, x, y, self) })
    end
  end

  def values_in_row(x)
    self[x]
  end

  def values_in_column(y)
    (0..8).to_a.map { |x| self[x][y] }
  end

end

class Square

  attr_accessor :value, :x, :y, :options

  def initialize(value, x, y, puzzle)
    @value = value
    @x, @y = x, y
    @puzzle = puzzle
    compute_options unless solved? 
  end

  def solved?
    @value != 0
  end

  def row_members
    @puzzle.values_in_row(@x).map { |square| square.value }.reject { |num| num == 0}
  end

  def column_members
    @puzzle.values_in_column(@y).map { |square| square.value }.reject { |num| num == 0}
  end

protected
  def compute_options
    nil
  end

end
