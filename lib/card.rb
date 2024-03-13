class Card
  def initilize
    @suite = suite
    @rank = rank
  end

  def identity(suite, rank)
    "#{suite} of #{rank}"
  end
end
