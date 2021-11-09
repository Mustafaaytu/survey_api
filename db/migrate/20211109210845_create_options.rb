class CreateOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :options, id: :uuid do |t|
      t.text :title
      t.belongs_to :question, type: :uuid
      t.timestamps
    end
  end
end
