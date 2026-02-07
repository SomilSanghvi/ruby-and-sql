# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Company.destroy_all
# **************************

# - Insert, read, update, and delete rows in companies table
#   (i.e. full CRUD of company data).

# 1a. check out the schema file
# 1b. check out the model file

# 2. insert new rows in companies table

new_company = Company.new
## puts new_company
## puts shows the record 

## p new_company
## p is similar to puts but expands it 

new_company["name"] = "Apple"
new_company["city"] = "Cupertino"
new_company["state"] = "CA"
new_company["url"] = "https://apple.com"
new_company.save
## p new_company will show you the record

puts "Companies: #{Company.all.count}"
## this will show you how many rows are in the table

new_company2 = Company.new
new_company2["name"] = "Amazon"
new_company2["city"] = "Seattle"
new_company2["state"] = "WA"
new_company2["url"] = "https://amazon.com"
new_company2.save

new_company3 = Company.new
new_company3["name"] = "Anthropic"
new_company3["city"] = "San Francisco"
new_company3["state"] = "CA"
new_company3["url"] = "https://anthropic.com"
new_company3.save

puts "Companies: #{Company.all.count}"
## tells you how many rows are in the table

# 3. query companies table to find all row with California company

# All rows in companies table
all_companies = Company.all
puts all_companies.inspect


# 4. query companies table to find single row for Apple
# apple = Company.where({ "name" => "Apple" })[0]
## this is more inefficient because it gives the array with 1 thing in it
apple = Company.find_by({ "name" => "Apple" })
## this is the better way to look for the single record

# All rows in companies table where state is "CA"
california_companies = Company.where({ "state" => "CA" })
puts california_companies.inspect
puts "companies in cali: #{california_companies.count}" # companies in cali: 2

# 5. read a row's column value
puts apple["url"]

# 6. update a row's column value
apple["url"] = "https://www.apple.com"
p apple
apple.save

# 7. delete a row
## apple.destroy
puts "companies in cali: #{california_companies.count}" # companies in cali: 2

expected_count_of_companies = 3
if expected_count_of_companies != Company.all.count
  raise "AHHH!!!"
end

## this ^ is how you test something worked