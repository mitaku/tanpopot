#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'trac4r'
require 'tanpopot/xmlrpc_parser'

module Tanpopot
  module TracExt
    def initialize(url, user, pass)

      if user && pass
        url = url.sub('xmlrpc', 'login/xmlrpc')
      end

      uri = URI.parse(url)
      use_ssl = (uri.scheme == 'https') ? true : false
      @host = uri.host
      @path = uri.path
      @port = uri.port
      @connection = XMLRPC::Client.new(@host,
                                       @path,
                                       @port,
                                       nil,
                                       nil,
                                       user,
                                       pass,
                                       use_ssl,
                                       nil)
      @connection.set_parser(Tanpopot::XMLRPCParser.new)
    end

    def query(command, *args)
      begin
        return @connection.call(command, *args)
      rescue => e
        raise TracException.new(e.message, @host, @port, @path, command, args, e)
      end
    end
  end
end

Trac::Query.send :include, Tanpopot::TracExt
