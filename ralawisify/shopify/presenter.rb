class Ralawisify
  class Shopify
    class Presenter
      def initialize(rows)
        @rows = rows
      end

      def handle
        title.map(&:downcase).join('-').gsub(' ', '-')
      end

      def image_alt
        title.join(' ')
      end

      def title
        [ @rows.first['ProdGrp'], @rows.first['Name'] ]
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
        [Ralawisify.configuration.image_url, image_or_error].join('/')
      end

      def image_or_error
        image? ? life_style_image : 'error.jpeg'
      end

      def image?
        Ralawisify.configuration.available_images.include?(life_style_image)
      end

      def life_style_image
        @rows.first['LifeStylePic']
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
        directory_category? ? sub_category : category
      end

      def directory_category?
        category.include?("Directory")
      end

      def category
        @rows.first['Category']
      end

      def sub_category
        @rows.first['Subcategory']
      end
    end
  end
end
