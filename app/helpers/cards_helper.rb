module CardsHelper
  def item_completed?(item)
    if item.completed?
      @completed = true
    else
      @completed = false
    end
  end
end
