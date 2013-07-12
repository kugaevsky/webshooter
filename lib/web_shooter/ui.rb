require 'sinatra/base'

module WebShooter
  class UI < Sinatra::Base

    # @macro [attach] sinatra.set
    #   @overload set "$1", value
    # @method set_root
    # @param [String] path path to root directory
    # Set root app directory
    set :root, File.expand_path('../../../',__FILE__)

    # @method set_public
    # @param [String] path set directory for public folder
    # Set public folder for static files
    set :public_folder, "#{settings.root}/static"

    # @method set_sessions
    # @param [Boolean] sessions set sessions options
    # Turn off sessions
    set :sessions, false

    # @method set_logger
    # @param [Boolean] logging show log
    # Turn on logging and set log level to dedug for development environment
    set :logging, false

    configure :development do
      set :logging, true
    end

    get '/webshot/:url/?:width?/?:height?' do
      arr = params[:url].split('.')
      response_format, domain = arr.pop, arr.join('.')
      format = response_format == 'json' ? 'png' : response_format
      shotgun = Shotgun.new(domain, format, params[:width]||1280, params[:height]||100)
      file = shotgun.file_name
      data = if File.exists?(file)
        shotgun.read
      else
        shotgun.shoot
      end
      case response_format
      when 'json'
        content_type :json
        { image: shotgun.to_base64 }.to_json
      when 'jpg'
        redirect "/#{File.basename(file)}"
      when 'png'
        redirect "/#{File.basename(file)}"
      end
    end
  end
end
