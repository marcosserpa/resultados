class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.references :user, index: true, foreign_key: true
      t.string :url
      t.string :page
      t.datetime :date_time

      t.timestamps null: false
    end
  end
end
