require "net/http"
require "nokogiri"

module Links
  class Api

    def self.code(url, proxy)
      res = Links::Api.get(url, proxy)
      (res.nil?)? -1 : res.code
    end

    def self.links(url)
      res = Links::Api.get(url, proxy)
      if res.nil?
        return []
      end
      doc = Nokogiri::HTML.parse(res.body)
      l = doc.css('a').map { |link| link['href'] }
      l
    end

    def self.robots(site, only_disallow=true)

      if (! site.start_with? 'http://') and (! site.start_with? 'https://')
        site = 'http://'+site
      end

      list = []
      begin
        res=Net::HTTP.get_response(URI(site+'/robots.txt'))
        if (res.code != "200")
          return []
        end

        res.body.split("\n").each do |line|
          if only_disallow
            if (line.start_with?('Disallow'))
              list << line.split(":")[1].strip.chomp
            end
          else
            if (line.start_with?('Allow') or line.start_with?('Disallow'))
              list << line.split(":")[1].strip.chomp
            end
          end
        end
      rescue
        return []
      end
      
      list
    end

    def self.follow(url, proxy)
      l = Links::Api.links(url)
      l[0]
    end

    def self.human(code)
      case code.to_i
      when 200
        return "Open"
      when 301
        return "Moved"
      when 404
        return "Non existent"
      when 401
        return "Closed"
      when 403
        return "Forbidden"
      when -1
        return "No answer"
      else
        return "Broken"
      end
    end

    private

    def self.request(options)
      url    = options[:url]
      proxy  = options[:proxy]
      method = options[:method]

      begin
        uri = URI(url)
        if uri.scheme == 'http'
          Net::HTTP::Proxy(proxy[:host], proxy[:port]).start(uri.host) {|http|
            if (method == :get)
              res = http.get(uri.request_uri)
            else
              res = http.head(uri.request_uri)
            end
            return res
          }
          # res = Net::HTTP.get_response(URI(url))
        else
          request=Net::HTTP.new(uri.host, uri.port)
          request.use_ssl=true
          request.verify_mode = OpenSSL::SSL::VERIFY_NONE
          if (method == :get)
            res = request.get(uri.request_uri)
          else
            res = request.head(uri.request_uri)
          end

        end
        return res
      rescue
        return nil
      end

    end

    def self.get(url, proxy)
      return Links::Api.request({:url=>url, :proxy=>proxy, :method=>:get})
    end

  end
end
