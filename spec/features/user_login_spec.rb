require 'rails_helper'

RSpec.describe 'User login', type: :feature do
  context 'login successful' do
    let!(:user) { create(:user, name: 'dung', email: 'test@gmail.com') }

    it 'logs user in and redirect to posts page' do
      visit login_path
      fill_in 'session_email', with: 'test@gmail.com'
      fill_in 'session_password', with: 'password'

      click_button 'Log in'

      expect(page).to have_current_path(posts_path)
      within('.header') do
        expect(page).to have_content("Welcome dung")
        expect(page).to have_content("Share a movie")
      end
    end
  end

  context 'login failed' do
    context 'invalid password' do
      let!(:user) { create(:user, name: 'dung', email: 'test@gmail.com') }

      it 'stays at login page and show errors' do
        visit login_path
        fill_in 'session_email', with: 'test@gmail.com'
        fill_in 'session_password', with: 'invalid-password'

        click_button 'Log in'

        expect(page).to have_current_path(login_path)
        within('.flash-danger') do
          expect(page).to have_content("Invalid email/password")
        end
      end
    end

    context 'invalid email' do
      it 'stays at login page and show errors' do
        visit login_path
        fill_in 'session_email', with: 'test@gmail.com'
        fill_in 'session_password', with: 'password'

        click_button 'Log in'

        expect(page).to have_current_path(login_path)
        within('.flash-danger') do
          expect(page).to have_content("Invalid email/password")
        end
      end
    end
  end
end
