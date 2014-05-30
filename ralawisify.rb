require 'csv'
require_relative 'ralawisify/output'
require_relative 'ralawisify/shopify'

class Ralawisify
  def initialize(source_path, output_path)
    @source_path, @output_path = source_path, output_path
  end

  def self.generate(source_path, output_path)
    new(source_path, output_path).generate
  end

  def generate
    output.write_headers
  end

  private

  def output
    @output ||= Output.new(shopify, @output_path)
  end

  def shopify
    Shopify.new
  end
end
