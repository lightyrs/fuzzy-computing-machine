require 'crunchbase'

class Crunch

  attr_accessor :query

  def initialize(options = {})
    @query = options[:query]
  end

  def overview
    company || person
  end

  private

  def company
    @c ||= Crunchbase::Company.find(query).overview rescue nil
  end

  def person
    @p ||= Crunchbase::Person.find(names[0], names[1]).overview rescue nil
  end

  def names
    query.split
  end
end
