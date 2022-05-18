require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('Word paths') do

  before :each do
    Word.clear
  end

  describe('create a word path',{:type => :feature}) do
    it('creates a word and goes to word page') do
      visit('/word')
      click_on('Add a new word')
      fill_in('word_name', :with => 'Giant')
      click_on('Go!')
      expect(page).to have_content('Giant')
    end
  end
  
  describe('update a word path', {:type => :feature}) do
    it('updates a word and returns to page') do
      word = Word.new("Giant", nil)
      word.save
      visit('/word')
      click_on('Giant')
      click_on('Edit word')
      fill_in('name', :with => 'Small')
      click_on('Update')
      expect(page).to have_content('Small')
    end
  end
  
  describe('delete a word path', {:type => :feature}) do
    it('deletes a word and returns to the words page') do
      word = Word.new("Giant", nil)
      word.save
      visit('/word') 
      click_on("Giant")
      click_on("Edit word")
      click_on("Delete word")
      expect(page).to have_no_content("Giant")
    end
  end

end