require 'csv'
require_relative 'ralawisify/shopify/mapper'
require_relative 'ralawisify/shopify/adapter'
require_relative 'ralawisify/shopify/presenter'
require_relative 'ralawisify/shopify'

class Ralawisify
  def initialize(source_path, output_path, image_url)
    @source_path = source_path
    @output_path = output_path
    @image_url = image_url
  end

  def self.generate(source_path, output_path, image_url)
    new(source_path, output_path, image_url).generate
  end

  def generate
    write_headers
    write_rows
  end

  private

  def write_rows
    source.each(&write_row)
  end

  def write_row
    ->(_, v) { Shopify.new(v, @image_url).as_array.each { |row| add_row(row) } }
  end

  def write_headers
    add_row(Shopify.headers, 'wb')
  end

  def add_row(row, type='a+')
    CSV.open(@output_path, type) { |csv| csv.add_row(row) }
  end

  def source
    CSV.read(@source_path, headers: :first_row).group_by { |row| row['ProdGrp'] }
  end
end
