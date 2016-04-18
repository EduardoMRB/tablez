module Tablez
  ::Array.send(:include, CoreExt::Array::PadEndWithNil)
  class Table
    attr_accessor :rows
    attr_reader   :padding

    def initialize(options = {})
      @rows    = []
      @padding = options[:padding] || 1
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

      Array(padded_raw_rows).each { |r| rows << Row.new(r, padding) }
    end
    alias_method :<<, :add_rows

    def pad_rows(raw_rows, max_size)
      raw_rows.map{ |r| r.pad_end_with_nil(max_size) }
    end

    def columns
      [].tap do |cols|
        rows.map { |r| r.values }.transpose.each { |c| cols << Column.new(c, padding) }
      end
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
      table = ""
      table << separator
      rows.each_with_index do |r, i|
        table << "|"
        table << r.render(self)
        table << separator unless i == rows.size - 1
      end
      table << table_bottom
    end
  end
end
