require 'rails_helper'

RSpec.describe "organisations/edit", type: :view do
  before(:each) do
    @organisation = assign(:organisation, Organisation.create!(
      title: "MyString",
      short_description: "MyText"
    ))
  end

  it "renders the edit organisation form" do
    render

    assert_select "form[action=?][method=?]", organisation_path(@organisation), "post" do

      assert_select "input[name=?]", "organisation[title]"

      assert_select "textarea[name=?]", "organisation[short_description]"
    end
  end
end
