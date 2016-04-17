require "spec_helper"

RSpec.describe Tablez::Table do
  describe "columns" do
    it "can select columns" do
      table = Tablez::Table.new
      table << [[3, 5], [1, 2, 3]]
      expect(table.column(0)).to eq([3, 1])
      expect(table.column(1)).to eq([5, 2])
      expect(table.column(2)).to eq([nil, 3])
    end

    it "can count columns with 1 row" do
      table = Tablez::Table.new
      table << [[1, 2, 3, 4, 5]]
      expect(table.number_of_columns).to eq(5)
    end

    it "can return columns from 1 row" do
      table = Tablez::Table.new
      table << [[1, 2, 3, 4, 5]]
      expect(table.columns).to eq([[1], [2], [3], [4], [5]])
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
      expect(table.columns).to eq([[3, 1], [5, 2], [nil, 3]])
    end

    it "can find column width" do
      table = Tablez::Table.new
      table << [["what", "foo bar"], ["foo", "foo bar baz qux", "lolol"]]
      expect(table.columns).to eq([["what", "foo"], ["foo bar", "foo bar baz qux"], [nil, "lolol"]])
      expect(table.column_width(0)).to eq(4)
      expect(table.column_width(1)).to eq(15)
      expect(table.column_width(2)).to eq(5)
    end
  end

  describe "rows" do
    it "can select rows" do
      table = Tablez::Table.new
      table << [[3, 5], [1, 2, 3]]
      expect(table.row(0)).to eq([3, 5, nil])
      expect(table.row(1)).to eq([1, 2, 3])
    end

    it "can find the max row" do
      table = Tablez::Table.new
      table << [[3, 5], [1, 2, 3]]
      expect(table.max_row).to eq(3)

      table << [[4, 4, 4, 4]]
      expect(table.max_row).to eq(4)
    end

    it "can count rows" do
      table = Tablez::Table.new
      table << [[3, 5], [1, 2, 3]]
      expect(table.number_of_rows).to eq(2)
    end

    it "can return all rows" do
      table = Tablez::Table.new
      table << [[3, 5], [1, 2, 3]]
      expect(table.rows).to eq([[3, 5, nil], [1, 2, 3]])
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

  describe "#render" do
    it "can render a single element row" do
      row = Tablez::Row.new([1, 2, 3])
      expect(row.render).to eq("| 1 | 2 | 3 |\n")
    end

    it "can render a single element row" do
      table = Tablez::Table.new
      table << [[1]]
      expect(table.render).to eq <<-EOS.deindent
        +---+
        | 1 |
        +---+
      EOS
    end

    it "can render a single row" do
      table = Tablez::Table.new
      table << [[1, 2, 3, 4, 5]]
      expect(table.render).to eq <<-EOS.deindent
      +---+---+---+---+---+
      | 1 | 2 | 3 | 4 | 5 |
      +---+---+---+---+---+
      EOS
    end

    it "will interpret an unnested array as one row" do
      table = Tablez::Table.new
      table <<[1, 2, 3, 4, 5]
      expect(table.render).to eq <<-EOS.deindent
      +-------------------+
      | 1 | 2 | 3 | 4 | 5 |
      +-------------------+
      EOS
    end

    it "can render one row of different size digits" do
      table = Tablez::Table.new
      table << [[9, 101, 5, 12, 3]]
      expect(table.render).to eq <<-EOS.deindent
      +---+-----+---+----+---+
      | 9 | 101 | 5 | 12 | 3 |
      +---+-----+---+----+---+
      EOS
    end

    it "can adjust to keep the correct padding" do
      table = Tablez::Table.new
      table << [[1, 2, 3, 4, 5], [6, 7, 8, 9, 10]]
      expect(table.render).to eq <<-EOS.deindent
      +--------------------+
      | 1 | 2 | 3 | 4 | 5  |
      +--------------------+
      | 6 | 7 | 8 | 9 | 10 |
      +--------------------+
      EOS
    end

    it "can render jagged arrays" do
      table = Tablez::Table.new
      table << [[1, 2, 3, 4, 5], [1, 2]]
      expect(table.render).to eq <<-EOS.deindent
      +---+---+---+---+---+
      | 1 | 2 | 3 | 4 | 5 |
      +---+---+---+---+---+
      | 1 | 2 |   |   |   |
      +---+---+---+---+---+
      EOS
    end
  end
end
