desc "Fill the database tables with some sample data"
task({ :sample_user_data => :environment }) do
  10.times do
    x = User.new
    x.first_name = [
    "William",
    "Barrack",
    "Gregory",
    "Carrie",
    "Charlotte",
    "Miranda",
    "Samantha",
    "Leonard",
    "Howard",
    "Rajesh",
    "Sheldon",
    ].sample
    x.username = x.first_name.downcase
    x.email = x.first_name.downcase + "@example.com"
    x.password = "password"
    x.save
  end
end
