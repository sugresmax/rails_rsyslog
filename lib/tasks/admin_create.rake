namespace :admin do
  desc 'Create default admin'
  task create: :environment do
    exit if User.last.present?

    password = ENV['ADMIN_PASSWORD'] || SecureRandom.urlsafe_base64(8, false)
    name = ENV['ADMIN_NAME'] || 'admin'
    user = User.create name: name, password: password, password_confirmation: password

    if user.errors.any?
      user.errors.full_messages.each do |error|
        puts error
      end
    else
      puts "User #{name} created with password: #{password}"
    end
  end
end
