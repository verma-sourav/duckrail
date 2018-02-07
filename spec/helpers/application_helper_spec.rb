require 'rails_helper'

describe ApplicationHelper do
  describe '#page_title' do
    it 'should provide content for title' do
      expect(helper).to receive(:content_for).with(:title, 'DuckRails - Test title')
      helper.send :title, 'Test title'
    end
  end
end
