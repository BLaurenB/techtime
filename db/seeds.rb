require 'csv'

users_csv = File.read(Rails.root.join('data', 'users.csv'))
CSV.parse(users_csv, headers: true, header_converters: :symbol).each do |row|
    u = User.new
    u.username = row[:username]
    u.password = row[:password]
    u.email = row[:email]
    u.full_name = row[:full_name]
    u.company = row[:company]
    u.address1 = row[:address1]
    u.address2 = row[:address2]
    u.city = row[:city]
    u.state = row[:state]
    u.zip = row[:zip]
    u.role = row[:role].to_i
    u.save
    puts "User #{u.username} saved"
end
puts "#{User.count} rows for users table."

categories_csv = File.read(Rails.root.join('data', 'categories.csv'))
CSV.parse(categories_csv, headers: true, header_converters: :symbol).each do |row|
    c = Category.new
    c.title = row[:title]
    c.save
    puts "Category #{c.title} saved"
end

puts "#{Category.count} rows for categories table."

freelancers_csv = File.read(Rails.root.join('data', 'freelancers.csv'))
CSV.parse(freelancers_csv, headers: true, header_converters: :symbol).each do |row|
    f = Freelancer.new
    f.name = row[:name]
    f.description = row[:description]
    f.price = row[:price].to_i
    f.image = row[:image]
    f.category_id = row[:category_id].to_i
    f.status = row[:status].to_i
    f.save
    puts "Freelancer #{f.name} saved"
end

puts "#{Freelancer.count} rows for freelancers table."


orders_csv = File.read(Rails.root.join('data', 'orders.csv'))
CSV.parse(orders_csv, headers: true, header_converters: :symbol).each do |row|
    o = Order.new
    o.status = row[:status].to_i
    o.user_id = row[:user_id].to_i
    o.save
    puts "Order #{o.id} saved"
end

puts "#{Order.count} rows for orders table."

order_freelancers_csv = File.read(Rails.root.join('data', 'order_freelancers.csv'))
CSV.parse(order_freelancers_csv, headers: true, header_converters: :symbol).each do |row|
    of = OrderFreelancer.new
    of.freelancer_id = row[:freelancer_id].to_i
    of.order_id = row[:order_id].to_i
    of.save
    puts "OrderFreelancer #{of.id} saved"
end

puts "#{OrderFreelancer.count} rows for order_freelancers table."
