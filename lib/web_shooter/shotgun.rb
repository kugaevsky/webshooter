require 'capybara'
require 'capybara-webkit'
require 'base64'

module WebShooter
  class Shotgun

    attr_reader :url, :driver, :file_name, :size, :format
    attr_accessor :data

    def initialize(url, format = :jpg, width = 1280, height = 100)
      @url    = "http://" + url
      @format = format.to_s
      @size   = { width: width,
                  height: height }
      @file_name = UI.public_folder + "/#{url.gsub(/http\:\/\//,'').downcase}_#{@size.values.join('x')}.#{@format}"
    end

    def save_screenshot
      @driver ||= ::Capybara::Webkit::Driver.new('http://google.com')
      @driver.visit url
      @driver.save_screenshot file_name, size
    end

    def read
      @data ||= File.read file_name
    end

    def shoot
      save_screenshot
      read
    end

    def to_base64
      Base64.encode64(read)
    end
  end
end
