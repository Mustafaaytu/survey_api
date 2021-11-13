class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions, id: :uuid do |t|
      t.text :title
      t.integer :type, default: 0
      t.belongs_to :survey, type: :uuid

      t.timestamps
    end
  end
end
