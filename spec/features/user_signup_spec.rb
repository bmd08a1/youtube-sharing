require 'rails_helper'

RSpec.describe 'User signup' do
  context 'signup successful' do
    it 'logs user in and redirect to posts page' do
      visit root_path
      within('.header') do
        expect(page).to have_content("Sign up")
        click_link 'Sign up'
      end

      fill_in 'user_name', with: 'dung'
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'

      click_button 'Sign up'

      expect(page).to have_current_path(posts_path)
      within('.header') do
        expect(page).to have_content("Welcome dung")
        expect(page).to have_content("Share a movie")
      end
    end
  end

  context 'signup failed' do
    context 'missing name' do
      it 'stays at signup page and show errors' do
        visit signup_path
        fill_in 'user_email', with: 'test@gmail.com'
        fill_in 'user_password', with: 'password'
        fill_in 'user_password_confirmation', with: 'password'

        click_button 'Sign up'

        expect(page).to have_current_path(signup_path)
        within('.errors') do
          expect(page).to have_content("Name can't be blank")
        end
      end
    end

    context 'missing email' do
      it 'stays at signup page and show errors' do
        visit signup_path
        fill_in 'user_name', with: 'dung'
        fill_in 'user_password', with: 'password'
        fill_in 'user_password_confirmation', with: 'password'

        click_button 'Sign up'

        expect(page).to have_current_path(signup_path)
        within('.errors') do
          expect(page).to have_content("Email can't be blank")
        end
      end
    end

    context 'mismatch password' do
      it 'stays at signup page and show errors' do
        visit signup_path
        fill_in 'user_name', with: 'dung'
        fill_in 'user_email', with: 'test@gmail.com'
        fill_in 'user_password', with: 'password'
        fill_in 'user_password_confirmation', with: 'password1'

        click_button 'Sign up'

        expect(page).to have_current_path(signup_path)
        within('.errors') do
          expect(page).to have_content("Password confirmation doesn't match Password")
        end
      end
    end

    context 'duplicate email' do
      let!(:other_user) { create(:user, email: 'test@gmail.com') }

      it 'stays at login page and show errors' do
        visit signup_path
        fill_in 'user_name', with: 'dung'
        fill_in 'user_email', with: 'test@gmail.com'
        fill_in 'user_password', with: 'password'
        fill_in 'user_password_confirmation', with: 'password'

        click_button 'Sign up'

        expect(page).to have_current_path(signup_path)
        within('.errors') do
          expect(page).to have_content("Email has already been taken")
        end
      end
    end
  end
end
