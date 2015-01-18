class Relationship < ActiveRecord::Base
  
  belongs_to :member, :class_name => 'User'
  belongs_to :farmer, :class_name => 'User'
  
  validates_presence_of :member_id
  validates_presence_of :farmer_id
  
end
