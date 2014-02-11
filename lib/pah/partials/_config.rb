@config = {}

# heroku questions
def create_heroku_app
  say "Refreshing Heroku user credentials".magenta
  unless system "heroku auth:login"
    puts "Could not login to Heroku, halting"
    exit
  end

  created = false
  while not created
    @config[:heroku][:name] = ask "What do you want to call your Heroku app? (#{app_name.gsub('_','')})".red
    @config[:heroku][:name] = app_name.gsub('_','') if @config[:heroku][:name].blank?

    say "Creating Heroku app '#{@config[:heroku][:name]}.herokuapp.com'".magenta

    created = system "heroku create #{@config[:heroku][:name]}"

    unless created
      puts "Heroku '#{@config[:heroku][:name]}' app already exists or could not be created, please provide a new name"
    end
  end
end


@config[:heroku] = Hash.new
if (@config[:heroku][:create?] = will_you_like_to? "create Heroku apps?".red)
  @config[:heroku][:deploy?] = will_you_like_to? "deploy immediately?".red

  @config[:heroku][:domain] = ask "Add custom domain (customdomain.com) or leave blank:".red

  create_heroku_app

  @config[:heroku][:collaborators] = ask "Add collaborators? Type the email's separated by comma (,):".red
end
