class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :description
      t.string :type_of_question
      t.boolean :has_points
      t.integer :points
      t.references :exam, index: true

      t.timestamps
    end
  end
end
