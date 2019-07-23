require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/sphinx.rb')

get('/') do
  "Home"
  erb(:sphinx)
end

get('/sphinx') do
  "sphinx intro page"
  erb(:sphinx)
end

get ('/sphinx/question1') do
  "question for first riddle here"
  erb(:question1)
end

get ('/sphinx/question2') do
  "question for next riddle here"
  input = params[:question1]
  @answer = q1(input)
  if @answer
    erb(:question2)
  else
    erb(:fail)
  end
end
get ('/sphinx/question3') do
  "question for last riddle here"
  input = params[:question2]
  @answer = q2(input)
  if @answer
    erb(:question3)
  else
    erb(:fail)
  end
end
get ('/sphinx/success') do
  "user has passed the gates and entered thebes"
  input = params[:question3]
  @answer = q3(input)
  if @answer
    erb(:success)
  else
    erb(:fail)
  end
end
# get ('/sphinx/fail') do
#   "user has failed the test of knowledge"
#   erb(:fail)
# end

#-----------------------------
