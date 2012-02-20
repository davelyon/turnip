module Turnip
  class Table
    attr_reader :raw
    alias_method :to_a, :raw

    include Enumerable

    def initialize(raw)
      @raw = raw
    end

    def headers
      raw.first
    end

    def rows
      raw.drop(1)
    end

    def hashes
      rows.map { |row| Hash[headers.zip(row)] }
    end

    def rows_hash
      check_width! 2
      transpose.hashes.first
    end

    def to_list
      check_width! 1
      raw.flatten
    end

    def transpose
      self.class.new(raw.transpose)
    end

    def each
      raw.each { |row| yield(row) }
    end

    private

    def width
      raw[0].size
    end

    def check_width!(expected)
      raise %{The table must have exactly #{expected} columns, not #{width}} unless width == expected
    end
  end
end
