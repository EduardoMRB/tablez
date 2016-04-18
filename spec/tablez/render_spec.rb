require "spec_helper"

RSpec.describe Tablez::Table do
  describe "#render" do
    it "can render a single element row with integer" do
      table = Tablez::Table.new
      table << [[1]]
      expect(table.render).to eq <<-EOS.deindent
      +---+
      | 1 |
      +---+
      EOS
    end

    it "can render a single element row with integer and padding 2" do
      table = Tablez::Table.new(padding: 2)
      table << [[1]]
      expect(table.render).to eq <<-EOS.deindent
      +-----+
      |  1  |
      +-----+
      EOS
    end

    it "can render a single element row with string" do
      table = Tablez::Table.new
      table << [['foo']]
      expect(table.render).to eq <<-EOS.deindent
      +-----+
      | foo |
      +-----+
      EOS
    end

    it "can render a single element row with string and padding 2" do
      table = Tablez::Table.new(padding: 2)
      table << [['foo']]
      expect(table.render).to eq <<-EOS.deindent
      +-------+
      |  foo  |
      +-------+
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

    it "can render a single row with padding 2" do
      table = Tablez::Table.new(padding: 2)
      table << [[1, 2, 3, 4, 5]]
      expect(table.render).to eq <<-EOS.deindent
      +-----+-----+-----+-----+-----+
      |  1  |  2  |  3  |  4  |  5  |
      +-----+-----+-----+-----+-----+
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

    it "can render one row of different size digits with padding 2" do
      table = Tablez::Table.new(padding: 2)
      table << [[9, 101, 5, 12, 3]]
      expect(table.render).to eq <<-EOS.deindent
      +-----+-------+-----+------+-----+
      |  9  |  101  |  5  |  12  |  3  |
      +-----+-------+-----+------+-----+
      EOS
    end

    it "can adjust to keep the correct alignment" do
      table = Tablez::Table.new
      table << [[1, 2, 3, 4, 5], [66, 7, 888, 9, 10]]
      expect(table.render).to eq <<-EOS.deindent
      +----+---+-----+---+----+
      | 1  | 2 | 3   | 4 | 5  |
      +----+---+-----+---+----+
      | 66 | 7 | 888 | 9 | 10 |
      +----+---+-----+---+----+
      EOS
    end

    it "can adjust to keep the correct alignment with padding set to 2" do
      table = Tablez::Table.new(padding: 2)
      table << [[1, 2, 3, 4, 5], [66, 7, 888, 9, 10]]
      expect(table.render).to eq <<-EOS.deindent
      +------+-----+-------+-----+------+
      |  1   |  2  |  3    |  4  |  5   |
      +------+-----+-------+-----+------+
      |  66  |  7  |  888  |  9  |  10  |
      +------+-----+-------+-----+------+
      EOS
    end

    it "can render jagged arrays with the same size columns" do
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

    it "can render jagged arrays with the same size columns and padding set to 2" do
      table = Tablez::Table.new(padding: 2)
      table << [[1, 2, 3, 4, 5], [1, 2]]
      expect(table.render).to eq <<-EOS.deindent
      +-----+-----+-----+-----+-----+
      |  1  |  2  |  3  |  4  |  5  |
      +-----+-----+-----+-----+-----+
      |  1  |  2  |     |     |     |
      +-----+-----+-----+-----+-----+
      EOS
    end

    it "can render jagged arrays with more than two rows" do
      table = Tablez::Table.new
      table << [[1, 2, 3, 4, 5], [1, 2], [5, 5, 5, 6]]
      expect(table.render).to eq <<-EOS.deindent
      +---+---+---+---+---+
      | 1 | 2 | 3 | 4 | 5 |
      +---+---+---+---+---+
      | 1 | 2 |   |   |   |
      +---+---+---+---+---+
      | 5 | 5 | 5 | 6 |   |
      +---+---+---+---+---+
      EOS
    end

    it "can render jagged arrays with more than two rows and padding 2" do
      table = Tablez::Table.new(padding: 2)
      table << [[1, 2, 3, 4, 5], [1, 2], [5, 5, 5, 6]]
      expect(table.render).to eq <<-EOS.deindent
      +-----+-----+-----+-----+-----+
      |  1  |  2  |  3  |  4  |  5  |
      +-----+-----+-----+-----+-----+
      |  1  |  2  |     |     |     |
      +-----+-----+-----+-----+-----+
      |  5  |  5  |  5  |  6  |     |
      +-----+-----+-----+-----+-----+
      EOS
    end

    it "can render jagged arrays with different size columns" do
      table = Tablez::Table.new
      table << [[1, 2, 3, 444, 5], [66, 7, 888]]
      expect(table.render).to eq <<-EOS.deindent
      +----+---+-----+-----+---+
      | 1  | 2 | 3   | 444 | 5 |
      +----+---+-----+-----+---+
      | 66 | 7 | 888 |     |   |
      +----+---+-----+-----+---+
      EOS
    end

    it "can render jagged arrays with different size columns with padding 2" do
      table = Tablez::Table.new(padding: 2)
      table << [[1, 2, 3, 444, 5], [66, 7, 888]]
      expect(table.render).to eq <<-EOS.deindent
      +------+-----+-------+-------+-----+
      |  1   |  2  |  3    |  444  |  5  |
      +------+-----+-------+-------+-----+
      |  66  |  7  |  888  |       |     |
      +------+-----+-------+-------+-----+
      EOS
    end

    it "can properly render a cell missing a value" do
      table = Tablez::Table.new
      table << [[1, 2, 3, 444, 5], [66, 7, 888,'',11]]
      expect(table.render).to eq <<-EOS.deindent
      +----+---+-----+-----+----+
      | 1  | 2 | 3   | 444 | 5  |
      +----+---+-----+-----+----+
      | 66 | 7 | 888 |     | 11 |
      +----+---+-----+-----+----+
      EOS
    end

    it "can properly render a cell missing a value with padding 2" do
      table = Tablez::Table.new(padding: 2)
      table << [[1, 2, 3, 444, 5], [66, 7, 888,'',11]]
      expect(table.render).to eq <<-EOS.deindent
      +------+-----+-------+-------+------+
      |  1   |  2  |  3    |  444  |  5   |
      +------+-----+-------+-------+------+
      |  66  |  7  |  888  |       |  11  |
      +------+-----+-------+-------+------+
      EOS
    end
  end
end
