class Settings < Cuba
  def initialize
    # Get the yaml env file
    yaml = YAML.load( File.open(File.expand_path("env.yml", File.dirname(__FILE__))))

    # Set the settings in Cuba
    Cuba.settings[:env] = yaml[ENV['CUBA_ENV']]
 end
end
