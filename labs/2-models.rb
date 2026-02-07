# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Salesperson.destroy_all
# **************************

# Lab 2: Models
# - We've added data into the companies table.  Next, we'll add data
#   into the salespeople table.  Follow the steps below to insert and
#   read rows of salesperson data.  Update a row.  Afterwards, display
#   how many rows have been inserted into the salespeople table.
#   Lastly, if you want a challenge, try writing code to display the
#   full name of each salesperson.

# 1a. check out the schema file
# 1b. check out the model file

# 2. insert 1-2 rows in salespeople table.

new_salesperson1 = Salesperson.new

new_salesperson1["first_name"] = "Tom"
new_salesperson1["last_name"] = "Smith"
new_salesperson1["email"] = "tom@sales.com"
new_salesperson1.save

new_salesperson2 = Salesperson.new

new_salesperson2["first_name"] = "Jim"
new_salesperson2["last_name"] = "Scott"
new_salesperson2["email"] = "jim@sales.com"
new_salesperson2.save


# 3. write code to display how many salespeople rows are in the database
puts "Salespeople: #{Salesperson.all.count}"

# ---------------------------------
# Salespeople: 2

# 4. modify/update column data for a row in the salespeople table.
jim = Salesperson.find_by({ "first_name" => "Jim" })

jim["email"] = "jimscott@sales.com"
p jim
jim.save

# CHALLENGE:
# 5. write code to display each salesperson's full name

Salesperson.all.each do |salesperson|
  puts "#{salesperson["first_name"]} #{salesperson["last_name"]}"
end

# ---------------------------------
# Salespeople: 2
# Ben Block
# Brian Eng
