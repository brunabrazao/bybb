require 'rails_helper'

RSpec.describe HomepagePresenter do
  describe '#main_navigation_links' do
    it 'returns an array with menu items' do
      expect(subject.main_navigation_links).to eq(
        [OpenStruct.new(menu_item: 'Home', link: Rails.application.routes.url_helpers.root_url),
         OpenStruct.new(menu_item: 'How it works', link: Rails.application.routes.url_helpers.root_url), OpenStruct.new(menu_item: 'Book a free demo', link: Rails.application.routes.url_helpers.root_url)]
      )
    end
  end

  describe '#carousel_props' do
    it 'returns an array with carousel props' do
      expect(subject.carousel_props).to eq(
        [OpenStruct.new(
          carousel_item_class: 'active first-carousel-item',
          header: 'We exist to facilitate conversations',
          copy: 'Engage employees, empower and train managers by helping them to become the best version of themselves.',
          cta: 'Learn more'
        ), OpenStruct.new(
          carousel_item_class: 'second-carousel-item',
          header: 'Your partner for continuous performance management',
          copy: 'Effectively manage expectations through open communication',
          cta: 'Book a demo'
        )]
      )
    end
  end
end
