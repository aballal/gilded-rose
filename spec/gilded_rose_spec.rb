require 'gilded_rose'
require 'item'

describe GildedRose do
  # Post refactoring replace real instances with doubles
  # Also change expectations to see Item's method has been invoked rather than checking for Item's attribute

  # let(:vest) { double(:item, :name => '+5 Dexterity Vest', :sell_in => 10, :quality => 20) }
  # let(:brie) { double(:item, :name => 'Aged Brie', :sell_in => 2, :quality => 0) }
  # let(:elixir) { double(:item, :name => 'Elixir of the Mongoose', :sell_in => 5, :quality => 7) }
  # let(:sulfuras) { double(:item, :name => 'Sulfuras, Hand of Ragnaros', :sell_in => 0, :quality => 80) }
  # let(:passes) { double(:item, :name => 'Backstage passes to a TAFKAL80ETC concert', :sell_in => 15, :quality => 20) }

  let(:vest) { Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20) }
  let(:brie) { Item.new(name="Aged Brie", sell_in=2, quality=0) }
  let(:brie2) { Item.new(name="Aged Brie", sell_in=2, quality=50) }
  let(:elixir) { Item.new(name="Elixir of the Mongoose", sell_in=5, quality=7) }
  let(:sulfuras) { Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80) }
  let(:passes) { Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20) }

  let(:items) { [vest, brie, brie2, elixir, sulfuras, passes] }
  subject(:gilded_rose) { described_class.new(items) }

  describe '#update_quality' do
    context 'item is Aged Brie' do
      it 'increases the quality of aged brie' do
        gilded_rose.update_quality
        expect(brie.quality).to eq 1
      end

      it 'does not increase the quality of aged brie beyond 50' do
        gilded_rose.update_quality
        expect(brie2.quality).to eq 50
      end
    end
  end
end
