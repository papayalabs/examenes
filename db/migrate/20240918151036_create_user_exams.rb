class CreateUserExams < ActiveRecord::Migration[7.0]
  def change
    create_table :user_exams do |t|
      t.references :user, foreign_key: true, type: :integer
      t.references :exam, foreign_key: true, type: :integer

      t.timestamps
    end
  end
end
