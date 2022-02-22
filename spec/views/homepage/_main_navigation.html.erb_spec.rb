require 'rails_helper'

RSpec.describe 'homepage/_main_navigation' do
  context 'when user is signed in' do
    before do
      allow(view).to receive(:user_signed_in?).and_return(true)
    end

    it 'renders sign out button' do
      render
      expect(rendered).to have_css('button[type=submit]', text: 'Sign out')
    end

    it 'does not render sign in link' do
      render
      expect(rendered).to_not have_css('a', text: 'Sign in')
    end
  end

  context 'when user has not signed in' do
    before do
      allow(view).to receive(:user_signed_in?).and_return(false)
    end

    it 'renders sign in link' do
      render
      expect(rendered).to have_css('a', text: 'Sign in')
    end

    it 'does not render sign out button' do
      render
      expect(rendered).to_not have_css('fuck')
    end
  end
end
