require_relative "../lib/sudoku_solver"

describe "SudokuSolver" do

  let(:puz) {[
       [0, 0, 6, 0, 1, 0, 0, 0, 0],
       [4, 5, 1, 0, 3, 9, 2, 0, 0],
       [3, 2, 0, 0, 0, 6, 1, 0, 0],
       [2, 0, 0, 6, 9, 0, 0, 0, 8],
       [0, 0, 0, 5, 0, 1, 0, 0, 0],
       [9, 0, 0, 0, 2, 7, 0, 0, 1],
       [0, 0, 7, 2, 0, 0, 0, 8, 9],
       [0, 0, 9, 1, 7, 0, 6, 2, 5],
       [0, 0, 0, 0, 4, 0, 3, 0, 0]
    ]}

  let(:puzzle) { Puzzle.new(puz) }

  describe "Square" do

    it "knows whether it is solved or not" do
      expect(puzzle[0][0].solved?).to eql(false)
      expect(puzzle[0][2].solved?).to eql(true)
    end

  end

  let(:solver) { SudokuSolver.new(puzzle) }

  it "takes a puzzle object" do
    expect(solver.puzzle[0][0].value).to eql(0)
  end

end
