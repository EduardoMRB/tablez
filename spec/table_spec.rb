RSpec.describe Tablez do
  let(:table) { Tablez.new }

  describe Tablez do

    it "takes a block to set up table" do



    end

    it "can set a title" do
      table.title = "Here is a title"
      expect(table.render).to eq <<-EOS.deindent
      +-----------------+
      | Here is a title |
      +-----------------+
      EOS
    end

    it "can add a row" do
      table << [1, 'One']
      expect(table.render).to eq <<-EOS.deindent
      +---+-----+
      | 1 | One |
      +---+-----+
      EOS
    end

    it "can add two rows at once" do
      table << [[1, 'One'], [2, 'Two']]
      expect(table.to_s).to eq <<-EOS.deindent
      +---+-----+
      | 1 | One |
      +---+-----+
      | 2 | Two |
      +---+-----+
      EOS
    end

  end
end
