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
      padding = 1
      total_padding = padding * 2
      (table.number_of_columns).times do |i|
        x_bars << "-" * (table.column_width(i) + total_padding)
      end
      left_corner + x_bars.join("+") + left_corner
    end

    def render
      padding = 1
      total_padding = padding * 2
      (table.number_of_columns).times do |i|
        x_bars << "-" * (table.column_width(i) + total_padding)
      end
      left_corner + x_bars.join("+") + right_corner
    end
  end
end
