class Settings
  attr_accessor :title

  def title_size
    title.size
  end

  def total_padding_width
    1 * 2
  end

  def max_width
    [title_size].max + total_padding_width
  end
end

module Display
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
  include Display

  attr_reader :settings

  def initialize(&block)
    @settings = Settings.new
    yield(@settings)
  end

  def title
    @settings.title
  end

  def width
    @settings.max_width
  end

  def separator
    corner + ("-" * width) + corner + line_break
  end

  def separator_minus_line_break
    corner + ("-" * width) + corner
  end
  alias_method :table_bottom, :separator_minus_line_break

  def render_title
    side_pipe + padding + title + padding + side_pipe + line_break
  end

  def render
    separator + render_title + table_bottom
  end

end
