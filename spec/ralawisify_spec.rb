require 'spec_helper'

describe Ralawisify do
  describe '.generate' do
    subject { described_class.generate(source, output) }

    let(:source) { 'spec/support/source.csv' }
    let(:output) { 'tmp/output.csv' }

    let(:expected) { File.read('spec/support/output.csv') }
    let(:generated) { File.read(output) }

    it 'generates matching output csv' do
      expect(generated).to eq(expected)
    end
  end

  after { File.delete(output) }
end
