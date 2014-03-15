include ApplicationHelper

def sign_in(user, options={}) 
	if options[:no_capybara]
		#sign in without capybara
		remember_token = User.new_remember_token
		cookies[:remember_token] = remember_token
		user.update_attribute(:remember_token, User.encrypt(remember_token))
	else
		visit signin_path
		fill_in "Email", with: user.email 
		fill_in "Password", with: user.password
		click_button "Sign in"
	end
end



RSpec::Matchers.define :have_error_message do |message|
	match do |page|
		expect(page).to have_selector('div.alert.alert-error', text: message)
	end
end

def current_user
 	remember_token = User.encrypt(cookies[:remember_token])
 	@current_user ||= User.find_by(remember_token: remember_token)
end

def signed_in?
	!current_user.nil?
end