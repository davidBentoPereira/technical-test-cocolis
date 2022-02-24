ActiveRecord::Base.transaction do
  puts 'Start Transaction'
  Dir[Rails.root.join('db', 'seeds', '*.rb')].sort.each do |file|
    require file
  end
rescue StandardError => e
  puts '[ERROR] There was an error in your seed. Rollback database...'
  puts e.class
  puts e.message
end
