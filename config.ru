require 'rubygems'

# dependencies
require 'bundler/setup'
require "cuba"
require 'data_mapper'
require 'slim'
require "cuba/render"
require 'yaml'

ENV['CUBA_ENV'] ||= 'dev'
print ENV['CUBA_ENV']

# app
require "./app"

#Bar.create name: "MonBar"
#Beer.create price: 3, bar_id: Bar.first.id

run Cuba
