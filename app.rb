require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
also_reload('lib/**/*.rb')


get('/') do
  @word = Word.all
  erb(:words)
end

get('/word') do
  "This route will show a list of all words."
end

get('/word/new') do
  "This will take us to a page with a form for adding a new words."
end

get('/word/:id') do
  "This route will show a specific words based on its ID. The value of ID here is #{params[:id]}."
end

post('/word') do
  "This route will add an words to our list of words. We can't access this by typing in the URL. In a future lesson, we will use a form that specifies a POST action to reach this route."
end

get('/word/:id/edit') do
  "This will take us to a page with a form for updating an words with an ID of #{params[:id]}."
end

patch('/word/:id') do
  "This route will update an words. We can't reach it with a URL. In a future lesson, we will use a form that specifies a PATCH action to reach this route."
end

delete('/word/:id') do
  "This route will delete an words. We can't reach it with a URL. In a future lesson, we will use a delete button that specifies a DELETE action to reach this route."
end

get('/custom_route') do
  "We can even create custom routes, but we should only do this when needed."
end