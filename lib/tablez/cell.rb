module Tablez
  class Cell
    attr_reader :value
    attr_reader :padding_space
    attr_reader :column_width

    def initialize(value, padding)
      @padding_space = " " * padding
      @value         = value
    end

    def value_padding(column_width)
      " " * (column_width - value.to_s.size)
    end

    def width
      (value.to_s + @padding_space * 2).size
    end

    def render(column_width)
      padding_space + value.to_s + value_padding(column_width) + padding_space
    end
  end
end
