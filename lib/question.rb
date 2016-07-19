class Question < ActiveRecord::Base
  belongs_to(:survey)
  validates(:description, :presence => true)

  scope(:not_done, -> do
    where({:done => false})
  end)
end
