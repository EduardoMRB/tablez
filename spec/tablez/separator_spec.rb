require "spec_helper"

RSpec.describe Tablez::Table do
  describe "#separator" do
    it "renders the separator for a 1x1 table with padding of 1" do
      table = Tablez::Table.new
      table << [[1]]
      expect(table.separator.render).to eq("+---+\n")
    end

    it "renders the separator for a 2x2 table with padding of 1" do
      table = Tablez::Table.new
      table << [[1, 2], [3, 4]]
      expect(table.separator.render).to eq("+---+---+\n")
    end

    it "renders the separator for a 3x2 table with padding of 1" do
      table = Tablez::Table.new
      table << [[1, 2, 3], [4, 5, 6]]
      expect(table.separator.render).to eq("+---+---+---+\n")
    end

    it "renders the separator for a 2x2 table with padding of 2" do
      table = Tablez::Table.new(padding: 2)
      table << [[1, 2], [3, 4]]
      expect(table.separator.render).to eq("+-----+-----+\n")
    end

    it "renders the separator for a 3x2 table with padding of 2" do
      table = Tablez::Table.new(padding: 2)
      table << [[1, 2, 3], [4, 5, 6]]
      expect(table.separator.render).to eq("+-----+-----+-----+\n")
    end
  end
end
