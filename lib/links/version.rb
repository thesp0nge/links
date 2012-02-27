module Links
  module Version
    MAJOR = 0 
    MINOR = 40
    PATCH = 0
    BUILD = ''

    def self.version
      if BUILD.empty?
        return [MAJOR, MINOR, PATCH].compact.join('.')
      else
        return [MAJOR, MINOR, PATCH, BUILD].compact.join('.')
      end
    end
  end
end
