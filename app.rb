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
  @survey = Survey.new({:name => name, :id => nil})
  @surveys = Survey.all()
  if @survey.save()
    erb(:surveys)
  else
    erb(:errors)
  end
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
  if @question.save()
    erb(:questions)
  else
    erb(:errors)
  end
end

get('/questions/:id') do
  @question = Question.find(params.fetch('id').to_i())
  erb(:question_edit)
end

get('/questions/:id/edit') do
  @question = Question.find(params.fetch('id').to_i())
  erb(:question_edit)
end

patch('/questions/:id') do
  description = params.fetch("description")
  @question = Question.find(params.fetch("id").to_i())
  @question.update({:description => description})
  erb(:question_edit)
end

delete('/questions/:id/delete') do
  @question = Question.find(params.fetch('id').to_i())
  @question.delete()
  @questions = Question.all()
  erb(:questions)
end

get('/surveys/:id/edit') do
  @survey = Survey.find(params.fetch("id").to_i())
  erb(:survey_edit)
end

patch('/surveys/:id/edit') do
  name = params.fetch('name')
  @survey = Survey.find(params.fetch("id").to_i())
  @survey.update({:name => name})
  erb(:survey)
end

delete('/surveys/:id/delete') do
  @survey = Survey.find(params.fetch('id').to_i())
  @survey.delete()
  @surveys = Survey.all()
  erb(:surveys)
end
