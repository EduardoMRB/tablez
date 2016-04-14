require "spec_helper"

RSpec.describe Tablez::Table do
  describe "columns" do
    it "can select columns" do
      table = Tablez::Table.new
      table << [[3, 5], [1, 2, 3]]
      expect(table.column(0)).to eq([3, 1])
      expect(table.column(2)).to eq([nil, 3])
    end

    it "can count columns" do
      table = Tablez::Table.new
      table << [[3, 5], [1, 2, 3]]
      expect(table.number_of_columns).to eq(3)
    end

    it "can return all columns" do
      table = Tablez::Table.new
      table << [[3, 5], [1, 2, 3]]
      expect(table.columns).to eq([[3, 1], [5, 2], [nil, 3]])
    end

    it "can find column width" do
      table = Tablez::Table.new
      table << [["what", "foo bar"], ["foo", "foo bar baz qux", "lolol"]]
      expect(table.column_width(0)).to eq(4)
      expect(table.column_width(1)).to eq(15)
      expect(table.column_width(2)).to eq(5)
    end
  end

  describe "rows" do
    it "can select rows" do
      table = Tablez::Table.new
      table << [[3, 5], [1, 2, 3]]
      expect(table.row(0)).to eq([3, 5])
    end

    it "can count rows" do
      table = Tablez::Table.new
      table << [[3, 5], [1, 2, 3]]
      expect(table.number_of_rows).to eq(2)
    end

    it "can return all rows" do
      table = Tablez::Table.new
      table << [[3, 5], [1, 2, 3]]
      expect(table.rows).to eq([[3, 5], [1, 2, 3]])
    end
  end









    # it "can render one row of single digits" do
    #   table = Tablez::Table.new(rows: [[1, 2, 3, 4, 5]])
    #   expect(table.render).to eq <<-EOS.deindent
    #   +---+---+---+---+---+
    #   | 1 | 2 | 3 | 4 | 5 |
    #   +---+---+---+---+---+
    #   EOS
    # end

    # it "can render one row of different size digits" do
    #   table = Tablez.new(rows: [[9, 101, 5, 12, 3]])
    #   expect(table.render).to eq <<-EOS.deindent
    #   +---+-----+---+----+---+
    #   | 9 | 101 | 5 | 12 | 3 |
    #   +---+-----+---+----+---+
    #   EOS
    # end

    # it "can adjust to keep the correct padding" do
    #   table = Tablez.new(rows: [[1, 2, 3, 4, 5], [6, 7, 8, 9, 10]])
    #   expect(table.render).to eq <<-EOS.deindent
    #   +--------------------+
    #   | 1 | 2 | 3 | 4 | 5  |
    #   +--------------------+
    #   | 6 | 7 | 8 | 9 | 10 |
    #   +--------------------+
    #   EOS
    # end

    # it "will interpret a single array as one row" do
    #   table = Tablez.new(rows: [1, 2, 3, 4, 5])
    #   expect(table.render).to eq <<-EOS.deindent
    #   +-------------------+
    #   | 1 | 2 | 3 | 4 | 5 |
    #   +-------------------+
    #   EOS
    # end


    # it "can handle jagged arrays" do
    #   table = Tablez.new(rows: [[1, 2, 3, 4, 5], [1, 2]])
    #   expect(table.render).to eq <<-EOS.deindent
    #   +-------------------+
    #   | 1 | 2 | 3 | 4 | 5 |
    #   +-------------------+
    #   | 1 | 2 |           |
    #   +-------------------+
    #   EOS
    # end

    # it "can set a title" do
    #   table = Tablez.new do |t|
    #             t.title = "This is a title"
    #           end
    #   expect(table.render).to eq <<-EOS.deindent
    #   +-----------------+
    #   | This is a title |
    #   +-----------------+
    #   EOS
    # end

    # it "can set a title and one header" do
    #   table = Tablez.new do |t|
    #             t.title   = "This is a title"
    #             t.headers = "Header 1"
    #           end
    #   expect(table.render).to eq <<-EOS.deindent
    #   +-----------------+
    #   | This is a title |
    #   +-----------------+
    #   |    Header 1     |
    #   +-----------------+
    #   EOS
    # end

    # it "can set a title and a 2 column header" do
    #   table = Tablez.new do |t|
    #             t.title   = "This is a title"
    #             t.headers = ["Header 1", "Header 2"]
    #           end
    #   expect(table.render).to eq <<-EOS.deindent
    #   +---------------------+
    #   |   This is a title   |
    #   +---------------------+
    #   | Header 1 | Header 2 |
    #   +---------------------+
    #   EOS
    # end

    # it "can set a title and empty rows" do
    #   table = Tablez.new do |t|
    #             t.title = "This is a title"
    #             t.rows  = 2
    #           end
    #   expect(table.render).to eq <<-EOS.deindent
    #   +-----------------+
    #   | Here is a title |
    #   +-----------------+
    #   |                 |
    #   +-----------------+
    #   |                 |
    #   +-----------------+
    #   EOS
    # end

    # it "can add a row" do
    #   table << [1, 'One']
    #   expect(table.render).to eq <<-EOS.deindent
    #   +---+-----+
    #   | 1 | One |
    #   +---+-----+
    #   EOS
    # end

    # it "can add two rows at once" do
    #   table << [[1, 'One'], [2, 'Two']]
    #   expect(table.to_s).to eq <<-EOS.deindent
    #   +---+-----+
    #   | 1 | One |
    #   +---+-----+
    #   | 2 | Two |
    #   +---+-----+
    #   EOS
    # end
end
