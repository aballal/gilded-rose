class GildedRose
  EXCEPTIONS = { 'Aged Brie' => 1 } # Exceptions have a rate of change other than -1
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      next if item.name == "Sulfuras, Hand of Ragnaros" # No change to sulfuras
      item.sell_in -= 1

      if item.name == "Backstage passes to a TAFKAL80ETC concert"
        change = change_for_passes(item)
      else
        change = change_for_others(item)
      end
      item.quality = [[item.quality + change, 0].max, 50].min # ensures 0 <= quality <= 50
    end
  end

  private

  def change_for_passes(item)
    return -item.quality if item.sell_in < 0
    return 3 if item.sell_in < 5
    return 2 if item.sell_in < 10
    1
  end

  def change_for_others(item)
    change = EXCEPTIONS.keys.include?(item.name) ? EXCEPTIONS[item.name] : -1
    item.sell_in < 0 ? change * 2 : change # After the sell by date the change is twice as much
  end
end
