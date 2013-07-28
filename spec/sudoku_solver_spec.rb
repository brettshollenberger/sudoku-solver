require_relative "../lib/sudoku_solver"

describe "SudokuSolver" do

  let(:puzzle) {[
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

  let(:solver) { SudokuSolver.new(puzzle) }

  it "knows whether each square is solved or not" do
    expect(solver[0][0].solved?).to eql(false)
    expect(solver[0][1].solved?).to eql(true)
  end

  it "knows which numbers are in a particular row" do
    expect(solver[0][0].row_members).to eql([4, 8, 7, 2])
  end

  it "knows which numbers are in a particular column" do
    expect(solver[0][0].column_members).to eql([1, 3, 7, 4])
  end

  it "knows which numbers are in a particular square" do
    expect(solver[0][0].square_members).to include(4, 1, 3, 2, 8)
    expect(solver[0][3].square_members).to include(8, 9, 6, 4, 7)
    expect(solver[0][6].square_members).to include(7, 5, 9, 2)
    expect(solver[3][0].square_members).to include(7, 9, 5)
    expect(solver[3][3].square_members).to include(4, 3)
    expect(solver[3][6].square_members).to include(8, 3, 1)
    expect(solver[6][0].square_members).to include(4, 5, 7, 1)
    expect(solver[6][3].square_members).to include(1, 8, 4, 6, 5)
    expect(solver[6][6].square_members).to include(9, 8, 6, 5, 2)
  end

  it "knows which options are available for a given square" do
    expect(solver[0][0].options).to eql([5, 6, 9])
  end

  it "starts unsolved" do
    expect(solver.solved?).to eql(false)
  end

  it "solves Easy Sudoku" do
    solver.solve
    expect(solver.display).to eql("549837612\n168942753\n327651498\n694523871\n832719564\n715468239\n953274186\n271386945\n486195327\n")
  end

end
