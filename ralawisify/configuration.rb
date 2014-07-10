class Ralawisify
  module Configure
    extend self

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
      configuration
    end
  end

  class Configuration
    attr_accessor :image_url, :available_images

    def initialize
      self.image_url        = ''
      self.available_images = []
    end
  end
end
