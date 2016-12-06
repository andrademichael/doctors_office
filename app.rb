require('sinatra')
require('sinatra/reloader')
require('pry')
require('pg')
require('./lib/doctor.rb')
require('./lib/specialty.rb')
require('./lib/patient.rb')
also_reload('lib/**/*.rb')

get("/") do
  erb(:index)
end

get("/add_doctor") do
  erb(:add_doctor)
end

get("/add_patient") do
  erb(:add_patient)
end

post("/doctor_success") do
  doctor_name = params.fetch('doctor_name_input')
  doctor_specialty = params.fetch('doctor_specialty_input')
  doctor = Doctor.new({:name => doctor_name, :id => nil})
  doctor.save()
  erb(:success)
end

post("/patient_success") do
  patient_name = params.fetch('patient_name_input')
  birthdate = params.fetch('patient_birthdate_input')
  patient = Patient.new({:name => patient_name, :birthdate => birthdate, :id => nil})
  patient.save()
  erb(:success)
end
