class TableElements
  attr_reader :title

  def title=(title)
    @title = Title.new(title)
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

  def initialize(&block)
    @table_elements = TableElements.new
    yield(@table_elements)
  end

  def title
    @table_elements.title.title
  end

  def calculate_max_width
    [@table_elements.title.width].max
  end

  def width
    @width ||= calculate_max_width
  end

  def separator
    corner + ("-" * width) + corner + line_break
  end

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

  def render_title
    left_row_side + title + right_row_side
  end

  def render
    separator + render_title + table_bottom
  end
end
