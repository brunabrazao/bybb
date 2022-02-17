require 'rails_helper'

RSpec.describe HomepageController do
  it 'renders index template' do
    get :index
    expect(response).to render_template(:index)
  end

  it 'renders how it works template' do
    get :how_it_works
    expect(response).to render_template(:how_it_works)
  end
end
