require 'rails_helper'

RSpec.describe 'homepage/index' do
  it 'renders a boiler plate content' do
    render
    expect(rendered).to have_content('Boilerplate')
  end
end
