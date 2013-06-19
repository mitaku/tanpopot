class Tanpopot::Bot
  attr_reader :bot

  def initialize(server, channels: [], nickname: "tanpopot", plugins: [])
    @bot = Cinch::Bot.new do
      configure do |c|
        c.server = server
        c.channels = channels
        c.nick = nickname
        c.plugins.plugins = plugins
      end
    end
  end

  def start
    bot.start
  end
end
