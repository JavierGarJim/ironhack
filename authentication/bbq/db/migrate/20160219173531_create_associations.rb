class CreateAssociations < ActiveRecord::Migration
  def change
    create_table :associations do |t|
      t.references :user, index: true
      t.references :barbecue, index: true

      t.timestamps null: false
    end
    add_foreign_key :associations, :users
    add_foreign_key :associations, :barbecues
  end
end
