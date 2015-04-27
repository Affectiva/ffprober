module Ffprober
  module Ffmpeg
    class VersionValidator
      MIN_VERSION = Gem::Version.new("0.9.0")
      MAX_VERSION = Gem::Version.new("2.6.2")

      def initialize(ffmpeg_version)
        @ffmpeg_version = ffmpeg_version
      end

      def valid?
        ffmpeg_version.nightly? || version_requirement_statisfied?
      end

      private

      attr_reader :ffmpeg_version

      def version_requirement_statisfied?
        version = ffmpeg_version.version
        (MIN_VERSION <= version && version <= MAX_VERSION)
      end
    end
  end
end