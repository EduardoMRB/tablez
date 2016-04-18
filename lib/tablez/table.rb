module Tablez
  ::Array.send(:include, CoreExt::Array::PadEndWithNil)
  class Table
    attr_accessor :rows

    def initialize
      @rows    = []
      @columns = []
    end

    def max_row(raw_rows)
      raw_rows.map(&:size).max
    end

    def number_of_columns
      rows.first.values.size
    end

    def add_rows(raw_rows)
      max_row_size    = max_row(raw_rows)
      padded_raw_rows = pad_rows(raw_rows, max_row_size)

      Array(padded_raw_rows).each { |e| rows << Row.new(e) }
    end
    alias_method :<<, :add_rows

    def pad_rows(raw_rows, max_size)
      raw_rows.map{ |r| r.pad_end_with_nil(max_size) }
    end

    def columns
      @columns.tap do |cols|
        rows.map { |r| r.values }.transpose.each { |c| cols << Column.new(c) }
      end
    end

    def row(i)
      rows[i]
    end

    def column(i)
      columns[i]
    end

    def separator
      Separator.new(self).render
    end

    def table_bottom
      Separator.new(self).bottom
    end

    def render
      separator +
      "".tap do |table|
        row_objects.each_with_index do |row, i|
          table << row.render
          table << separator unless i == row_objects.size - 1
        end
      end +
      table_bottom
    end
  end
end
