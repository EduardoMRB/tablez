module Tablez
  class Row
    attr_accessor :row

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

    def values_with_blanks
      values.map { |v| v.nil? ? " " : v }
    end

    def render
      left_side + values_with_blanks.join(" | ") + right_side
    end
  end
end
