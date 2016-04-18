module Tablez
  class Separator
    attr_reader :table
    attr_accessor :x_bars

    def initialize(table)
      @table  = table
      @x_bars = []
    end

    def left_corner
      "+"
    end

    def right_corner
      "+\n"
    end

    def bottom
      x_bars = []
      table.columns.each do |column|
        x_bars << "-" * (column.width_plus_padding)
      end
      left_corner + x_bars.join("+") + left_corner
    end

    def render
      x_bars = []
      table.columns.each do |column|
        x_bars << "-" * (column.width_plus_padding)
      end
      left_corner + x_bars.join("+") + right_corner
    end
  end
end
