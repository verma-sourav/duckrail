require 'rails_helper'

module Duckrails
  RSpec.describe Header, type: :model do
    context 'attributes' do
      it { should respond_to :name, :name= }
      it { should respond_to :value, :value= }
    end

    context 'relations' do
      it { should belong_to :mock }
    end

    context 'validations' do
      it { should validate_presence_of :name }
      it { should validate_presence_of :value }
      it { should validate_presence_of :mock }
    end

    context 'CRUD' do
      let(:mock) { FactoryBot.create :mock }

      it 'should save headers' do
        header = FactoryBot.build :header, mock: mock

        expect{ header.save }.to change(Header, :count).from(0).to(1)
      end

      it 'should update headers' do
        header = FactoryBot.create :header, mock: mock

        header.name = 'New Header Name'
        expect(header.save).to be true

        header.reload
        expect(header.name).to eq 'New Header Name'
      end

      it 'should destroy headers' do
        header = FactoryBot.create :header, mock: mock

        expect{ header.destroy }.to change(Header, :count).from(1).to(0)
      end
    end
  end
end
