#!/usr/bin/env ruby


require 'net/http'

uri = URI('http://example.com/')
p Net::HTTP.get(uri)
p Net::HTTP.get_response(uri)




