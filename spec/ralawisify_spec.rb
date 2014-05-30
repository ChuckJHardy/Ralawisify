require 'spec_helper'

def path(given)
  [ Dir.pwd, given ].join('/')
end

describe Ralawisify do
  describe '.generate' do
    subject { described_class.generate(source, output) }

    let(:source) { path 'spec/support/source.csv' }
    let(:output) { path 'tmp/output.csv' }

    let(:expected) { CSV.open(path 'spec/support/output.csv') }
    let(:generated) { CSV.open(output) }

    context 'builds output csv' do
      before { subject }

      it 'with expected headers' do
        expect(generated.headers).to eq(expected.headers)
      end
    end
  end

  after { File.delete(output) }
end
