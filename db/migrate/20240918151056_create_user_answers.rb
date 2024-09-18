class CreateUserAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :user_answers do |t|
      t.references :user, foreign_key: true, type: :integer
      t.references :answer, foreign_key: true, type: :integer
      t.string :value

      t.timestamps
    end
  end
end
