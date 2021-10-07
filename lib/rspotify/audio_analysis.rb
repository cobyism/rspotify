module RSpotify
  class AudioAnalysis < Base

    # Retrieves AudioAnalysis object(s) for the track id provided
    #
    # @param id [String] A single track id.
    # @return [AudioAnalysis]
    #
    # @example
    #           audio_analysis = RSpotify::AudioAnalysis.find('1zHlj4dQ8ZAtrayhuDDmkY')
    def self.find(id)
      url = "audio-analysis/#{id}"
      response = RSpotify.get(url)
      return response if RSpotify.raw_response

      response['audio_analysis'].map { |i| i.nil? ? nil : AudioAnalysis.new(i) }
    end

    def initialize(options = {})
      @bars = options['bars']
      @beats = options['beats']
      @meta = options['meta']
      @sections = options['sections']
      @segments = options['segments']
      @tatums = options['tatums']
      @track = options['track']

      super(options)
    end
  end
end
