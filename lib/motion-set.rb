# encoding: utf-8

unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

lib_dir_path = File.dirname(File.expand_path(__FILE__))
Motion::Project::App.setup do |app|
  #TODO: Find better way to do this
  # iOS
  if app.class == "Motion::Project::IOSConfig"
    app.files.unshift(Dir.glob(File.join(lib_dir_path, "project/**/*.rb")))
  # Android
  else
    Dir.glob(File.join(File.dirname(__FILE__), 'android/*.rb')).each do |file|
      app.files.unshift(file)
    end
  end

end
