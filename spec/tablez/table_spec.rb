require "spec_helper"

RSpec.describe Tablez::Table do
  describe "#rows" do
    it "gives an array of row objects" do
      table = Tablez::Table.new
      table << [[1, 2, 3, 4, 5]]
      expect(table.rows.first).to be_a(Tablez::Row)
    end

    it "can select rows" do
      table = Tablez::Table.new
      table << [[3, 5], [1, 2, 3]]
      expect(table.row(0).values).to eq([3, 5, nil])
      expect(table.row(1).values).to eq([1, 2, 3])
    end
  end

  describe "#number_of_columns" do
    it "gives the number of columns" do
      table = Tablez::Table.new
      table << [[1, 2, 3, 4, 5]]
      expect(table.number_of_columns).to eq(5)
    end

    it "will give the size of the largest row" do
      table = Tablez::Table.new
      table << [[1, 2, 3, 4, 5], [1, 2]]
      expect(table.number_of_columns).to eq(5)
    end
  end

  describe "row#values" do
    it "gives the values in the row" do
      table = Tablez::Table.new
      table << [[1, 2, 3, 4, 5]]
      row = table.rows.first
      expect(row.values).to eq([1, 2, 3, 4, 5])
    end

    it "gives nil values to fill smaller rows" do
      table = Tablez::Table.new
      table << [[1, 2, 3, 4, 5], [1, 2]]
      row = table.rows.last
      expect(row.values).to eq([1, 2, nil, nil, nil])
    end
  end

  describe "#cells" do
    it "gives an array of cell objects" do
      table = Tablez::Table.new
      table << [[1, 2, 3, 4, 5]]
      expect(table.rows.first.cells.first).to be_a(Tablez::Cell)
    end
  end

  describe "#columns" do
    it "gives an array of column objects" do
      table = Tablez::Table.new
      table << [[1, 2, 3, 4, 5]]
      expect(table.columns.first).to be_a(Tablez::Column)
    end

    it "can count columns with 2 rows" do
      table = Tablez::Table.new
      table << [[1, 2], [3, 4]]
      expect(table.number_of_columns).to eq(2)
    end


    it "can count columns from different size rows" do
      table = Tablez::Table.new
      table << [[3, 5], [1, 2, 3]]
      expect(table.number_of_columns).to eq(3)
    end

    it "can return columns from 2 jagged rows" do
      table = Tablez::Table.new
      table << [[3, 5], [1, 2, 3]]
      expect(table.columns.map { |c| c.values }).to eq([[3, 1], [5, 2], [nil, 3]])
    end

    it "can find column width with strings" do
      table = Tablez::Table.new
      table << [["what", "foo bar"], ["foo", "foo bar baz qux", "lolol"]]
      expect(table.column(0).width).to eq(4)
      expect(table.column(1).width).to eq(15)
      expect(table.column(2).width).to eq(5)
    end

    it "can find column width with integers" do
      table = Tablez::Table.new
      table << [[1, 2, 3, 4, 5], [6, 7, 8, 9, 10]]
      expect(table.column(0).width).to eq(1)
      expect(table.column(1).width).to eq(1)
      expect(table.column(4).width).to eq(2)
    end

    it "can find different column widths in the same row" do
      table = Tablez::Table.new
      table << [[99, 101, 5000, 12, 333], [1, 1, 1, 1, 1]]
      expect(table.column(0).width).to eq(2)
      expect(table.column(1).width).to eq(3)
      expect(table.column(2).width).to eq(4)
      expect(table.column(3).width).to eq(2)
      expect(table.column(4).width).to eq(3)
    end
  end

  describe "#separator" do
    it "renders the correct separator for a 2x2 table with padding of 1" do
      table = Tablez::Table.new
      table << [[1, 2], [3, 4]]
      expect(table.separator).to eq("+---+---+\n")
    end

    it "renders the correct separator for a 3x2 table with padding of 1" do
      table = Tablez::Table.new
      table << [[1, 2, 3], [4, 5, 6]]
      expect(table.separator).to eq("+---+---+---+\n")
    end
  end

  # describe "#render" do
  #   it "can render a single element row" do
  #     row = Tablez::Row.new([1, 2, 3])
  #     expect(row.render).to eq("| 1 | 2 | 3 |\n")
  #   end

  #   it "can render a single element row" do
  #     table = Tablez::Table.new
  #     table << [[1]]
  #     expect(table.render).to eq <<-EOS.deindent
  #       +---+
  #       | 1 |
  #       +---+
  #     EOS
  #   end

  #   it "can render a single element row with string" do
  #     table = Tablez::Table.new
  #     table << [['foo']]
  #     expect(table.render).to eq <<-EOS.deindent
  #       +-----+
  #       | foo |
  #       +-----+
  #     EOS
  #   end

  #   it "can render a single row" do
  #     table = Tablez::Table.new
  #     table << [[1, 2, 3, 4, 5]]
  #     expect(table.render).to eq <<-EOS.deindent
  #     +---+---+---+---+---+
  #     | 1 | 2 | 3 | 4 | 5 |
  #     +---+---+---+---+---+
  #     EOS
  #   end

  #   it "will interpret an unnested array as one row" do
  #     table = Tablez::Table.new
  #     table <<[1, 2, 3, 4, 5]
  #     expect(table.render).to eq <<-EOS.deindent
  #     +-------------------+
  #     | 1 | 2 | 3 | 4 | 5 |
  #     +-------------------+
  #     EOS
  #   end

  #   it "can render one row of different size digits" do
  #     table = Tablez::Table.new
  #     table << [[9, 101, 5, 12, 3]]
  #     expect(table.render).to eq <<-EOS.deindent
  #     +---+-----+---+----+---+
  #     | 9 | 101 | 5 | 12 | 3 |
  #     +---+-----+---+----+---+
  #     EOS
  #   end

  #   it "can adjust to keep the correct padding" do
  #     table = Tablez::Table.new
  #     table << [[1, 2, 3, 4, 5], [66, 7, 8, 9, 10]]
  #     expect(table.render).to eq <<-EOS.deindent
  #     +----+---+---+---+----+
  #     | 1  | 2 | 3 | 4 | 5  |
  #     +----+---+---+---+----+
  #     | 66 | 7 | 8 | 9 | 10 |
  #     +---------------------+
  #     EOS
  #   end

  #   it "can render jagged arrays" do
  #     table = Tablez::Table.new
  #     table << [[1, 2, 3, 4, 5], [1, 2]]
  #     expect(table.render).to eq <<-EOS.deindent
  #     +---+---+---+---+---+
  #     | 1 | 2 | 3 | 4 | 5 |
  #     +---+---+---+---+---+
  #     | 1 | 2 |   |   |   |
  #     +---+---+---+---+---+
  #     EOS
  #   end
  # end
end
