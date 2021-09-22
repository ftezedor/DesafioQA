require 'httparty'
require 'yaml'
require "capybara"
require "capybara/cucumber"
require "rspec"

Capybara.configure do |config|
   config.default_driver = :selenium_chrome
end

$config = YAML.load_file("features/config/env.yml")


def k2c(k, r)
    return (k - 273.15).round(r)
end

def handle(k, v)
    if k.start_with?("temp") || k.start_with?("feels")
        return [k, k2c(v, 2)]
    else
        return [k, v]
    end
end