require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/survey")
require("./lib/question")
require("pg")
require("pry")

get("/") do
  erb(:index)
end

get("/surveys") do
  @surveys = Survey.all()
  erb(:surveys)
end

get("/surveys/new") do
  erb(:survey_form)
end

post("/surveys") do
  name = params.fetch("name")
  survey = Survey.create({:name => name, :id => nil})
  @surveys = Survey.all()
  erb(:surveys)
end

get('/surveys/:id') do
  @survey = Survey.find(params.fetch("id").to_i())
  erb(:survey)
end

get('/questions') do
  @questions = Question.all()
  erb(:questions)
end

get('/questions/new') do
  @surveys = Survey.all()
  erb(:question_form)
end

post('/questions') do
  description = params.fetch('description')
  survey_id = params.fetch('survey_id').to_i()
  @survey = Survey.find(survey_id)
  @question = Question.create({:description => description, :survey_id => survey_id, :id => nil})
  @questions = Question.all()
  erb(:questions)
end

get('/questions/:id') do
  @question = Question.find(params.fetch('id').to_i())
  erb(:question)
end
