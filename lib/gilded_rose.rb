class GildedRose
  EXCEPTIONS = ["Aged Brie",
                "Backstage passes to a TAFKAL80ETC concert",
                "Sulfuras, Hand of Ragnaros"]
  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if EXCEPTIONS.include?(item.name)
        item.quality = [item.quality + 1, 50].min unless item.name == "Sulfuras, Hand of Ragnaros"
        if item.name == "Backstage passes to a TAFKAL80ETC concert"
          item.quality = [item.quality + 1, 50].min if item.sell_in < 11
          item.quality = [item.quality + 1, 50].min if item.sell_in < 6
        end
      else
        item.quality = [item.quality - 1, 0].max
      end

      item.sell_in = item.sell_in - 1 if item.name != "Sulfuras, Hand of Ragnaros"

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
