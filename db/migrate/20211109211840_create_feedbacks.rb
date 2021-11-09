class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks, id: :uuid do |t|
      t.belongs_to :survey, type: :uuid
      t.timestamps
    end
  end
end
