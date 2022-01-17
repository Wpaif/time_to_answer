# rubocop:disable Metrics/BlockLength
DEFAULT_PASSWORD = 123_456
DEFAULT_FILES_PATH = File.join(Rails.root, 'lib', 'tmp')

namespace :dev do
  desc 'Configura o ambiente de desenvolvimento'
  task setup: :environment do
    if Rails.env.development?
      show_spinner('Droping BD...') { `rails db:drop` }
      show_spinner('Creating BD...') { `rails db:create` }
      show_spinner('Migrating BD...') { `rails db:migrate` }
      show_spinner('Registering default admin...') { `rails dev:add_default_admin` }
      show_spinner('Registering extra admins...') { `rails dev:add_extra_admins` }
      show_spinner('Registering default user...') { `rails dev:add_default_user` }
      show_spinner('Registering default subjects...') { `rails dev:add_default_subjects` }
    else
      puts 'You not be in development environmet!'
    end
  end

  desc 'Adding default admin'
  task add_default_admin: :environment do
    Admin.create!(
      email: 'admin@admin.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc 'Adding extras administrators'
  task add_extra_admins: :environment do
    10.times do
      Admin.create!(
        email: Faker::Internet.email,
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD
      )
    end
  end

  desc 'Adding default user'
  task add_default_user: :environment do
    User.create!(
      email: 'user@user.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc 'Adding default subjects'
  task add_default_subjects: :environment do
    file_name = 'subjects.txt'
    file_path = File.join(DEFAULT_FILES_PATH, file_name)

    File.open(file_path, 'r').each do |line|
      Subject.create!(description: line.strip)
    end
  end

  private

  def show_spinner(msg_start, msg_end = 'Done!')
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
# rubocop:enable Metrics/BlockLength
