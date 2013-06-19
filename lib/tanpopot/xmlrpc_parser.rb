#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'xmlrpc/client'

class Tanpopot::XMLRPCParser < XMLRPC::XMLParser::AbstractStreamParser
  RESPONSE_ENCODING = 'UTF-8'

  def initialize
    require "rexml/document"
    @parser_class = StreamListener
  end

  class StreamListener
    include XMLRPC::XMLParser::StreamParserMixin

    alias :tag_start :startElement
    alias :tag_end :endElement
    alias :text :character
    alias :cdata :character

    def method_missing(*a)
      # ignore
    end

    def parse(str)
      if str =~ /^<\?xml(.+)\?>(.+)$/m then
        decl = $1
        content = $2

        if decl !~ /encoding=['"].+['"]/ then
          str = %Q!<?xml #{decl} encoding="#{RESPONSE_ENCODING}"?>#{content}!
        end
      end

      parser = REXML::Document.parse_stream(str, self)
    end
  end
end
