class Ralawisify
  class Shopify
    class Presenter
      def initialize(rows, image_url)
        @rows, @image_url = rows, image_url
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
        [image_url, @rows.first['LifeStylePic']].join('/')
      end

      def image_url
        @image_url || ''
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
