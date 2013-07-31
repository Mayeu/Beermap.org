require 'rubygems'

# dependencies
require 'bundler/setup'
require "cuba"
require 'data_mapper'
require 'slim'
require "cuba/render"
require 'yaml'

ENV['CUBA_ENV'] ||= 'dev'

# app
require "./app"

run Cuba
