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
        'Handle'                      => { all: true, content: :formatted_handle },
        'Title'                       => { all: false, content: 'Name' },
        'Body (HTML)'                 => { all: false, content: 'Description' },
        'Vendor'                      => { all: false, content: 'Brand Name' },
        'Type'                        => { all: false, content: :type },
        'Tags'                        => { all: false, content: :tags },
        'Published'                   => { all: false, content: :published? },
        'Option1 Name'                => { all: true, content: :option_one_name },
        'Option1 Value'               => { all: true, content: 'Size' },
        'Option2 Name'                => { all: true, content: :option_two_name },
        'Option2 Value'               => { all: true, content: 'ColourDesc' },
        'Option3 Name'                => { all: true, content: nil },
        'Option3 Value'               => { all: true, content: nil },
        'Variant SKU'                 => { all: true, content: 'SKU' },
        'Variant Grams'               => { all: true, content: nil },
        'Variant Inventory Tracker'   => { all: true, content: nil },
        'Variant Inventory Qty'       => { all: true, content: :inventory_quantity },
        'Variant Inventory Policy'    => { all: true, content: :inventory_policy },
        'Variant Fulfillment Service' => { all: true, content: :fulfillment },
        'Variant Price'               => { all: true, content: 'Singleprice' },
        'Variant Compare At Price'    => { all: true, content: 'Singleprice' },
        'Variant Requires Shipping'   => { all: true, content: :shipping? },
        'Variant Taxable'             => { all: true, content: :taxable? },
        'Variant Barcode'             => { all: true, content: nil },
        'Image Src'                   => { all: false, content: :image },
        'Image Alt Text'              => { all: false, content: :image_alt },
      }
    end

    def as_array
      rows.each_with_index.map do |(_, products), index|
        mapping.inject({}) do |acc, (k,v)| 
          value = (index.zero? || v[:all]) ? value_for(v, products) : nil
          acc.merge({ k => value })
        end.values
      end
    end

    private

    def rows
      @rows.group_by { |row| row['SKU'] }
    end

    def value_for(value, products)
      Presenter.new(products).public_send(value[:content])
    rescue NoMethodError, TypeError
      products.first[value[:content]]
    end
  end
end
