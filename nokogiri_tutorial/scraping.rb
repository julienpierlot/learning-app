class Player

  attr_accessor :name, :picture, :country, :date, :position

  def initialize(name, picture, country, date, position)
    @name = name
    @picture = picture
    @country = country
    @date = date
    @position = position
  end

end

require 'open-uri'
require 'nokogiri'

class Scrapper

  def initialize(url)
    @url = url
  end


  def render_list

    players = []

    html = open(@url)
    doc = Nokogiri::HTML(html)


    position = nil

    doc.css('.data .standard_tabelle tr').each do |player|

      if !player.xpath('th/b').text.empty?
        position = player.xpath('th/b').text
        next
      end

      name = player.xpath('td[3]/a').text.gsub(/\s+/, " ")
      next if name.empty?

      picture = player.xpath('td[1]/a/img/@src').first.value rescue nil
      country = player.xpath('td[5]').text.gsub(/\s+/, "")
      date = player.xpath('td[6]').text.gsub(/\s+/, "")
      _player = Player.new(name, picture, country, date, position)
      players.push(_player)
      end

      players

  end

end

class Team

  def initialize(name)
    @name = name
    @players_list = []
  end

  def buy_player(player)
    @players_list = Scrapper.new('https://www.worldfootball.net/teams/arsenal-fc/2004/2/')
    puts @players_list.render_list.push(player)
  end

  def sell_player(player)
    render_list.pop(player)
  end

  def squad

  end
end

scrapper1 = Scrapper.new('https://www.worldfootball.net/teams/arsenal-fc/2004/2/')
scrapper2 = Scrapper.new('https://www.worldfootball.net/teams/arsenal-fc/2019/2/')

team = Team.new("Arsenal 2004")

player1 = Player.new("Julien Pierlot", "www.someurl.com", "France", "01/08/1990", "Midfielder")

team.buy_player(player1)
