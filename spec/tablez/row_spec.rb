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
      expect(table.rows[0].values).to eq([3, 5, nil])
      expect(table.rows[1].values).to eq([1, 2, 3])
    end

    describe "#values" do
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
        row = table.rows.first
        expect(row.cells.first).to be_a(Tablez::Cell)
      end
    end
  end
end
