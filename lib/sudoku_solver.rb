class SudokuSolver < Array

  attr_accessor :blocks

  def initialize(puzzle)
    add_squares(puzzle)
    @blocks = PuzzleMap.new
  end

  def solve
    solve_each_square until solved?
  end

  def solved?
    self.each { |row| row.each { |square| return false unless square.solved? } }
    true
  end

  def add_squares(puzzle)
    puzzle.each_with_index do |line, y|
      self.push(line.each_with_index.map { |number, x| Square.new(number, x, y, self) })
    end
  end

  def row(y)
    self[y]
  end

  def column(x)
    (0..8).to_a.map { |y| self[y][x] }
  end

  def square(y, x)
    coordinates_in_square(y, x).map { |coord| self[coord[0]][coord[1]] }
  end

  def display
    display_values.join().gsub(/\d{9}/) { |row| row + "\n"}
  end

private

  def coordinates_in_square(y, x)
    @blocks[block_lookup(y, x)]
  end

  def block_lookup(y, x)
    @blocks.each { |k, v| break k if v.include?([y, x]) }
  end

  def solve_each_square
    self.each do |row|
      row.each { |square| square.attempt_solution unless square.solved? }
    end
  end

  def display_values
    self.map { |row| row.map { |square| square.value } }
  end

end

class Square

  attr_accessor :value, :x, :y

  def initialize(value, x, y, puzzle)
    @value = value
    @x, @y = x, y
    @puzzle = puzzle
  end

  def options
    [1, 2, 3, 4, 5, 6, 7, 8, 9].map { |option| option unless invalid_option?(option) }.compact!
  end

  def attempt_solution
    @value = options.first if one_option_left
  end

  def solved?
    @value != 0
  end

  def row_members
    find_members_in { @puzzle.row(@y) }
  end

  def column_members
    find_members_in { @puzzle.column(@x) }
  end

  def square_members
    find_members_in { @puzzle.square(@y, @x) }
  end

  def find_members_in(&block)
    block.call.map { |square| square.value }.reject { |num| num == 0}
  end

protected

  def one_option_left
    options.length == 1
  end

  def invalid_option?(option)
    row_members.include?(option) || column_members.include?(option) || square_members.include?(option)
  end

end

class PuzzleMap < Hash

  attr_reader :blocks

  def initialize
    @blocks = {
      A: [
        [0, 0], [1, 0], [2, 0],
        [0, 1], [1, 1], [2, 1],
        [0, 2], [1, 2], [2, 2]
      ],

      B: [
        [3, 0], [4, 0], [5, 0],
        [3, 1], [4, 1], [5, 1],
        [3, 2], [4, 2], [5, 2]
      ],

      C: [
        [6, 0], [7, 0], [8, 0],
        [6, 1], [7, 1], [8, 1],
        [6, 2], [7, 2], [8, 2]
      ],

      D: [
        [0, 3], [1, 3], [2, 3],
        [0, 4], [1, 4], [2, 4],
        [0, 5], [1, 5], [2, 5]
      ],

      E: [
        [3, 3], [4, 3], [5, 3],
        [3, 4], [4, 4], [5, 4],
        [3, 5], [4, 5], [5, 5]
      ],

      F: [
        [6, 3], [7, 3], [8, 3],
        [6, 4], [7, 4], [8, 4],
        [6, 5], [7, 5], [8, 5]
      ],

      G: [
        [0, 6], [1, 6], [2, 6],
        [0, 7], [1, 7], [2, 7],
        [0, 8], [1, 8], [2, 8]
      ],

      H: [
        [3, 6], [4, 6], [5, 6],
        [3, 7], [4, 7], [5, 7],
        [3, 8], [4, 8], [5, 8]
      ],

      I: [
        [6, 6], [7, 6], [8, 6],
        [6, 7], [7, 7], [8, 7],
        [6, 8], [7, 8], [8, 8]
      ]
    }
    @blocks.each { |k, v| self[k] = v }
  end

end
