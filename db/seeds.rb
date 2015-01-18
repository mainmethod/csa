organization = Organization.create do |o|
  o.name = "Future Farm"
  o.bio = "We are the farm of the future.  Please join us and purchase one of our CSAs now!"
end

farmer = Farmer.create do |f|
  f.username = 'future_farm_admin'
  f.email = 'admin@futurefarm.com'
  f.password = 'futurefarm'
  f.password_confirmation = 'futurefarm'
  f.bio = "I am the creator and admin of Future Farm"
  f.organization = organization
end

member = Member.create do |m|
  m.username = 'just_a_member'
  m.email = 'just@member.com'
  m.password = 'justamember'
  m.password_confirmation = 'justamember'
  m.bio = "I am member who likes vegetables and things"
end

member.follow!(farmer)

message1 = Message.create do |m|
  m.sender = member
  m.recipient = farmer
  m.subject = "Thanks for the box"
  m.content = "The vegetables were amazing.  I'll be purchasing another soon"
  m.read = true
end

message2 = Message.create do |m|
  m.sender = farmer
  m.recipient = member
  m.subject = "Re: Thanks for the box"
  m.content = "Youre quite welcome!"
  m.parent = message1
end
