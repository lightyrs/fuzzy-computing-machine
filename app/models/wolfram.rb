require 'wolfram-alpha'

class Wolfram

  attr_accessor :query

  def initialize(options = {})
    @query = options[:query]
  end

  def raw_response
    @raw ||= client.query(query)
  end

  def pods
    @pods ||= raw_response.pods
  end

  def interpretation
    interpretation_pod.scanner rescue nil
  end

  def synopsis
    basic_info_text || interpretation_text rescue nil
  end

  private

  def interpretation_text
    interpretation_pod.subpods[0].plaintext rescue nil
  end

  def basic_info_text
    basic_info_pod.subpods[0].plaintext rescue nil
  end

  def interpretation_pod
    pods.select { |pod| pod.title.match(/interpretation/i) }.pop
  end

  def basic_info_pod
    pods.select { |pod| pod.title.match(/basic info/i) }.pop
  end

  def client
    @client ||= WolframAlpha::Client.new(WOLFRAM_ALPHA_APP_ID)
  end
end
