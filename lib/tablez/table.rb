module Tablez
  ::Array.send(:include, CoreExt::Array::PadEndWithNil)
  class Table
    attr_accessor :rows
    attr_reader :padding

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
      padded_raw_rows = pad_rows(raw_rows, max_row(raw_rows))
      Array(padded_raw_rows).each { |r| rows << Row.new(r, padding) }
    end
    alias_method :<<, :add_rows

    def pad_rows(raw_rows, max_size)
      raw_rows.map { |r| r.pad_end_with_nil(max_size) }
    end

    def columns
      [].tap do |cols|
        rows.map(&:values).transpose.each do |c|
          cols << Column.new(c, padding)
        end
      end
    end

    def column(i)
      columns[i]
    end

    def separator
      Separator.new(self)
    end

    def render
      ''.tap do |table|
        table << separator.render
        rows.each_with_index do |r, i|
          table << '|'
          table << r.render(self)
          table << separator.render unless i == rows.size - 1
        end
        table << separator.bottom
      end
    end
  end
end
