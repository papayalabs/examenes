class CreateUserExams < ActiveRecord::Migration[7.0]
  def change
    create_table :user_exams do |t|
      t.references :user, index: true
      t.references :exam, index: true

      t.timestamps
    end
  end
end
