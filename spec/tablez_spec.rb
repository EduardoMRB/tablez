require "spec_helper"

RSpec.describe Tablez do

  describe "Tablez" do
    it "can set a title" do
      table = Tablez.new do |t|
                t.title = "This is a title"
              end
      expect(table.render).to eq <<-EOS.deindent
      +-----------------+
      | This is a title |
      +-----------------+
      EOS
    end

    # it "can set a title and one header" do
    #   table = Tablez.new do |t|
    #             t.title  = "This is a title"
    #             t.header = "Header 1"
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
    #             t.title  = "This is a title"
    #             t.header = ["Header 1", "Header 2"]
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
