require_relative "../lib/sudoku_solver"

describe "SudokuSolver" do

  let(:puz) {[
      [0, 4, 0, 8, 0, 7, 0, 0, 2],
      [1, 0, 8, 9, 4, 0, 7, 5, 0],
      [3, 2, 0, 6, 0, 0, 0, 9, 0],
      [0, 9, 0, 0, 0, 3, 8, 0, 1],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [7, 0, 5, 4, 0, 0, 0, 3, 0],
      [0, 5, 0, 0, 0, 4, 0, 8, 6],
      [0, 7, 1, 0, 8, 6, 9, 0, 5],
      [4, 0, 0, 1, 0, 5, 0, 2, 0]
    ]}

  let(:puzzle) { Puzzle.new(puz) }

  describe "Square" do

    it "knows whether it is solved or not" do
      expect(puzzle[0][0].solved?).to eql(false)
      expect(puzzle[0][1].solved?).to eql(true)
    end

    it "knows the numbers in its row" do
      expect(puzzle[0][0].row_members).to eql([4, 8, 7, 2])
    end

    # it "knows its available options" do
    #   expect(puzzle[0][0].options).to eql([5, 6, 9])
    # end

  end

  let(:solver) { SudokuSolver.new(puzzle) }

end
