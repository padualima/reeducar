namespace :dev do
  DEFAULT_PASSWORD = 123456
  desc "Settings environment of development"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Deleting DB ...") { %x(rails db:drop)}
      show_spinner("Creating DB ...") { %x(rails db:create)}
      show_spinner("Migrating DB ...") { %x(rails db:migrate)}
      show_spinner("Creating categories") { %x(rails dev:add_default_categories)}
      show_spinner("Creating user_default") { %x(rails dev:add_default_user)}
    end
  end

  desc "add default categories"
  task add_default_categories: :environment do
    categories = ["Lanches", "Doces", "Saladas", "Fast Food", "Brasileira", "Saudavel", "Chinesa", "Italiana", ]
    categories.each do |c|
      Category.create(
        description: c
      )
    end
  end
  desc "add default user"
  task add_default_user: :environment do
    User.create!(
      email: "user@admin.com",
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD,
      image: File.open('/Users/padualima/Desktop/lays/imagens/Profile/IMG_2553.jpg')
    )
  end
end

private

def show_spinner(msg_start, msg_end = "Completed!")
  spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
  spinner.auto_spin
  yield
  spinner.success("(#{msg_end})")
end
