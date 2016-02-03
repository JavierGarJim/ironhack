class Link < ActiveRecord::Base
	validates :original, uniqueness: true

	def initialize(originalLink)
    	super

		self.original = originalLink[:original]
    	self.short = generate_code(3)
  	end

  	def self.get_valid_url(originalUrl)
    	str = "http://"

    	if originalUrl.index(str) != 0
			originalUrl = str + originalUrl
    	end

    	if originalUrl[originalUrl.length - 1] == '/'
			originalUrl[originalUrl.length - 1] = ''
    	end

		originalUrl
  	end

	def self.get_short(originalLink)
		Link.where(original: "#{originalLink}")[0][:short]
	end

	def self.get_original(shortLink)
		Link.where(short: "#{shortLink}")[0][:original]
	end

	def generate_code(length)
	  charset = Array('A'..'Z') + Array('a'..'z') + Array('0'..'9')
	  Array.new(length) { charset.sample }.join
	end
end
