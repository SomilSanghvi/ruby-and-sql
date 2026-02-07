# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Contact.destroy_all
# **************************

# - Insert and read contact data for companies in the database

# 1. insert new rows in the contacts table with relationship to a company
apple = Company.find_by({ "name" => "Apple" })

new_contact = Contact.new
p new_contact
new_contact["first_name"] = "Tim"
new_contact["last_name"] = "Cook"
new_contact["email"] = "tim@apple.com"
new_contact["company_id"] = apple["id"]
p new_contact
new_contact.save
p new_contact

new_contact = Contact.new
p new_contact
new_contact["first_name"] = "Craig"
new_contact["last_name"] = "Federighi"
new_contact["email"] = "craig@apple.com"
new_contact["company_id"] = apple["id"]
p new_contact
new_contact.save
p new_contact

amazon = Company.find_by({ "name" => "Amazon" })

new_contact = Contact.new
p new_contact
new_contact["first_name"] = "Jeff"
new_contact["last_name"] = "Bezos"
new_contact["email"] = "jeff@amazon.com"
new_contact["company_id"] = amazon["id"]
p new_contact
new_contact.save
p new_contact

# expected_count_of_contacts = 3
# if expected_count_of_contacts != Contact.all.count
#   raise "ALERT!"
# end


# 2. How many contacts work at Apple?
apple_contacts = Contact.where({ "company_id" => apple["id"] })
puts apple_contacts.count

# 3. What is the full name of each contact who works at Apple?

apple_contacts.each do |contact|
  puts "#{contact["first_name"]} #{contact["last_name"]}"
end
