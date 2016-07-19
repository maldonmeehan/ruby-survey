class Survey < ActiveRecord::Base
  has_many(:questions)
  validates(:name, :presence => true)
  before_save(:upcase_name)

  scope(:not_done, -> do
    where({:done => false})
  end)

private

  define_method(:upcase_name) do
    self.name=(name().upcase())
  end
end
