require 'csv'
require_relative 'ralawisify/shopify/mapper'
require_relative 'ralawisify/shopify/adapter'
require_relative 'ralawisify/shopify/presenter'
require_relative 'ralawisify/shopify'

class Ralawisify
  LIMIT = 200

  def initialize(source_path, image_url)
    @source_path, @image_url = source_path, image_url
  end

  def self.generate(source_path, image_url)
    new(source_path, image_url).generate
  end

  def generate
    write_rows
  end

  private

  def write_rows
    source.each_with_index(&write)
  end

  def write
    ->((_, v), index) { 
      print '.'
      Shopify.new(v, @image_url).as_array.each { |row| add_row(row, path_for(index)) } 
    }
  end

  def path_for(index)
    [Dir.pwd, 'tmp', "output_#{index/LIMIT}.csv"].join('/')
  end

  def add_row(row, path, type='a+')
    CSV.open(path, type) do |csv| 
      csv.add_row(Shopify.headers) if csv.first.nil?
      csv.add_row(row)
    end
  end

  def size
    @size ||= source.size
  end

  def source
    @source ||= CSV.read(@source_path, headers: :first_row).group_by { |row| row['ProdGrp'] }
  end
end
