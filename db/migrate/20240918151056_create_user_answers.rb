class CreateUserAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :user_answers do |t|
      t.references :user, index: true
      t.references :answer, index: true

      t.timestamps
    end
  end
end
