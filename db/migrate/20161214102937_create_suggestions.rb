class CreateSuggestions < ActiveRecord::Migration[5.0]
  def change
    create_table :suggestions do |t|
      t.references :user, foreign_key: true
      t.string :content
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
