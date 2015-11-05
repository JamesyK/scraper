require 'nokogiri'
require 'byebug'
require 'open-uri'
require 'colorize'
require_relative 'post'
require_relative 'comment'
require_relative 'exception'

class Scraper

  def main(url)
    begin
      if url[0] =~ /\bhttps\:\/\/news\.ycombinator\.com\/item\?id\=\d+/
        html = open(url[0])
        page = Nokogiri::HTML(html.read)
        'encoding: UTF-8'
        @post = Post.new(page)

        scraper_puts
      else
        raise InvalidUrlError, "Please enter a valid Hacker News post URL"
      end
    rescue InvalidUrlError => e
      puts e.message
      puts
    end
  end

  def scraper_puts
    begin
      puts
      puts "-Post title: #{@post.title.colorize(:green)}"
      puts "-Points: #{@post.only_digit_points.colorize(:light_blue)}"
      puts "-By: #{@post.user.colorize(:red)}"
      puts "-Comments: #{@post.total_comments.colorize(:light_black)}"
      puts
    rescue NoMethodError => e
      e.message
    end
  end
end

if $0 == __FILE__
  Scraper.new.main(ARGV)
end