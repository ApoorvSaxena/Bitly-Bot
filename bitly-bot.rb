require 'rubygems'
require 'bundler'
require 'json'
require 'yaml'

Bundler.require

Daemons.run('application.rb', {:ontop => true, :app_name => 'Bitly-Bot'})