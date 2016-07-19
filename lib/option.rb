class Option < ActiveRecord::Base
  belongs_to(:question)
  validates(:answer, :presence => true)

  scope(:not_done, -> do
    where({:done => false})
  end)
end
