class GildedRose
  EXCEPTIONS = ["Aged Brie",
                "Backstage passes to a TAFKAL80ETC concert",
                "Sulfuras, Hand of Ragnaros"]
  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      unless EXCEPTIONS.include?(item.name)
        item.quality = [item.quality - 1, 0].max
      else
        item.quality = [item.quality + 1, 50].min unless item.name == "Sulfuras, Hand of Ragnaros"
        if item.name == "Backstage passes to a TAFKAL80ETC concert"
          item.quality = [item.quality + 1, 50].min if item.sell_in < 11
          item.quality = [item.quality + 1, 50].min if item.sell_in < 6
        end
      end
      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in = item.sell_in - 1
      end
      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > 0
              if item.name != "Sulfuras, Hand of Ragnaros"
                item.quality = item.quality - 1
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
      end
    end
  end
end
