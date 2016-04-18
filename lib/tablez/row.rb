module Tablez
  class Row
    attr_reader :values

    def initialize(values)
      @values = values
    end

    def cells
      values.map { |v| Cell.new(v) }
    end

    def render(table)
      row = ""
      row << cells.map.with_index { |c, i| c.render(table.column(i).width) }.join("|")
      row << "|\n"
    end
  end
end
