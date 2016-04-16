module Tablez
  class Table
    attr_reader :rows
    attr_reader :row_objects

    def column(i)
      rows.map { |r| r[i] }
    end

    def column_width(i)
      columns[i].map(&:to_s).max.size
    end

    def columns
      [].tap do |columns|
        i = 0
        while i < rows.map(&:size).max
          columns << rows.map { |r| r[i] }
          i += 1
        end
      end
    end

    def number_of_columns
      rows.map { |r| r.size }.max
    end

    def add_rows(rows)
      @row_objects = Array(rows).map { |r| Row.new(r) }
    end
    alias_method :<<, :add_rows

    def row(i)
      rows[i]
    end

    def rows
      row_objects.map { |ro| ro.row }
    end

    def number_of_rows
      @row_objects.size
    end

    def separator
      Separator.new(self).render
    end

    def table_bottom
      Separator.new(self).bottom
    end

    def render
      separator +
      "".tap do |content|
        row_objects.each do |row|
          content << row.render
        end
      end + table_bottom
    end
  end
end
