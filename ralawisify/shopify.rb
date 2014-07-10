class Ralawisify
  class Shopify
    def initialize(rows)
      @rows = rows
    end

    def self.headers
      Adapter.adapt.keys
    end

    def as_array
      rows.each_with_index.map(&mapper).delete_if(&:empty?)
    end

    private

    def mapper
      ->((_, products), index) { Mapper.map(products, index).values }
    end

    def rows
      @rows.group_by { |row| row['SKU'] }
    end
  end
end
