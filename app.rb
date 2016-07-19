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
