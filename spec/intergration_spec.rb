require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('launchy')

describe('home page path', {:type => :feature}) do
  it('allows a user to view the homepage') do
    visit('/')
    expect(page).to have_content('Welcome to Survey Galore')
  end
end


describe('add a new survey', {:type => :feature}) do
  it('allows the user to add a survey') do
    visit('/')
    click_link('Add new survey')
    fill_in("name", :with => 'cat')
    click_button('Add survey')
    expect(page).to have_content('cat')
  end
end

describe('view single survey instance path', {:type => :feature}) do
  it('allows the user to view a single survey') do
    visit('/')
    click_link('Add new survey')
    fill_in("name", :with => 'cat')
    click_button('Add survey')
    expect(page).to have_content('cat')
    click_link("cat")
    expect(page).to have_content('Individual survey page')
  end
end
