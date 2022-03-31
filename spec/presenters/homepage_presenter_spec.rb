require 'rails_helper'

RSpec.describe HomepagePresenter do
  let(:feed) { instance_double('Feed', :feed, id: 171_171) }
  let(:role) { double(:role, admin?: false, org_admin?: false) }
  let(:organisation) { instance_double('Organisation', :organisation, feed: feed, id: 171) }
  let(:current_user) do
    instance_double('User', :current_user, role: role, organisation_id: organisation.id)
  end

  before do
    allow(Organisation).to receive(:find_by).with(id: organisation.id).and_return(organisation)
    allow(organisation).to receive(:feed).and_return(feed)
  end

  subject { described_class.new(current_user) }
  describe '#main_navigation_links' do
    it 'returns an array with menu items' do
      expect(subject.main_navigation_links).to eq(
        [OpenStruct.new(menu_item: 'Home', link: Rails.application.routes.url_helpers.root_url),
         OpenStruct.new(menu_item: 'How it works', link: Rails.application.routes.url_helpers.how_it_works_path)]
      )
    end
  end

  describe '#main_navigation_signed_in_links' do
    it 'returns an array with menu items' do
      expect(subject.main_navigation_signed_in_links).to eq(
        [OpenStruct.new(menu_item: 'Dashboard', link: Rails.application.routes.url_helpers.dashboard_path),
         OpenStruct.new(menu_item: 'Create Weekly Report',
                        link: Rails.application.routes.url_helpers.new_report_path),
         OpenStruct.new(menu_item: 'Manage Reports', link: Rails.application.routes.url_helpers.reports_path),
         OpenStruct.new(menu_item: 'Manage Reviews', link: Rails.application.routes.url_helpers.reviews_url),
         OpenStruct.new(menu_item: 'Company Feed', link: Rails.application.routes.url_helpers.feed_path(feed.id))]
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
          cta: 'See how it works'
        )]
      )
    end
  end
  describe '#featurette_props' do
    it 'returns an array with featurette props' do
      expect(subject.featurette_props).to eq(
        [OpenStruct.new(featurette_item_class: '',
                        header: 'Foster better communication',
                        sub_header: 'empowering people',
                        copy: 'Understand what makes your team thrive and unlock peak performance with an open,
                           transparent and human-centred approach.',
                        img: 'homepage/pexels-1552617'),
         OpenStruct.new(featurette_item_class: 'order-md-2',
                        header: 'Technology is not the opposite of',
                        sub_header: 'human',
                        copy: 'A centralised solution that enable line managers, human resources teams and organisations
                           to stay connected with their people helping them to succeed.',
                        img: 'homepage/pexels-3184357')]
      )
    end
  end
end
