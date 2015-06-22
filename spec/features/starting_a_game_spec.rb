require 'spec_helper'

feature 'Starting a new game' do
  scenario 'Entering a name' do
    visit '/'
    click_link 'New Game'
    expect(page).to have_content "What's your name?"
    fill_in('name', with: 'dave')
    click_button('Submit')
    expect(page).to have_content "Hello, dave"
  end
  scenario 'no name entered' do
    visit '/'
    click_link 'New Game'
    expect(page).to have_content "What's your name?"
    fill_in('name', with: '')
    click_button('Submit')
    expect(page).to have_content "Hello, Player 1"
  end
end

feature 'Allow the user to play against the computer' do
	scenario 'Starting a new game at a randomly generated board and show it' do
		 visit '/game'
     expect(page).to have_content 'board'
     expect(page).to have_content "Fire at co-ordinates:"
     fill_in('coords', with:'C4')
     click_button('Submit')
     # should change the board section 'C4' to hit
     expect('C4').to eq 'H'
   end
end
