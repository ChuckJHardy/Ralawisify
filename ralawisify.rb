class Ralawisify
  def initialize(source, output)
    @source, @output = source, output
  end

  def self.generate(source, output)
    new(source, output).generate
  end

  def generate
  end
end
