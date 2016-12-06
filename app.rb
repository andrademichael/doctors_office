require('sinatra')
require('sinatra/reloader')
require('pry')
require('rspec')
require('capybara')
require('pg')
require('.\app.rb')
require('lib\*.rb')
also_reload('lib/**/*.rb')

get("/") do
  erb(:index)
end
