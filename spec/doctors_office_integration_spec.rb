require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("to the add doctor path", {:type => :feature}) do
  it('the path user takes to get to the add_doctor form') do
    visit('/')
    click_on('Add a new doctor')
    expect(page).to have_content("Doctor's Name")
  end
end
