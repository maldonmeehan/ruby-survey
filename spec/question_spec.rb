require('spec_helper')

describe(Question) do
  it('validates presence of description') do
      question = Question.create({:description => ''})
    expect(question.save()).to(eq(false))
  end

  describe('#survey') do
    it("tells which survey a question belongs to") do
      survey = Survey.create({:name => 'kitties'})
      question = Question.create({:description => 'do you like kitties', :survey_id => survey.id})
    expect(question.survey.id()).to(eq(survey.id))
    end
  end

  describe('#options') do
    it('tells which options belong to a certian question') do
      test_survey = Survey.create({:name => 'Cats'})
      test_question = Question.create({:description => 'Which cat are you?', :survey_id => test_survey.id})
      test_option = Option.create({:answer => 'Calico', :question_id => test_question.id})
      expect(test_question.options()).to(eq([test_option]))
    end
  end
end
