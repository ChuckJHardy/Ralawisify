class Ralawisify
  class Shopify
    def initialize(row)
      @row = row
    end

    def self.headers
      new(nil).mapping.keys
    end

    def mapping
      {
        'Handle' => :formatted_handle,
        'Title' => 'Name',
        'Body (HTML)' => 'Description',
        'Vendor' => nil,
        'Type' => nil,
        'Tags' => nil,
        'Published' => nil,
        'Option1 Name' => nil,
        'Option1 Value' => nil,
        'Option2 Name' => nil,
        'Option2 Value' => nil,
        'Option3 Name' => nil,
        'Option3 Value' => nil,
        'Variant SKU' => 'SKU',
        'Variant Grams' => nil,
        'Variant Inventory Tracker' => nil,
        'Variant Inventory Qty' => nil,
        'Variant Inventory Policy' => nil,
        'Variant Fulfillment Service' => nil,
        'Variant Price' => nil,
        'Variant Compare At Price' => nil,
        'Variant Requires Shipping' => nil,
        'Variant Taxable' => nil,
        'Variant Barcode' => nil,
        'Image Src' => nil,
        'Image Alt Text' => nil
      }
    end

    def as_array
      as_hash.values
    end

    def as_hash
      mapping.inject({}, &row)
    end

    private

    def formatted_handle
      [
        @row['Brand Name'],
        @row['Name']
      ].map(&:downcase).join('-').gsub(' ', '-')
    end

    def row
      ->(acc, (k,v)) { acc.merge({ k => value_for(v) }) }
    end

    def value_for(value)
      send(value)
    rescue NoMethodError, TypeError
      @row[value]
    end
  end
end
