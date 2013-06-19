require 'tanpopot'

class TracSample < Tanpopot::TracHelper

  def ticket_url
    "http://example.com/trac/ticket"
  end

  def trac_url
    "http://example.com/trac/xmlrpc"
  end

  def trac_user
    "user_name"
  end

  def trac_password
    "user_password"
  end
end

Tanpopot.start("127.0.0.1", channels: ["#test_tanpopo"], nickname: "tanpopot", plugins: [TracSample])
