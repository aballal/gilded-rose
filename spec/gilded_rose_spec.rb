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
  let(:brie_q) { Item.new(name="Aged Brie", sell_in=2, quality=50) }

  let(:elixir) { Item.new(name="Elixir of the Mongoose", sell_in=5, quality=7) }

  let(:sulfuras) { Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80) }

  let(:passes) { Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=0, quality=20) }
  let(:passes2) { Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=20) }
  let(:passes2_q) { Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=48) }
  let(:passes3) { Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=20) }
  let(:passes3_q) { Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=49) }
  let(:passes4) { Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20) }
  let(:passes4_q) { Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=50) }

  let(:items) { [vest, brie, brie_q, elixir, sulfuras, passes, passes2, passes2_q,
    passes3, passes3_q, passes4, passes4_q] }

  subject(:gilded_rose) { described_class.new(items) }

  describe '#update_quality' do
    before do
      gilded_rose.update_quality
    end

    context 'item is Aged Brie' do
      it 'increases the quality by 1' do
        expect(brie.quality).to eq 1
      end

      it 'does not increase the quality beyond 50' do
        expect(brie_q.quality).to eq 50
      end
    end

    context 'item is Backstage passes to a TAFKAL80ETC concert' do
      context 'after the concert' do
        it 'drops the quality to 0' do
          expect(passes.quality).to eq 0
        end
      end

      context '1-5 days to the concert' do
        it 'increases the quality by 3' do
          expect(passes2.quality).to eq 23
        end

        it 'does not increase the quality beyond 50' do
          expect(passes2_q.quality).to eq 50
        end
      end

      context '6-10 days to the concert' do
        it 'increases the quality by 2' do
          expect(passes3.quality).to eq 22
        end

        it 'does not increase the quality beyond 50' do
          expect(passes3_q.quality).to eq 50
        end
      end

      context 'more than 10 days to the concert' do
        it 'increases the quality by 1' do
          expect(passes4.quality).to eq 21
        end

        it 'does not increase the quality beyond 50' do
          expect(passes4_q.quality).to eq 50
        end
      end
    end
  end
end
