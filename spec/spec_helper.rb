ENV['RACK_ENV']='test'
require("rspec")
require("pg")
require("sinatra/activerecord")
require("survey")
require("question")
require("option")

RSpec.configure do |config|
  config.after(:each) do
    Survey.all().each() do |survey|
      survey.destroy()
    end
    Question.all().each() do |question|
      question.destroy()
    end
  end
end
