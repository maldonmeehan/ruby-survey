class Question < ActiveRecord::Base
  belongs_to(:survey)
  has_many(:options)
  validates(:description, :presence => true)

  scope(:not_done, -> do
    where({:done => false})
  end)
end
