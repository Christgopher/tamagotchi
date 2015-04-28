require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_expectations, false)

describe('the tamagotchi website path', :type => :feature) do
  it('shows list of the Tamagotchis') do
    visit('/')
    fill_in('name', :with => 'lil dragon')
    click_button('Submit')
    click_link('Back')
    expect(page).to have_content('lil dragon')
  end
end
