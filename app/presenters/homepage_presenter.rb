class HomepagePresenter < BasePresenter
  def main_navigation_links
    [
      OpenStruct.new(menu_item: 'Home', link: root_url),
      OpenStruct.new(menu_item: 'How it works', link: root_url),
      OpenStruct.new(menu_item: 'Book a free demo', link: root_url)
    ]
  end

  def carousel_props
    [
      OpenStruct.new(carousel_item_class: 'active first-carousel-item',
                     header: 'We exist to facilitate conversations',
                     copy: 'Engage employees, empower and train managers by helping them to become the best version of themselves.',
                     cta: 'Learn more'),
      OpenStruct.new(carousel_item_class: 'second-carousel-item',
                     header: 'Your partner for continuous performance management',
                     copy: 'Effectively manage expectations through open communication',
                     cta: 'Book a demo')
    ]
  end
end
