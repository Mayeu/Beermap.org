# Require the settings
require_relative './settings.rb'
Settings.new

# Cuba plugins
Cuba.plugin Cuba::Render

# Require all models
Dir["./models/*.rb"].each {|file| require file }

# Database initialization
DataMapper.setup(:default, Cuba.settings[:env]['sql_uri'])
DataMapper.finalize
DataMapper.auto_upgrade!

# Routes
Cuba.define do
  on get do
    on root do
      res.write render("views/index.slim", best_beer: Beer.cheaper)
    end
  end

  on post do
    on "bars", param('lat'), param('long') do |lat,long|
      bars = Bar.closer(lat, long)
      res.write bars.to_json
    end

    on "beers", param('bar'), param('beer') do |p_bar, p_beer|
      bar        = Bar.new(p_bar)
      bar.beers << Beer.new(p_beer) 
      bar.save
    end
  end
end
