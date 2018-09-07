require 'test_helper'

module Products
  describe Create do
    context 'when creates a valid product' do
      let!(:params) do
        {
          name: 'sample name',
          description: 'sample description',
          price: 1000
        }
      end

      subject(:interaction) { described_class.run(params) }

      it { is_expected.to be_valid }

      it 'should create product' do
        expect { interaction }.to change { Product.count }.from(0).to(1)
      end

      it 'should have proper params as attributes' do
        expect(interaction.result).to have_attributes(params)
      end
    end

    context 'when creates an invalid product' do
      let!(:params) do
        {
          name: nil,
          description: nil,
          price: nil
        }
      end

      subject(:interaction) { described_class.run(params) }

      it { is_expected.to be_invalid }

      it 'should create product' do
        expect { interaction }.not_to change { Product.count }
      end

      it 'should have proper error for name' do
        expect(interaction).to have_error(:missing).for(:name)
      end

      it 'should have propper error for description' do
        expect(interaction).to have_error(:missing).for(:description)
      end

      it 'should have propper error for price' do
        expect(interaction).to have_error(:missing).for(:price)
      end
    end
  end
end
