require('capybara/rspec')
require('capybara')
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

describe("the add doctor path", {:type => :feature}) do
  it('takes user input for doctor name, and specialty')do
    visit('/add_doctor')
    fill_in('doctor_name_input', :with => "Tim")
    fill_in('doctor_specialty_input', :with => "Backrubiatry")
    click_button('Add the Doc!')
    expect(page).to have_content("Your information has been added!")
  end
end

describe("the add patient path", {:type => :feature}) do
  it('takes user input for patient name and birthdate')do
    visit('/add_patient')
    fill_in('patient_name_input', :with => "Tom")
    fill_in('patient_birthdate_input', :with => "1898-05-12")
    click_button('Add the Patient!')
    expect(page).to have_content("Your information has been added!")
  end
end

describe("the index page from a success page", {:type => :feature}) do
  it("populates lists with all patients and doctors added") do
    visit('/add_doctor')
    fill_in('doctor_name_input', :with => "Jekyll")
    fill_in('doctor_specialty_input', :with => "Mixology")
    click_on('Add the Doc!')
    visit('/add_doctor')
    fill_in('doctor_name_input', :with => "Phil")
    fill_in('doctor_specialty_input', :with => "Bullshitting")
    click_on('Add the Doc!')
    visit('/add_patient')
    fill_in('patient_name_input', :with => "Mr. Hyde")
    fill_in('patient_birthdate_input', :with => "1902-01-12")
    click_on('Add the Patient!')
    visit('/add_patient')
    fill_in('patient_name_input', :with => "Mr. Andrade")
    fill_in('patient_birthdate_input', :with => "1985-04-13")
    click_on('Add the Patient!')
    click_on('Home')
    expect(page).to have_content("Jekyll")
  end
end
