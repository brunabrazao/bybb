require 'rails_helper'

RSpec.describe "reports/index", type: :view do
  before(:each) do
    assign(:reports, [
      Report.create!(
        weekly_priority: "MyText",
        biggest_challenge: "MyText",
        additional: "MyText"
      ),
      Report.create!(
        weekly_priority: "MyText",
        biggest_challenge: "MyText",
        additional: "MyText"
      )
    ])
  end

  it "renders a list of reports" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
