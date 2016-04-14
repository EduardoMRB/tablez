module Tablez
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
end
