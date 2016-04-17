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
      "|" + " " * cells.first.width
    end

    def right_side
      " " * cells.last.width + "|\n"
    end

    def values_with_blanks
      values.map { |v| v.nil? ? " " : v }
    end

    def render
      require 'pry'; binding.pry;
      left_side + values_with_blanks.join(" | ") + right_side
    end
  end
end
