class CreateOptions < ActiveRecord::Migration
  def change
    create_table(:options) do |t|
      t.column(:answer, :varchar)
      t.column(:question_id, :int)

      t.timestamps()
    end
  end
end
