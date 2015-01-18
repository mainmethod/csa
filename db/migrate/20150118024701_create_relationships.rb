class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.references :farmer, index: true
      t.references :member, index: true

      t.timestamps
    end
  end
end
