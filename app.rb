require('sinatra')
require('sinatra/reloader')
also_reload('/lib/**/*.rb')
require('./lib/tamagotchi')

get('/') do
  @names = Tamagotchi.all_list()
  erb(:index)
end

post('/new_names') do
  name = params.fetch('name')
  my_pet = Tamagotchi.new(name)
  @food_level = my_pet.food_level(name)
  my_pet.save()
  erb(:success)
end

post
