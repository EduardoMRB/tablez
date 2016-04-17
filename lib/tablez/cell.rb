module Tablez
  class Cell
    attr_reader :value

    def initialize(value)
      @padding = " " * 1
      @value = value
    end

    def width
      (@value.to_s + @padding * 2).size
    end

  end
end
