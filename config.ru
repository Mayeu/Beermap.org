require 'rubygems'

# dependencies
require 'bundler/setup'
require "cuba"
require 'data_mapper'
require 'slim'
require "cuba/render"
require 'yaml'

# app
require "./app"

#Bar.create name: "MonBar"
#Beer.create price: 3, bar_id: Bar.first.id

ENV['CUBA_ENV'] ||= 'dev'

run Cuba
