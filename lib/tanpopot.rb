require "tanpopot/version"
require "cinch"
require "tanpopot/bot"
require "tanpopot/trac_ext"
require "tanpopot/trac_helper"

module Tanpopot
  class << self
    def start(*args, &block)
      bot = Tanpopot::Bot.new(*args)
      yield if block_given?
      bot.start
    end

    def daemon(*args)
      start(*args) do
        Process.daemon(nochdir = true)
        File.open("./tanpopot.pid", "w") do |pid|
          pid.write Process.pid
        end
      end
    end

    def require_plugins(blob = "./plugins/*.rb")
      Dir[blob].each { |file| require file }
    end
  end
end
