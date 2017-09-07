class GildedRose
  EXCEPTIONS = ["Aged Brie",
                "Backstage passes to a TAFKAL80ETC concert"]
  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      next if item.name == "Sulfuras, Hand of Ragnaros"

      change = EXCEPTIONS.include?(item.name) ? 1 : -1
      item.quality = [[item.quality + change, 0].max , 50].min

      if item.name == "Backstage passes to a TAFKAL80ETC concert"
        item.quality = [item.quality + 1, 50].min if item.sell_in < 11
        item.quality = [item.quality + 1, 50].min if item.sell_in < 6
      end

      item.sell_in = item.sell_in - 1

      if item.sell_in < 0
        if EXCEPTIONS.include?(item.name)
          item.quality = 0 if item.name == "Backstage passes to a TAFKAL80ETC concert"
          item.quality = [item.quality + 1, 50].min if item.name == "Aged Brie"
        else
          item.quality = [item.quality - 1, 0].max
        end
      end
    end
  end
end
