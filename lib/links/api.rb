require "net/http"
require "nokogiri"

module Links
  class Api

    def self.code(url)
      res = Links::Api.get(url)
      res.code ||= -1
    end

    def self.links(url)
      res = Links::Api.get(url)
      if res.nil?
        return []
      end
      doc = Nokogiri::HTML.parse(res.body)
      l = doc.css('a').map { |link| link['href'] }
      l
    end

    def self.robots(site)

      if (! site.start_with? 'http://') and (! site.start_with? 'https://')
        site = 'http://'+site
      end

      begin
        res=Net::HTTP.get_response(URI(site+'/robots.txt'))
        res
      rescue
        return nil
      end
      
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
      begin
        Net::HTTP.get_response(URI(url))
      rescue
        return nil
      end
    end

  end
end
