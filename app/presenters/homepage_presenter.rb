class HomepagePresenter < BasePresenter
  def main_navigation_links
    [
      OpenStruct.new(menu_item: 'Home', link: root_url),
      OpenStruct.new(menu_item: 'How it works', link: root_url),
      OpenStruct.new(menu_item: 'Book a free demo', link: root_url)
    ]
  end
end
