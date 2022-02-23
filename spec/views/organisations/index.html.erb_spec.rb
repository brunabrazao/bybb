require 'rails_helper'

RSpec.describe "organisations/index", type: :view do
  before(:each) do
    assign(:organisations, [
      Organisation.create!(
        title: "Title",
        short_description: "MyText"
      ),
      Organisation.create!(
        title: "Title",
        short_description: "MyText"
      )
    ])
  end

  it "renders a list of organisations" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
