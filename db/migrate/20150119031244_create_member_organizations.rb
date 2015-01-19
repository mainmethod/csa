class CreateMemberOrganizations < ActiveRecord::Migration
  def change
    create_table :member_organizations do |t|
      t.references :member, index: true
      t.references :organization, index: true

      t.timestamps
    end
  end
end
