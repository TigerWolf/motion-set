# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotionPre/lib")
require 'motion/project/template/ios'
# require 'motion/project/template/android'
require './lib/motion-set'

begin
  require 'bundler'
  require 'motion/project/template/gem/gem_tasks'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'motion-set'
end
