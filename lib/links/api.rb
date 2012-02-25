require "net/http"
require "nokogiri"

module Links
  class Api

    def self.code(url)
      res = Links::Api.get(url)
      res.code
    end

    def self.links(url)
      res = Links::Api.get(url)
      doc = Nokogiri::HTML.parse(res.body)
      l = doc.css('a').map { |link| link['href'] }
      l
    end

    def self.follow(url)
      l = Links::Api.links(url)
      l[0]
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
