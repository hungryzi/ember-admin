class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.text :bio
      t.integer :age
      t.date :dob
      t.boolean :gender

      t.timestamps
    end
  end
end
