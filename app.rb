require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
require('./lib/definition')
also_reload('lib/**/*.rb')


get('/') do
  @word = Word.all
  erb(:words)
end

get('/word') do
  @word = Word.all
  erb(:words)
end

get('/word/new') do
  erb(:new_word)
end

get('/word/:id') do
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

post('/word') do
  name = params[:word_name]
  name = Word.new(name, nil)
  name.save()
  @word = Word.all()
  erb(:words)
end

get('/word/:id/edit') do
  @word = Word.find(params[:id].to_i())
  erb(:edit_word)
end

patch('/word/:id') do
  @word = Word.find(params[:id].to_i())
  @word.update(params[:name])
  @word = Word.all
  erb(:Words)
end

delete('/word/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  @word = Word.all
  erb(:words)
end

get('/word/:id/definition/:definition_id') do
  @definition = Definition.find(params[:definition_id].to_i())
  erb(:definition)
end

post('/word/:id/definition') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.new(params[:definition_name], @word.id, nil)
  definition.save()
  erb(:word)
end


patch('/word/:id/definition/:definition_id') do
  @word = Word.find(params[:id].to_i())
  definition = Definition.find(params[:definition_id].to_i())
  definition.update(params[:name], @word.id)
  erb(:word)
end


delete('/word/:id/definition/:word_id') do
  definition = Definition.find(params[:definition_id].to_i())
  definition.delete
  @word = Word.find(params[:id].to_i())
  erb(:word)
end