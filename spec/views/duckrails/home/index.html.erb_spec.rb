require 'rails_helper'

RSpec.describe 'duckrails/home/index.html.erb', type: :view do
  let(:title) { t('Home') }

  before do
    render
  end

  subject { rendered }

  context 'content' do
    it { should have_css ".welcome img[src='#{view.asset_path('duckrails.png')}']" }
    it { should have_css '.welcome .home-welcome h1', text: t(:mock_the_universe) }
    it { should have_css '.welcome .home-welcome .page-guide', text: t(:welcome_message) }

    it { should have_css "a.button[href='#{view.duckrails_mocks_path}']", text: t(:view_all_mocks) }
    it { should have_css "a.button[href='#{view.new_duckrails_mock_path}']", text: t(:create_new_mock) }
  end
end
