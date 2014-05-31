require 'csv'
require_relative 'ralawisify/shopify'

class Ralawisify
  def initialize(source_path, output_path)
    @source_path, @output_path = source_path, output_path
  end

  def self.generate(source_path, output_path)
    new(source_path, output_path).generate
  end

  def generate
    write_headers
    write_rows
  end

  private

  def write_rows
    CSV.foreach(@source_path, headers: :first_row) do |row|
      add_row(Shopify.new(row).as_array, 'a+')
    end
  end

  def write_headers
    add_row(Shopify.headers, 'wb')
  end

  def add_row(row, type)
    CSV.open(@output_path, type) { |csv| csv.add_row(row) }
  end
end
