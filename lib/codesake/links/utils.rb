module Codesake

  module Links
    class Utils

      def self.print_str(str)
        logger.ok "#{str} (#{((stop-start) * 1000).round} msec)\n" if str == "Open"
        logger.err " #{str} (#{((stop-start) * 1000).round} msec)\n" if (str == "Closed" or str == "Non existent")
        logger.warn " #{str} (#{((stop-start) * 1000).round} msec)\n" if (str != "Closed" and str != "Non existent" and str != "Open")

        return
      end

      def self.print_code(str, code)
        logger.ok "#{code} (#{((stop-start) * 1000).round} msec)\n" if str == "Open"
        logger.err " #{code} (#{((stop-start) * 1000).round} msec)\n" if (str == "Closed" or str == "Non existent")
        logger.warn " #{code} (#{((stop-start) * 1000).round} msec)\n" if (str != "Closed" and str != "Non existent" and str != "Open")

        return
      end


    end
  end
end

