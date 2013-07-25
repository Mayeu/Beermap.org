# Require the settings
require_relative './settings.rb'

# Cuba plugins
Cuba.plugin Cuba::Render

# Require all models
Dir["./models/*.rb"].each {|file| require file }

# Database initialization
DataMapper.setup(:default, Settings::SQL_URI)
DataMapper.finalize
DataMapper.auto_upgrade!

# Routes
Cuba.define do
  on get do
    on root do
      res.write render("views/index.slim", best_beer: Beer.cheaper)
    end

    on "bars" do |params|
      bars = Bar.closer(params['lat'], params['long'])
      res.write bars.to_json
    end
  end

  on post do
    on "beers", param('bar'), param('beer') do |p_bar, p_beer|
      bar        = Bar.new(p_bar)
      bar.beers << Beer.new(p_beer) 
      bar.save
    end
  end
end
