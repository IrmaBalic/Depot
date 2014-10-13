class CreateLogins < ActiveRecord::Migration
  def change
    create_table :logins do |t|
      t.belongs_to :role, index: true
      t.string :name
      t.string :password

      t.timestamps null: false
    end
  end
end
