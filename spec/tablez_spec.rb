require "spec_helper"

RSpec.describe Tablez do
  describe "Tablez.new" do
    it "can take a nested row argument" do
      table = Tablez.new(rows: [[1, 2, 3, 4, 5]])
      expect(table.render).to eq <<-EOS.deindent
      +-------------------+
      | 1 | 2 | 3 | 4 | 5 |
      +-------------------+
      EOS
    end

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
end
