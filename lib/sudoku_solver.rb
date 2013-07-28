class SudokuSolver
  attr_accessor :puzzle

  def initialize(puzzle)
    @puzzle = puzzle
  end

end

class Puzzle < Array

  def initialize(puzzle)
    puzzle.each { |line| self << line }
  end

end
