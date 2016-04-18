module Tablez
  class Column
    attr_reader :values
    attr_reader :padding

    def initialize(values, padding)
      @values  = values
      @padding = padding
    end

    def total_padding_size
      padding * 2
    end

    def width
      values.map(&:to_s).map(&:size).max
    end

    def width_plus_padding
      width + total_padding_size
    end
  end
end
