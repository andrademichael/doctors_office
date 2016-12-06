require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("to the add doctor path") do
  it('the path user takes to get to the add_doctor form') do
    visit('/')
    click_link('add a doctor')
    expect(page).to have_content("doctor's name")


  end
end
