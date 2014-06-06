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
        'Published' => :published?,
        'Option1 Name' => nil,
        'Option1 Value' => nil,
        'Option2 Name' => nil,
        'Option2 Value' => nil,
        'Option3 Name' => nil,
        'Option3 Value' => nil,
        'Variant SKU' => 'SKU',
        'Variant Grams' => nil,
        'Variant Inventory Tracker' => nil,
        'Variant Inventory Qty' => :inventory_quantity,
        'Variant Inventory Policy' => :inventory_policy,
        'Variant Fulfillment Service' => :fulfillment,
        'Variant Price' => 'Singleprice',
        'Variant Compare At Price' => 'Singleprice',
        'Variant Requires Shipping' => :shipping?,
        'Variant Taxable' => :taxable?,
        'Variant Barcode' => nil,
        'Image Src' => :image,
        'Image Alt Text' => :image_alt
      }
    end

    def as_array
      rows.map do |sku, products|
        mapping.inject({}) do |acc, (k,v)| 
          acc.merge({ k => value_for(v, products) })
        end.values
      end
    end

    private

    def rows
      @rows.group_by { |row| row['SKU'] }
    end

    def value_for(value, products)
      Presenter.new(products).public_send(value)
    rescue NoMethodError, TypeError
      products.first[value]
    end
  end
end
