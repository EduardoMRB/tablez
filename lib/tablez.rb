# class TableElements
#   attr_reader :title, :headers

#   def title=(title)
#     @title = Title.new(title)
#   end

#   def headers=(headers)
#     @headers = Headers.new(headers)
#   end

#   class Headers
#     attr_reader :headers

#     def initialize(headers)
#       @headers = Array(headers).join(" | ")
#     end

#     def total_padding_width
#       1 * 2
#     end

#     def width
#       headers.size + total_padding_width
#     end
#   end

#   class Title
#     attr_reader :title

#     def initialize(title)
#       @title = title
#     end

#     def total_padding_width
#       1 * 2
#     end

#     def width
#       title.size + total_padding_width
#     end
#   end
# end

# module DrawingPieces
#   def padding
#     " " * 1
#   end

#   def left_corner
#     "+"
#   end

#   def right_corner
#     "+\n"
#   end

#   def line_break
#     "\n"
#   end

#   def side_pipe
#     "|"
#   end
# end

module Tablez
  class Table
    attr_reader :rows

    def number_of_columns
      rows.map { |r| r.size }.max
    end

    def column(i)
      rows.map { |r| r[i] }
    end

    def column_width(i)
      columns[i].map(&:to_s).max.size
    end

    def columns
      [].tap do |columns|
        i = 0
        while i <= rows.size
          columns << rows.map { |r| r[i] }
          i += 1
        end
      end
    end

    def rows
      @row_objects.map { |ro| ro.row }
    end

    def add_rows(rows)
      @row_objects = Array(rows).map { |r| Row.new(r) }
    end
    alias_method :<<, :add_rows

    def number_of_rows
      @row_objects.size
    end

    def row(i)
      rows[i]
    end
  end

  class Row
    attr_reader :row

    def initialize(row)
      @row = row
    end

    def cells
      row.each { |r| Cell.new(r) }
    end

    def values
      cells.map { |c| c.value }
    end
  end

  class Cell
    attr_reader :value

    def initialize(value)
      @value = value
    end

  end
end

    # def calculate_max_width
    #   @rows.join(" | ").size + 2
    # end
    # alias_method :width, :calculate_max_width

    # def separator
    #   corner + ("-" * width) + corner + line_break
    # end
    # alias_method :table_top, :separator

    # def separator_minus_line_break
    #   corner + ("-" * width) + corner
    # end
    # alias_method :table_bottom, :separator_minus_line_break

    # def left_row_side
    #   side_pipe + padding
    # end

    # def right_row_side
    #   padding + side_pipe + line_break
    # end

    # def render
    #   table_top +
    #   left_row_side +
    #   @rows.join(" | ") +
    #   right_row_side +
    #   table_bottom
    # end

    # def title
    #   @table_elements.title.title
    # end

    # def headers
    #   @table_elements.headers.headers
    # end

    # def calculate_max_width
    #   require 'pry'; binding.pry;


    #   [@table_elements.title.width,
    #    @table_elements.headers.width].max
    # end
    # alias_method :width, :calculate_max_width




    # def render_title
    #   left_row_side + title + right_row_side
    # end

    # def render_headers
    #   left_row_side + headers + right_row_side
    # end

    # def render
    #   separator + render_title + separator +
    #   separator + render_headers + table_bottom
    # end
  # end
# end
