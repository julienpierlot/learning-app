#! /usr/bin/env ruby

require 'nokogiri'
require 'open-uri'

# Fetch and parse HTML document
doc = Nokogiri::HTML(open('http://ebar.lequipe.fr/matches/Paris/'))

puts "### Search for nodes by css"
doc.css('nav ul.menu li a', 'article h2').each do |link|
  puts link.content
end

puts "### Search for nodes by xpath"
doc.xpath('//section//div//div/date', '//article//h2').each do |link|
  puts link.content
end

puts "### Or mix and match."
doc.search('nav ul.menu li a', '//article//h2').each do |link|
  puts link.content
end
