module TimecopConsole
  class Version
    MAJOR = 0 unless defined? MAJOR
    MINOR = 1 unless defined? MINOR
    PATCH = 0 unless defined? PATCH

    class << self

      # @return [String]
      def to_s
        [MAJOR, MINOR, PATCH].compact.join('.')
      end

    end

  end
end
