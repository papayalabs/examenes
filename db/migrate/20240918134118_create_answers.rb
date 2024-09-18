class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.string :description
      t.boolean :is_correct
      t.references :question, index: true

      t.timestamps
    end
  end
end
