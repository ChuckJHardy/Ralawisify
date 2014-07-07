class Ralawisify
  class Shopify
    class Presenter
      def initialize(rows)
        @rows = rows
      end

      def formatted_handle
        title.map(&:downcase).join('-').gsub(' ', '-')
      end

      def image_alt
        title.join(' ')
      end

      def title
        [ @rows.first['Brand Name'], @rows.first['Name'] ]
      end

      def published?
        'FALSE'
      end

      def shipping?
        'TRUE'
      end

      def taxable?
        'TRUE'
      end

      def fulfillment
        'manual'
      end

      def inventory_policy
        'deny'
      end

      def inventory_quantity
        1
      end

      def image
        'http://www.promotional-store.com/images/thumbs/' + @rows.first['LifeStylePic']
      end

      def tags
        @rows.map { |x| x['Subcategory'] }.uniq.join(', ')
      end

      def option_one_name
        'Size'
      end

      def option_two_name
        'Color'
      end

      def type
        'REPLACE'
      end
    end
  end
end
