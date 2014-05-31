class Ralawisify
  class Shopify
    def initialize(rows)
      @rows = rows
    end

    def self.headers
      new(nil).mapping.keys
    end

    def mapping
      {
        'Handle' => :formatted_handle,
        'Title' => 'Name',
        'Body (HTML)' => 'Description',
        'Vendor' => 'Brand Name',
        'Type' => nil,
        'Tags' => :tags,
        'Published' => :is_published?,
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
        @rows.first['Brand Name'],
        @rows.first['Name']
      ].map(&:downcase).join('-').gsub(' ', '-')
    end

    def is_published?
      'FALSE'
    end

    def tags
      @rows.map { |x| x['Subcategory'] }.uniq.join(', ')
    end

    def row
      ->(acc, (k,v)) { acc.merge({ k => value_for(v) }) }
    end

    def value_for(value)
      send(value)
    rescue NoMethodError, TypeError
      @rows.first[value]
    end
  end
end
