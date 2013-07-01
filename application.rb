require 'rest_client'
require 'json'
require 'yaml'

class Bitly

  def initialize()
    filename = 'config.yml'
    config = YAML.load_file filename
    @access_token = config['development']['access_token']
  end

  def get_url(phrase)
    @base_url = "https://api-ssl.bitly.com/v3/realtime/#{phrase}_phrases?access_token=#{@access_token}"
  end

  #Get the JSON Response
  def get_topics(phrase_types)
    threads = []
    phrase_types.each do |phrase_type|
      base_url = get_url phrase_type
      threads << Thread.new(base_url, phrase_type) do |url, phrase_type|
        begin
          response = JSON.parse RestClient.get url
          display response,phrase_type
        rescue
          display_error_message
        end
        puts "\n\n"
      end
    end
    threads.each { |aThread|  aThread.join }
  end

  def display(response,phrase_type)
    puts "\033[1;33;40m#{phrase_type.capitalize} Topics\033[0m"
    response['data']['phrases'].each do |data|
      puts colorize_text(data['phrase']) + " " + colorize_link("http://bit.ly/" + data['ghashes'][0]['ghash'])
    end
  end

  def display_error_message
   puts "\033[1;31mUnable to connect to the Server\033[0m\n"
   exit
  end

  def colorize_text(text)
    "\033[1;32;40m#{text}\033[0m"
  end

  def colorize_link(link)
    "\033[4;31;48m#{link}\033[0m"
  end
end 

Bitly.new.get_topics ['bursting', 'hot']
