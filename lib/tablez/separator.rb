module Tablez
  class Separator
    attr_reader :table

    def initialize(table)
      @table = table
    end

    def corner_minus_line_break; '+' end
    def corner_plus_line_break; "+\n" end

    def render_separator
      [].tap do |hyphens|
        table.columns.each do |column|
          hyphens << "-" * (column.width_plus_padding)
        end
      end
    end

    def bottom
      separator = render_separator
      corner_minus_line_break + separator.join("+") + corner_minus_line_break
    end

    def render
      separator = render_separator
      corner_minus_line_break + separator.join("+") + corner_plus_line_break
    end
  end
end
