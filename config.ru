# This file is used by Rack-based servers to start the application.
#\ -p 3002
require ::File.expand_path('../config/environment', __FILE__)
run Rails.application
