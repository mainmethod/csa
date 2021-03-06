class Message < ActiveRecord::Base
  
  belongs_to :sender, :class_name => 'User', :foreign_key => :sender_id
  belongs_to :recipient, :class_name => 'User', :foreign_key => :recipient_id
  belongs_to :parent, :class_name => 'Message', :foreign_key => :parent_id
  has_many   :children, :class_name => 'Message', :foreign_key => :parent_id
  
  scope :unread, -> { where(:read => false) }
  
  def read?
    read
  end
  
  def mark_as_read
    update_attribute(:read, true) if !read
  end
end
