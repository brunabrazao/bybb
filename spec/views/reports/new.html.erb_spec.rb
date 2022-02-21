require 'rails_helper'

RSpec.describe "reports/new", type: :view do
  before(:each) do
    assign(:report, Report.new(
      weekly_priority: "MyText",
      biggest_challenge: "MyText",
      additional: "MyText"
    ))
  end

  it "renders new report form" do
    render

    assert_select "form[action=?][method=?]", reports_path, "post" do

      assert_select "textarea[name=?]", "report[weekly_priority]"

      assert_select "textarea[name=?]", "report[biggest_challenge]"

      assert_select "textarea[name=?]", "report[additional]"
    end
  end
end
