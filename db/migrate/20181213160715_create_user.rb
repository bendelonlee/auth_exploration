class CreateUser < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.name :string
      t.email :string
      t.password :string
    end
  end
end
