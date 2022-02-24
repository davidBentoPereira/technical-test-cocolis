##################### DATA #####################
USERS = [
  {
    email: 'admin@cocolis.com',
    password: 'azerty',
    password_confirmation: 'azerty',
    first_name: 'Coco',
    last_name: 'Colis',
    admin: true
  }
].freeze

################## RESET TABLE ##################
User.destroy_all

################## CREATE DATA ##################
progressbar = ProgressBar.create(
  title: 'Creating Users',
  total: USERS.count
)

USERS.each do |user|
  User.create!(
    email: user[:email],
    password: user[:password],
    password_confirmation: user[:password_confirmation],
    first_name: user[:first_name],
    last_name: user[:last_name],
    admin: user[:admin]
  )

  progressbar.increment
end
