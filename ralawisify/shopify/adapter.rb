class Ralawisify
  class Shopify
    class Adapter
      def self.adapt
        {
          'Handle'                      => { all: true, content: :handle },
          'Title'                       => { all: false, content: 'Name' },
          'Body (HTML)'                 => { all: false, content: :description },
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
    end
  end
end
