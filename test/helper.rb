ENV['CUBA_ENV'] = 'test'

# need to do something better about dependencies
require 'bundler/setup'
require "cuba"
require 'data_mapper'
require 'slim'
require "cuba/render"
require 'yaml'
require File.expand_path("../app", File.dirname(__FILE__))

prepare do
  DataMapper.auto_migrate! # wipes out existing data 
end