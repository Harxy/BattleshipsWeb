require 'spec_helper'

feature 'Starting a new game' do
  scenario 'Starting a new game' do
    visit '/'
    click_link 'New Game'
    expect(page).to have_content "What's your name?"
    fill_in('name', with: 'dave')
    click_button('Submit')
    expect(page).to have_content "Hello, dave"
  end
end

feature 'Allow the user to play against the computer' do
	scenario 'Starting a new game at a randomly generated board' do
		click_button 'A1'
	end
end
	
