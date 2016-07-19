require('spec_helper')

describe(Question) do
  describe('#survey') do
    it("tells which survey a question belongs to") do
      survey = Survey.create({:name => 'kitties'})
      question = Question.create({:description => 'do you like kitties', :survey_id => survey.id})
    expect(question.survey.id()).to(eq(survey.id))
    end
  end
end
