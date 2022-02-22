require 'rails_helper'

RSpec.describe "reports/edit", type: :view do
  before(:each) do
    @report = assign(:report, Report.create!(
      weekly_priority: "MyText",
      biggest_challenge: "MyText",
      additional: "MyText"
    ))
  end

  it "renders the edit report form" do
    render

    assert_select "form[action=?][method=?]", report_path(@report), "post" do

      assert_select "textarea[name=?]", "report[weekly_priority]"

      assert_select "textarea[name=?]", "report[biggest_challenge]"

      assert_select "textarea[name=?]", "report[additional]"
    end
  end
end
