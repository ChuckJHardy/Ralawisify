class Ralawisify
  class Shopify
    class Mapper
      def initialize(products, index)
        @products, @index = products, index
      end

      def self.map(products, index)
        new(products, index).as_hash
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
        Presenter.new(products).public_send(value[:content])
      rescue NoMethodError, TypeError
        products.first[value[:content]]
      end
    end
  end
end
