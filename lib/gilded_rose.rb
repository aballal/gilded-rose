class GildedRose
  EXCEPTIONS = ["Aged Brie",
                "Backstage passes to a TAFKAL80ETC concert"]
  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      next if item.name == "Sulfuras, Hand of Ragnaros"

      if item.name == "Backstage passes to a TAFKAL80ETC concert"
        item.quality = [item.quality + 1, 50].min
        item.quality = [item.quality + 1, 50].min if item.sell_in < 11
        item.quality = [item.quality + 1, 50].min if item.sell_in < 6
        item.quality = 0 if item.sell_in <= 0
        next
      end

      change = EXCEPTIONS.include?(item.name) ? 1 : -1
      item.sell_in -= 1
      change *= 2 if item.sell_in < 0
      item.quality = [[item.quality + change, 0].max , 50].min
    end
  end
end
