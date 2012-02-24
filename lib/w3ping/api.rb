require "net/http"
require "nokogiri"

module W3ping
  class Api

    def self.code(url)
      res = W3ping::Api.get(url)
      res.code
    end

    def self.follow(url)
      res = W3ping::Api.get(url)
      doc = Nokogiri::HTML.parse(res.body)
      l = doc.css('a').map { |link| link['href'] }
      if l.count > 1 
        return "500"
      end
      puts "following url to #{l[0]} from #{url}"
      self.code(l[0])
    end

    def self.human(url)
      case self.code(url).to_i
      when 200
        return "Open"
      when 301
        return "Moved"
      when 404
        return "Non existent"
      when 401
        return "Closed"
      else
        return "Broken"
      end
    end

    private
    def self.get(url)
      Net::HTTP.get_response(URI(url))
    end

  end
end
