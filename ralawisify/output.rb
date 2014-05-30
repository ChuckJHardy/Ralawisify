class Ralawisify
  class Output
    def initialize(template, path)
      @template = template
      @path = path
    end

    def write_headers
      add_row(@template.headers)
    end

    def add_row(row)
      CSV.open(@path, 'wb') { |csv| csv.add_row(row) }
    end
  end
end
