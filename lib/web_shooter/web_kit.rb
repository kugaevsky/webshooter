require 'capybara'
require 'capybara/poltergeist'

module WebShooter
  class WebKit
    def self.driver
      @driver ||= ::Capybara::Poltergeist::Driver.new('http://google.com')
    end
  end
end
