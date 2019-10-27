# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Product.destroy_all
LineItem.destroy_all
Cart.destroy_all
Payment.destroy_all

PASSWORD = "supersecret"

admin_user = User.create(
  first_name: "Admin",
  last_name: "User",
  email: "admin.user@example.com",
  password: PASSWORD,
  is_admin: true
)

customer_user = User.create(
    first_name: "Customer",
    last_name: "User",
    email: "customer.user@example.com",
    password: PASSWORD,
    is_admin: false
)
