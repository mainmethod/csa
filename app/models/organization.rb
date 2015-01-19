class Organization < ActiveRecord::Base
  
  has_many :member_organizations
  has_many :members, :through => :member_organizations
  has_many :farmers, :table_name => 'User'
  
end
