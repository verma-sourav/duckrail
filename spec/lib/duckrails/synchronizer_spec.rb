require 'rails_helper'

module Duckrails
  RSpec.describe Synchronizer do
    describe 'class attributes' do
      subject { Synchronizer }

      it { should respond_to :mock_synchronization_token, :mock_synchronization_token= }
    end

    describe '#call' do
      let(:app) { double :app }
      let(:env) { double :env }
      let(:status) { double :status }
      let(:headers) { double :headers }
      let(:response) { double :response }
      let(:mock_synchronization_token) { '123456' }
      let(:state) { FactoryBot.build :application_state,
                                     mock_synchronization_token: mock_synchronization_token }

      context 'when synchronized' do
        it 'should not try to syncrhonize the mocks' do
          Synchronizer.mock_synchronization_token = mock_synchronization_token
          expect(ApplicationState).to receive(:instance).and_return(state)

          expect(Router).to receive(:reset!).never
          expect(app).to receive(:call).with(env).and_return([status, headers, response])

          result = Synchronizer.new(app).call(env)
          expect(result).to eq [status, headers, response]
        end
      end

      context 'when not synchronized' do
        it 'should syncrhonize the mocks' do
          Synchronizer.mock_synchronization_token = '789123'
          expect(ApplicationState).to receive(:instance).and_return(state)
          expect(Rails.logger).to receive(:info) do |message|
            expect(message).to eq 'Mock synchronization token missmatch. Syncronizing...'
          end
          expect(Rails.logger).to receive(:info) do |message|
            expect(message).to eq 'Mock synchronization completed.'
          end

          expect(Router).to receive(:reset!).once
          expect(app).to receive(:call).with(env).and_return([status, headers, response])

          result = Synchronizer.new(app).call(env)
          expect(result).to eq [status, headers, response]
        end
      end
    end

    describe '.generate_token' do
      it 'should generate secure random uuid' do
        expect(SecureRandom).to receive(:uuid).once.and_return('123456')

        expect(Synchronizer.generate_token).to eq '123456'
      end
    end
  end
end
