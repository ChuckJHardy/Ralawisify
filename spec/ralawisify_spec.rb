require 'spec_helper'

def path(given)
  [ Dir.pwd, given ].join('/')
end

describe Ralawisify do
  describe '.generate' do
    subject { described_class.generate(source) }

    let(:source) { path 'spec/support/source.csv' }
    let(:output) { path 'tmp/output_0.csv' }
    let(:image_url) { 'http://www.promotional-store.com/images/thumbs' }
    let(:available_images) { path 'spec/support/available_images.csv' }

    let(:expected) { CSV.open(path('spec/support/output.csv'), 'r', headers: true) }
    let(:generated) { CSV.open(output, 'r', headers: true) }

    before do
      Ralawisify.configure do |config|
        config.image_url = image_url
        config.available_images = CSV.open(available_images).flat_map(&:first)
      end
    end

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
