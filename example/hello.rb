require 'tanpopot'

class HelloWorld
  include Cinch::Plugin

  match /^hello$/, use_prefix: false
  def execute(m)
    m.reply "Hello World!"
  end
end

Tanpopot.require_plugins
Tanpopot.start("127.0.0.1", channels: ["#tanpopo"], nickname: "tanpopot", plugins: [HelloWorld])
