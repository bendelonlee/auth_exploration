class CreateSecrets < ActiveRecord::Migration[5.1]
  def change
    create_table :secrets do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
