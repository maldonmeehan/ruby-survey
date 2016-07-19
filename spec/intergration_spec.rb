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
    expect(page).to have_content('CAT')
  end
end

describe('view single survey instance path', {:type => :feature}) do
  it('allows the user to view a single survey') do
    visit('/')
    click_link('Add new survey')
    fill_in("name", :with => 'cat')
    click_button('Add survey')
    expect(page).to have_content('CAT')
    click_link("CAT")
    expect(page).to have_content('Individual survey page')
  end
end

describe('update a surveys name path', {:type => :feature}) do
  it('allows the user to update the survey name') do
    visit('/')
    click_link('Add new survey')
    fill_in("name", :with => 'cat')
    click_button('Add survey')
    expect(page).to have_content('CAT')
    click_link("CAT")
    click_link("Update")
    fill_in('name', :with => 'DOG')
    click_button('Update')
    expect(page).to have_content('DOG')
  end
end

describe('delete a survey', {:type => :feature}) do
  it('allows the user to delete a survey') do
    visit('/')
    click_link('Add new survey')
    fill_in("name", :with => 'CAT')
    click_button('Add survey')
    expect(page).to have_content('CAT')
    click_link("CAT")
    click_link("Update")
    click_button('Delete')
    expect(page).to have_content('Current Surveys in Database')
  end
end

describe('add a new question', {:type => :feature}) do
  it('allows the user to add a question') do
    visit('/')
    click_link('Add new survey')
    fill_in("name", :with => 'cat')
    click_button('Add survey')
    expect(page).to have_content('CAT')
    visit('/')
    click_link('Add new question')
    fill_in("description", :with => "Do you like cats?")
    click_button('Add question')
    expect(page).to have_content('Do you like cats?')
  end
end

describe('view single question path', {:type => :feature}) do
  it('allows a user to view a single question') do
    visit('/')
    click_link('Add new survey')
    fill_in("name", :with => 'cat')
    click_button('Add survey')
    expect(page).to have_content('CAT')
    visit('/')
    click_link('Add new question')
    fill_in("description", :with => "Do you like cats?")
    click_button('Add question')
    expect(page).to have_content('Do you like cats?')
    click_link('Do you like cats?')
    expect(page).to have_content("Individual question page")
  end
end

describe('edit a question path', {:type => :feature}) do
  it('allows the user to edit the contents of a question') do
    visit('/')
    click_link('Add new survey')
    fill_in("name", :with => 'cat')
    click_button('Add survey')
    expect(page).to have_content('CAT')
    visit('/')
    click_link('Add new question')
    fill_in("description", :with => "Do you like cats?")
    click_button('Add question')
    expect(page).to have_content('Do you like cats?')
    click_link('Do you like cats?')
    expect(page).to have_content("Individual question page")
    fill_in('description', :with => "Do you hate cats?")
    click_button('Update')
    expect(page).to have_content('Do you hate cats?')
  end
end

describe('remove a question path', {:type => :feature}) do
  it('allows the user to edit the contents of the question') do
    visit('/')
    click_link('Add new survey')
    fill_in("name", :with => 'cat')
    click_button('Add survey')
    expect(page).to have_content('CAT')
    visit('/')
    click_link('Add new question')
    fill_in("description", :with => "Do you like cats?")
    click_button('Add question')
    expect(page).to have_content('Do you like cats?')
    click_link('Do you like cats?')
    expect(page).to have_content("Individual question page")
    click_button('Delete')
    expect(page).to have_content('Current Questions in Database')
  end
end
