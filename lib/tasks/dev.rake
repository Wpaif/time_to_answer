# rubocop:disable Metrics/BlockLength
DEFAULT_PASSWORD = 123_456
namespace :dev do
  desc 'Configura o ambiente de desenvolvimento'
  task setup: :environment do
    if Rails.env.development?
      show_spinner('Droping BD...') { `rails db:drop` }
      show_spinner('Creating BD...') { `rails db:create` }
      show_spinner('Migrating BD...') { `rails db:migrate` }
      show_spinner('Registering default admin...') { `rails dev:add_default_admin` }
      show_spinner('Registering default user...') { `rails dev:add_default_user` }
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

  desc 'Adding default user'
  task add_default_user: :environment do
    User.create!(
      email: 'user@user.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
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
