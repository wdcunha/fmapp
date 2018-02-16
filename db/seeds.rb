# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
PASSWORD = 'supersecret'

super_user = User.create(
  first_name: 'Jon',
  last_name: 'Snow',
  email: 'js@winterfell.gov',
  password: PASSWORD,
  is_admin: true
)

10.times.each do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
    password: PASSWORD
  )
end

users = User.all

puts Cowsay.say("Created #{users.count} users", :tux)
transactionTypes = TransactionType.all

# Transaction.destroy_all
# TransacCateg.destroy_all
# TransactionType.destroy_all
# PayeeCustomer.destroy_all
# PayeeCustomerType.destroy_all

20.times do
  Entity.create(
    name: Faker::Company.name,
    docNumber: Faker::Company.australian_business_number,
    address: Faker::Address.street_address,
    postaCode: Faker::Address.postcode,
    phone: Faker::PhoneNumber.cell_phone,
    email: Faker::Internet.email
  )
end

entities = Entity.all

puts Cowsay.say("Created #{entities.count} entities", :ghostbusters)


2.times do
  PayeeCustomerType.create(
    title: ["supplier", "customer"].sample,
    description: Faker::Company.catch_phrase
  )
end

payeeCustomerTypes = PayeeCustomerType.all

puts Cowsay.say("Created #{payeeCustomerTypes.count} payeeCustomerTypes", :ghostbusters)

10.times do
  PayeeCustomer.create(
    name: Faker::Company.name,
    address: Faker::Address.street_address,
    postaCode: Faker::Address.postcode,
    phone: Faker::PhoneNumber.cell_phone,
    email: Faker::Internet.email,
    payee_customer_type: PayeeCustomerType.all.sample
  )
end
payeeCustomers = PayeeCustomer.all

puts Cowsay.say("Created #{payeeCustomers.count} payeeCustomers", :ghostbusters)

TransactionType.create(
  description: "Expense"
)
TransactionType.create(
  description: "Income"
)

transactionType = TransactionType.all

puts Cowsay.say("Create #{transactionType.count} transactionType", :moose)

8.times do
  TransacCateg.create(
    title: Faker::Commerce.department(1, true),
    description: Faker::Company.catch_phrase,
    transaction_type: transactionTypes.sample
  )
end

transacCategs = TransacCateg.all

puts Cowsay.say("Created #{transacCategs.count} transacCategs", :ghostbusters)

20.times do
  Transaction.create(
    details: Faker::Commerce.material + ', ' + Faker::Commerce.product_name + ', ' + Faker::Science.element,
    date: Faker::Date.between(2.month.ago, Date.today),
    value: Faker::Commerce.price,
    transaction_type: transactionTypes.sample,
    entity: entities.sample,
    payee_customer: payeeCustomers.sample,
    transac_categ: transacCategs.sample
  )
end

transactions = Transaction.all

puts Cowsay.say("Created #{transactions.count} transactions", :ghostbusters)

# puts "Login as admin with #{super_user.email} and password of '#{PASSWORD}'!"
