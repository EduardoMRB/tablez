module Tablez
  class Row
    attr_reader :values

    def initialize(values)
      @values = values
    end

    def cells
      values.map { |v| Cell.new(v) }
    end

    # def values
    #   cells.map { |c| c.value }
    # end

    # def left_side
    #   "|" + " " * cells.first.width
    # end

    # def right_side
    #   " " * cells.last.width + "|\n"
    # end

    # def values_with_blanks
    #   values.map { |v| v.nil? ? " " : v }
    # end

    # def render
    #   #should just be like this
    #   #cells.render
    #   left_side + values_with_blanks.join(" | ") + right_side
    # end
  end
end
