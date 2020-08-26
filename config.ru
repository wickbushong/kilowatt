require './config/environment'

if Option.all.empty?
  Scraper.call
end

use Rack::MethodOverride

use GroupsController
use DevicesController
use UsersController

run ApplicationController
