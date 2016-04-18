module Tablez
  class Cell
    attr_reader :value
    attr_reader :padding
    attr_reader :column_width

    def initialize(value)
      @padding      = " " * 1
      @value        = value
    end

    def value_padding(column_width)
      " " * (column_width - value.to_s.size)
    end

    def width
      (@value.to_s + @padding * 2).size
    end

    def render(column_width)
      padding + value.to_s + value_padding(column_width) + padding
    end
  end
end
