class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :sender, index: true
      t.references :recipient, index: true
      t.references :parent, index: true
      t.string :subject
      t.text :content
      t.boolean :read, :default => false

      t.timestamps
    end
  end
end
