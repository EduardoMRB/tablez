module Tablez
  class Cell
    attr_reader :value
    attr_reader :padding

    def initialize(value, padding)
      @value   = value.to_s
      @padding = padding
    end

    def total_padding_size
      padding * 2
    end

    def padding_spaces
      ' ' * padding
    end

    def value_spaces(column_width)
      ' ' * (column_width - value.size)
    end

    def width
      (value + (' ' * total_padding_size)).size
    end

    def render(column_width)
      padding_spaces + value + value_spaces(column_width) + padding_spaces
    end
  end
end
