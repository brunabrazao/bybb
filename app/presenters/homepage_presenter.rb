class HomepagePresenter < BasePresenter
  def initialize(current_user)
    @current_user = current_user
  end

  def main_navigation_links
    [
      OpenStruct.new(menu_item: 'Home', link: root_url),
      OpenStruct.new(menu_item: 'How it works', link: how_it_works_path)
    ]
  end

  def main_navigation_signed_in_links
    menu = [
      OpenStruct.new(menu_item: 'Dashboard', link: dashboard_path),
      OpenStruct.new(menu_item: 'Create Weekly Report', link: new_report_path),
      OpenStruct.new(menu_item: 'Manage Reports', link: reports_path),
      OpenStruct.new(menu_item: 'Manage Reviews', link: reviews_url),
      OpenStruct.new(menu_item: 'Company Feed', link: feed_path(set_company_feed))

    ]

    menu << OpenStruct.new(menu_item: 'Manage Organisations', link: organisations_path) if @current_user.role.admin?
    if @current_user.role.admin? || @current_user.role.org_admin?
      menu << OpenStruct.new(menu_item: 'Manage Review Cycles',
                             link: reviews_cycles_path)
    end

    menu
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
                     cta: 'See how it works')
    ]
  end

  def featurette_props
    [
      OpenStruct.new(featurette_item_class: '',
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
                     img: 'homepage/pexels-3184357')
    ]
  end

  private

  def set_company_feed
    org = Organisation.find_by(id: @current_user.organisation_id)
    org.feed.id
  end
end
