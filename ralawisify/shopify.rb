class Ralawisify
  class Shopify
    def initialize(rows, image_url)
      @rows, @image_url = rows, image_url
    end

    def self.headers
      Adapter.adapt.keys
    end

    def as_array
      rows.each_with_index.map(&mapper).delete_if(&:empty?)
    end

    private

    def mapper
      ->((_, products), index) { 
        Mapper.map(products, index, @image_url).values 
      }
    end

    def rows
      @rows.group_by { |row| row['SKU'] }
    end
  end
end
