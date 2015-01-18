class User < ActiveRecord::Base
  authenticates_with_sorcery!
  
  belongs_to :organization
  has_many :relationships, :foreign_key => :farmer_id, :class_name => 'Relationship', :dependent => :destroy
  has_many :reverse_relationships, :foreign_key => :member_id, :class_name => 'Relationship', :dependent => :destroy
  
  validates :password, length: { minimum: 6 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true
end
