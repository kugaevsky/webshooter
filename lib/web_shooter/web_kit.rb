require 'capybara'
require 'capybara-webkit'

module WebShooter
  class WebKit
    def self.driver
      @driver ||= ::Capybara::Webkit::Driver.new('http://google.com')
    end
  end
end
