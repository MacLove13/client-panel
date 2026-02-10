# Create default user
User.find_or_create_by!(username: "user") do |user|
  user.password = "admin"
  user.password_confirmation = "admin"
end

puts "Default user created: username=user, password=admin"
