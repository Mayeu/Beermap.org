require 'rubygems'

# dependencies
require 'bundler/setup'
require "cuba"
require 'data_mapper'
require 'slim'

# app
require "./app"
Dir["./models/*.rb"].each {|file| require file }

# Database
DataMapper.setup(:default, 'mysql://root@localhost/beermap_development')
DataMapper.finalize
DataMapper.auto_upgrade!

Bar.create name: "MonBar"
Beer.create price: 3, bar_id: Bar.first.id

# Rendering
require "cuba/render"
Cuba.plugin Cuba::Render

run Cuba
