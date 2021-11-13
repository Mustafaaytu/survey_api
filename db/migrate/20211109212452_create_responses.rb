class CreateResponses < ActiveRecord::Migration[6.1]
  def change
    create_table :responses, id: :uuid do |t|
      t.text :body
      t.belongs_to :question, type: :uuid
      t.belongs_to :option, type: :uuid
      t.belongs_to :feedback, type: :uuid
      t.timestamps
    end
  end
end
