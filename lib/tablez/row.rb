module Tablez
  class Row
    attr_reader :values
    attr_reader :padding

    def initialize(values, padding)
      @values  = values
      @padding = padding
    end

    def cells
      values.map { |v| Cell.new(v, padding) }
    end

    def render(table)
      ''.tap do |row|
        row << cells.map.with_index { |c, i| c.render(table.column(i).width) }.join("|")
        row << "|\n"
      end
    end
  end
end
