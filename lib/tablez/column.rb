module Tablez
  class Column
    attr_reader :values

    def initialize(values, padding)
      @values = values
      @x_padding = padding
    end

    def padding
      @x_padding * 2
    end

    def width
      values.map(&:to_s).map(&:size).max
    end

    def width_plus_padding
      width + padding
    end
  end
end
