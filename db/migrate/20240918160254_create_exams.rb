class CreateExams < ActiveRecord::Migration[7.0]
  def change
    create_table :exams do |t|
      t.string :title
      t.string :description
      t.date :start
      t.date :end

      t.timestamps
    end
  end
end
