require 'mechanize'
module Codesake

  module Links

    # Public: it implements check described into SEARCH ENGINE DISCOVERY/RECONNAISSANCE (OWASP-IG-002)
    #  
    #  The idea underneath is to use a search engine like google as tool to
    #  discovery entrypoints, web applications or whatever about the domain we
    #  want to test for.
    #
    #  Please bear in mind that you **must be authorized** from the system owner
    #  before doing any sort of security test.
    # 
    #  Be ethical.
    #
    # Usage
    #  google = Links::Api::Google.search('somedomain.org')
    #  google.results.each |res| do
    #     puts "Discovered #{res}"
    #  end
    module Google


      attr_reader :results

      def self.search(domain) do

        a = Mechanize.new { |agent|
          agent.user_agent_alias = 'Mac Safari'
        }

        a.get('http://google.com/') do |page|
          search_result = page.form_with(:name => 'f') do |search|
            search.q = 'Hello world'
          end.submit

          search_result.links.each do |link|
            puts link.text
          end
        end
        return [] 
      end
      end
    end
  end
end
