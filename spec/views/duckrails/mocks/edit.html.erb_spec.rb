require 'rails_helper'

RSpec.describe 'duckrails/mocks/edit.html.erb', type: :view do
  let(:mock) { FactoryBot.build :mock, name: 'Edited mock' }
  let(:page) { Capybara::Node::Simple.new(rendered) }

  before do
    assign :mock, mock
    render
  end

  subject { page }

  context 'content' do
    it { should have_css 'h1', text: t(:edit_mock_header, mock: 'Edited mock') }
    it { should have_css 'p.page-guide', text: t(:edit_mock_page_guide) }

    it { should render_template partial: '_form' }
  end
end
