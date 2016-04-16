module Tablez
  class Row
    attr_reader :row

    def initialize(row)
      @row = row
    end

    def cells
      row.map { |r| Cell.new(r) }
    end

    def values
      cells.map { |c| c.value }
    end

    def left_side
      "| "
    end

    def right_side
      " |\n"
    end

    def render
      left_side + values.join(" | ") + right_side
    end
  end
end
