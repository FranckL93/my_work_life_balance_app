class CreateReminders < ActiveRecord::Migration[7.0]
  def change
    create_table :reminders do |t|
      t.string :name
      t.text :description
      t.date :date
      t.time :time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
