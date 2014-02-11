require 'thor'
require 'rake'
require 'pah/version'

module Pah

  class CLI < Thor

    desc "new APP_NAME", "Create a new app using pah"
    def new(app_name)
      exec "rails _#{::Pah::RAILS_VERSION}_ new #{app_name} -T -m #{template_location}"
    end

    desc "install", "Install pah in a existing app"
    def install
      system "rake rails:template LOCATION=#{template_location}"
    end

    private

      def template_location
        File.expand_path(File.join('..', 'pah', 'template.rb'), File.dirname(__FILE__))
      end

  end

end
