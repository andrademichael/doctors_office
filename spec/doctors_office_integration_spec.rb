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

# describe("the index page from a success page") do
#   it("populates lists with all patients and doctors added") do
#     # new_doctor1 = Doctor.new({:name => "Phil", :specialty_id => "Philibustering"})
#     # new_doctor2 = Doctor.new({:name => "Jekyll", :specialty_id => "Mad Science"})
#     # new_doctor1.save()
#     # new_doctor2.save()
#     # puts Doctor.all()
#     # new_patient1 = Patient.new({:name => "Mr. Hyde", :birthdate => "1822-02-22", :doctor_id => DB.exec("SELECT id FROM doctors WHERE name = 'Jekyll';")})
#     # new_patient2 = Patient.new({:name => "Michael", :birthdate => "1985-04-13", :doctor_id => DB.exec("SELECT id FROM doctors WHERE name = 'Jekyll';")})
#     # visit("/")
#     # new_patient2.save()
#     # new_patient1.save()
#     puts Patient.all()
#     expect(page).to have_content("Jekyll", "Hyde")
#   end
# end
