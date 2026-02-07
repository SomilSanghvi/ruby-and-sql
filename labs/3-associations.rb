# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Activity.destroy_all
# **************************

# Lab 3: Associations
# - We've added data into the contacts table.  Next, we'll add data
#   into the activities table.  Follow the steps below to insert
#   activity data in the database.  Afterwards, display a
#   single salesperson's activity data:

# 1. insert 3 rows in the activities table with relationships to
# a single salesperson and 2 different contacts

jim = Salesperson.find_by({ "first_name" => "Jim" })
tim = Contact.find_by({ "first_name" => "Tim" })

new_activity1 = Activity.new
new_activity1["note"] = "quick checkin over facetime"
new_activity1["salesperson_id"] = jim["id"]
new_activity1["contact_id"] = tim["id"]
new_activity1.save

new_activity2 = Activity.new
new_activity2["note"] = "met at Cupertino"
new_activity2["salesperson_id"] = jim["id"]
new_activity2["contact_id"] = tim["id"]
new_activity2.save

tom = Salesperson.find_by({ "first_name" => "Tom" })
craig = Contact.find_by({ "first_name" => "Craig" })

new_activity3 = Activity.new
new_activity3["note"] = "grabbed coffee"
new_activity3["salesperson_id"] = tom["id"]
new_activity3["contact_id"] = craig["id"]
new_activity3.save


# 2. Display all the activities between the salesperson used above
# and one of the contacts (sample output below):

activities = Activity.where({ "salesperson_id" => jim["id"], "contact_id" => tim["id"] })

puts "Activities between #{jim["first_name"]} and #{tim["first_name"]}:"
activities.each do |activity|
  puts "- #{activity["note"]}"
end

# ---------------------------------
# Activities between Ben and Tim Cook:
# - quick checkin over facetime
# - met at Cupertino

# CHALLENGE:
# 3. Similar to above, but display all of the activities for the salesperson
# across all contacts (sample output below):

jims_activities = Activity.where("salesperson_id" => jim["id"])

puts "#{jim["first_name"]}'s Activities:"
jims_activities.each do |activity|
  puts "- #{activity["note"]}"
end

# ---------------------------------
# Ben's Activities:
# Tim Cook - quick checkin over facetime
# Tim Cook - met at Cupertino
# Jeff Bezos - met at Blue Origin HQ

# 3a. Can you include the contact's company?

puts "#{jim["first_name"]}'s Activities:"
jims_activities.each do |activity|
  contact = Contact.find_by({ "id" => activity["contact_id"] })
  company = Company.find_by({ "id" => contact["company_id"] })
  puts "- #{contact["first_name"]} #{contact["last_name"]} (#{company["name"]}) - #{activity["note"]}"
end


# ---------------------------------
# Ben's Activities:
# Tim Cook (Apple) - quick checkin over facetime
# Tim Cook (Apple) - met at Cupertino
# Jeff Bezos (Amazon) - met at Blue Origin HQ

# CHALLENGE:
# 4. How many activities does each salesperson have?

# ---------------------------------
# Ben Block: 3 activities
# Brian Eng: 0 activities
