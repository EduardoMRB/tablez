require "spec_helper"

RSpec.describe Tablez::Table do
  describe "#number_of_columns" do
    it "gives the number of columns when 1 row" do
      table = Tablez::Table.new
      table << [[1, 2, 3, 4, 5]]
      expect(table.number_of_columns).to eq(5)
    end

    it "gives the number of columns based on the longest row" do
      table = Tablez::Table.new
      table << [[1, 2, 3, 4, 5], [1, 2]]
      expect(table.number_of_columns).to eq(5)
    end

    it "gives the number of columns with 2 rows" do
      table = Tablez::Table.new
      table << [[1, 2], [3, 4]]
      expect(table.number_of_columns).to eq(2)
    end
  end

  describe "#columns" do
    it "gives an array of column objects" do
      table = Tablez::Table.new
      table << [[1, 2, 3, 4, 5]]
      expect(table.columns.first).to be_a(Tablez::Column)
    end

    describe "#width" do
      it "can find column width when single row" do
        table = Tablez::Table.new
        table << [[9, 101, 5, 12, 3]]
        expect(table.column(0).width).to eq(1)
        expect(table.column(1).width).to eq(3)
        expect(table.column(2).width).to eq(1)
        expect(table.column(3).width).to eq(2)
        expect(table.column(4).width).to eq(1)
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
  end
end
