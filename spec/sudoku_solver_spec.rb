require_relative "../lib/sudoku_solver"

describe "Puzzle" do

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

  it "loads a puzzle" do
    expect(puzzle[0][0]).to eql(0)
    expect(puzzle[0][2]).to eql(6)
  end

  describe "SudokuSolver" do

    let(:solver) { SudokuSolver.new(puzzle) }

    it "takes a puzzle object" do
      expect(solver.puzzle[0][0]).to eql(0)
    end

  end
end
