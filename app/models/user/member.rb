class Member < User
  
  has_many :member_organizations, :dependent => :destroy
  has_many :organizations, :through => :member_organizations
  has_many :farmerships, :through => :reverse_relationships, :source => :farmer
    
  def following?(farmer)
    farmerships.exists?(farmer)
  end
  
  def follow!(farmer)
    farmerships << farmer unless following?(farmer)
  end
  
  def unfollow!(farmer)
    farmerships.delete(farmer)
  end
  
  def has_membership?(organization)
    organizations.exists?(organization)
  end
  
  def become_member!(organization)
    organizations << organization unless has_membership?(organization)
  end
  
  def leave!(organization)
    organizations.delete(organization)
  end
  
end