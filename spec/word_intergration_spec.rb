require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path',{:type => :feature}) do
  it('creates a word and goes to word page') do
    visit('/word')
    click_on('Add a new word')
    fill_in('word_name', :with => 'Giant')
    click_on('Go!')
    expect(page).to have_content('Giant')
  end
end