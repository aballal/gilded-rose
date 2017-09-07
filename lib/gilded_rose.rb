class GildedRose
  EXCEPTIONS = ["Aged Brie",
                "Backstage passes to a TAFKAL80ETC concert"]
  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      next if item.name == "Sulfuras, Hand of Ragnaros" # No change to sulfuras

      if item.name == "Backstage passes to a TAFKAL80ETC concert"
        item.quality = [item.quality + change_for_passes(item), 50].min
        next
      end

      item.sell_in -= 1

      change = EXCEPTIONS.include?(item.name) ? 1 : -1 # Exceptions increase with age, others decrease
      change *= 2 if item.sell_in < 0 # After the sell by date the change is twice as much
      item.quality = [[item.quality + change, 0].max , 50].min # Quantity is a minimum of 0 and maximum of 50
    end
  end

  private

  def change_for_passes(item)
    return -item.quality if item.sell_in <= 0
    return 3 if item.sell_in < 6
    return 2 if item.sell_in < 11
    1
  end
end
