#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'trac4r'

class Tanpopot::TracHelper
  def self.inherited(sub)
    sub.class_eval do
      include Cinch::Plugin
      listen_to :privmsg

      def listen(m)
        @msg = m
        msg = m.message
        if msg =~ regexp
          text = $1
          m.reply ticket_url + text
          begin
            ticket = trac.tickets.get(text.to_i)
            m.reply ticket.summary
          rescue Trac::TracException => e
            debug e.message
            m.reply "error"
          end
        end
      end
    end
  end

  def regexp
    /^#([0-9]*)/
  end

  def trac
    @trac ||= Trac.new(trac_url, trac_user, trac_password)
  end

  def ticket_url
    raise NotImplementedError
  end

  def trac_url
    raise NotImplementedError
  end

  def trac_user
    raise NotImplementedError
  end

  def trac_password
    raise NotImplementedError
  end
end
