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
  tamagotchi = Tamagotchi.new(name)
  tamagotchi.save()
  erb(:success)
end
