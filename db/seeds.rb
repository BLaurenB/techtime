require 'csv'

users_csv = File.read(Rails.root.join('data', 'seeds', 'users.csv'))
CSV.parse(users_csv, headers: true, header_converters: :symbol).each do |row|
    u = User.new
    u.username = row[:username]
    u.password = row[:password]
    u.email = row[:email]
    u.company = row[:company]
    u.address1 = row[:address1]
    u.address2 = row[:address2]
    u.city = row[:city]
    u.state = row[:state]
    u.zip = row[:zip]
    u.save
    puts "User #{u.username} saved"
end
puts "There are now #{User.count} rows in the users table."

categories_csv = File.read(Rails.root.join('data', 'seeds', 'categories.csv'))
CSV.parse(categories_csv, headers: true, header_converters: :symbol).each do |row|
    c = Category.new
    c.title = row[:title]
    c.save
    puts "Category #{c.title} saved"
end

puts "There are now #{Category.count} rows in the categories table."

freelancers_csv = File.read(Rails.root.join('data', 'seeds', 'freelancers.csv'))
CSV.parse(freelancers_csv, headers: true, header_converters: :symbol).each do |row|
    f = Freelancer.new
    f.name = row[:name]
    f.description = row[:description]
    f.price = row[:price]
    f.image = row[:image]
    f.category_id = row[:category_id]
    f.status = row[:status]
    f.save
    puts "Freelancer #{f.name} saved"
end

puts "There are now #{Freelancer.count} rows in the freelancers table."


orders_csv = File.read(Rails.root.join('data', 'seeds', 'orders.csv'))
CSV.parse(orders_csv, headers: true, header_converters: :symbol).each do |row|
    o = Order.new
    o.status = row[:status]
    o.user_id = row[:user_id]
    o.save
    puts "Order #{o.id} saved"
end

puts "There are now #{Order.count} rows in the orders table."

order_freelancers_csv = File.read(Rails.root.join('data', 'seeds', 'orders_freelancers.csv'))
CSV.parse(order_freelancers_csv, headers: true, header_converters: :symbol).each do |row|
    of = OrderFreelancer.new
    of.freelancer_id = row[:freelancer_id]
    of.order_id = row[:order_id]
    of.save
    puts "OrderFreelancer #{of.id} saved"
end

puts "There are now #{Order.count} rows in the orders table."
