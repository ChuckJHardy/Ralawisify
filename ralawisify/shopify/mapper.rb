class Ralawisify
  class Shopify
    class Mapper
      def initialize(products, index, image_url)
        @products = products
        @index = index
        @image_url = image_url
      end

      def self.map(products, index, image_url)
        new(products, index, image_url).as_hash
      end

      def as_hash
        mappings.inject({}, &value)
      end

      private
      attr_reader :products, :index

      def value
        ->(acc, (k,v)) { 
          if index < 101
            value = (index.zero? || v[:all]) ? value_for(v) : nil
            acc.merge({ k => value })
          else
            acc
          end
        }
      end

      def mappings
        Adapter.adapt
      end

      def value_for(value)
        Presenter.new(products, @image_url).public_send(value[:content])
      rescue NoMethodError, TypeError
        products.first[value[:content]]
      end
    end
  end
end
