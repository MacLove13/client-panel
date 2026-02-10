# Create default user
# IMPORTANT: Change the default password immediately after first login in production!
User.find_or_create_by!(username: "user") do |user|
  user.password = ENV.fetch("DEFAULT_USER_PASSWORD", "admin")
  user.password_confirmation = ENV.fetch("DEFAULT_USER_PASSWORD", "admin")
end

puts "Default user created: username=user"
