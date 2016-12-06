require('sinatra')
require('sinatra/reloader')
require('pry')
require('pg')
require('./lib/doctor.rb')
require('./lib/specialty.rb')
require('./lib/patient.rb')
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => 'doctors_office_test'})

get("/") do
  erb(:index)
end

get("/add_doctor") do
  erb(:add_doctor)
end

post("/success") do
  doctor_name = params.fetch('doctor_name_input')
  doctor_specialty = params.fetch('doctor_specialty_input')
  doctor = Doctor.new({:name => doctor_name, :id => nil})
  doctor.save()
  erb(:success)
end
