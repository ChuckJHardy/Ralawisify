require 'csv'
require_relative 'ralawisify/shopify/presenter'
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
    source.each(&write_row)
  end

  def write_row
    ->(_, v) { Shopify.new(v).as_array.each { |row| add_row(row) } }
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
