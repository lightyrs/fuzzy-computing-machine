require 'duck_duck_go'

class Ddg

  attr_accessor :query

  def initialize(options = {})
    @query = options[:query]
  end

  def raw_response
    @raw ||= client.zeroclickinfo(query)
  end

  def abstract
    @abstract ||= raw_response.abstract rescue nil
  end

  def definition
    @definition ||= raw_response.definition rescue nil
  end

  private

  def client
    @client ||= DuckDuckGo.new
  end
end
