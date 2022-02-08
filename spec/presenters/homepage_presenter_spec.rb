require 'rails_helper'

RSpec.describe HomepagePresenter do
  describe '#main_navigation_links' do
    it 'returns an array with menu items' do
      expect(subject.main_navigation_links).to eq(
        [OpenStruct.new(menu_item: 'Home', link: Rails.application.routes.url_helpers.root_url), OpenStruct.new(menu_item: 'How it works', link: Rails.application.routes.url_helpers.root_url), OpenStruct.new(menu_item: 'Book a free demo', link: Rails.application.routes.url_helpers.root_url)])
    end
  end
end
