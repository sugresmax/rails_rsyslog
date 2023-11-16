namespace :admin do
  desc 'Create default admin'
  task create: :environment do
    password = SecureRandom.urlsafe_base64(8, false)
    user = User.create name: 'admin', password: password

    if user.errors.any?
      user.errors.full_messages.each do |error|
        puts error
      end
    else
      puts "User admin created with password: #{password}"
    end
  end
end
