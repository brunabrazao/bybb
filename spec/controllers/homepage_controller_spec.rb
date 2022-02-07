require 'rails_helper'

RSpec.describe HomepageController do
  it 'renders index template' do
    get :index
    expect(response).to render_template(:index)
  end
end
