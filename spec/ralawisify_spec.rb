require 'spec_helper'

def path(given)
  [ Dir.pwd, given ].join('/')
end

describe Ralawisify do
  describe '.generate' do
    subject { described_class.generate(source, output) }

    let(:source) { path 'spec/support/source.csv' }
    let(:output) { path 'tmp/output.csv' }

    let(:expected) { CSV.open(path('spec/support/output.csv'), 'r', headers: true) }
    let(:generated) { CSV.open(output, 'r', headers: true) }

    context 'builds output csv' do
      before { subject }

      it 'with expected number of rows' do
        expect(generated.readlines.size).to eq(4)
      end

      it 'with expected output' do
        expect(generated.to_a[0]).to eq(expected.to_a[0])
      end
    end
  end

  after { File.delete(output) }
end
