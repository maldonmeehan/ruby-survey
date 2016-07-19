require('spec_helper')

describe(Survey) do

  it('validates presence of name') do
    survey = Survey.new({:name => ""})
    expect(survey.save()).to(eq(false))
  end

  it('converts the name to uppercase') do
    survey = Survey.create({:name => "cat"})
    expect(survey.name()).to(eq('CAT'))
  end

  describe('#questions') do
    it('tells which questions belong to a certian survey') do
      test_survey = Survey.create({:name => 'Cats'})
      test_question = Question.create({:description => 'Which cat are you?', :survey_id => test_survey.id})
      expect(test_survey.questions()).to(eq([test_question]))
    end
  end
end
