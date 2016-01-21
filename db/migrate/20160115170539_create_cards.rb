class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :number
      t.string :cvv
      t.date :expiration_date

      t.timestamps
    end
  end
end
