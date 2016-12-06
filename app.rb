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
