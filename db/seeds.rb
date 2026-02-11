# Create default admin user
# IMPORTANT: Change the default password immediately after first login in production!
default_password = ENV.fetch("DEFAULT_USER_PASSWORD", "Admin@123")
User.find_or_create_by!(username: "user") do |user|
  user.password = default_password
  user.password_confirmation = default_password
  user.admin = true
  user.must_change_password = false
end

puts "Default admin user created: username=user"
