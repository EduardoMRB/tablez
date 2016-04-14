class TableElements
  attr_reader :title, :headers

  def title=(title)
    @title = Title.new(title)
  end

  def headers=(headers)
    @headers = Headers.new(headers)
  end

  class Headers
    attr_reader :headers

    def initialize(headers)
      @headers = Array(headers).join(" | ")
    end

    def total_padding_width
      1 * 2
    end

    def width
      headers.size + total_padding_width
    end
  end

  class Title
    attr_reader :title

    def initialize(title)
      @title = title
    end

    def total_padding_width
      1 * 2
    end

    def width
      title.size + total_padding_width
    end
  end
end

module DrawingPieces
  def padding
    " " * 1
  end

  def corner
    "+"
  end

  def line_break
    "\n"
  end

  def side_pipe
    "|"
  end
end

class Tablez
  include DrawingPieces

  attr_reader :settings

  def initialize(options = {}, &block)
    @rows = options[:rows]

    # if block_given?
    #   @table_elements = TableElements.new
    #   yield(@table_elements)
    # end
  end

  def calculate_max_width
    @rows.join(" | ").size + 2
  end
  alias_method :width, :calculate_max_width

  def separator
    corner + ("-" * width) + corner + line_break
  end
  alias_method :table_top, :separator

  def separator_minus_line_break
    corner + ("-" * width) + corner
  end
  alias_method :table_bottom, :separator_minus_line_break

  def left_row_side
    side_pipe + padding
  end

  def right_row_side
    padding + side_pipe + line_break
  end

  def render
    table_top +
    left_row_side +
    @rows.join(" | ") +
    right_row_side +
    table_bottom
  end

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
end
