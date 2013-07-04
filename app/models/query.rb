class Query < ActiveRecord::Base

  validates :input, presence: true, uniqueness: true
  validates :synopsis, presence: true

  before_validation :write_synopsis!, if: Proc.new { |_| synopsis.nil? }, on: :create
  before_validation :write_interpretation!, if: Proc.new { |_| interpretation.nil? }, on: :create

  def as_json(options = {})
    {
      query: input,
      synopsis: synopsis,
      interpretation: interpretation
    }
  end

  def write_synopsis!
    self.synopsis = synopses.split(/\n\n/)[0] rescue synopses
  end

  def write_interpretation!
    self.interpretation = wolfram.interpretation
  end

  private

  def synopses
    @synopses ||= ( ddg.abstract || wolfram.synopsis || crunch.overview || ddg.definition )
  end

  def ddg
    Ddg.new(query: input)
  end

  def wolfram
    Wolfram.new(query: input)
  end

  def crunch
    Crunch.new(query: input)
  end
end
