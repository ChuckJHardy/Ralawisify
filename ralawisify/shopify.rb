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
        'Handle' => nil,
        'Title' => nil,
        'Body (HTML)' => nil,
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
      mapping.inject({}) { |acc, (k,v)| acc.merge({ k => (v ? @row[v] : v) }) }
    end
  end
end
