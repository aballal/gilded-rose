require 'gilded_rose'
require 'item'

describe GildedRose do
  let(:vest) { Item.new("+5 Dexterity Vest", 10, 20) }
  let(:vest_q) { Item.new("+5 Dexterity Vest", 10, 0) }

  let(:brie) { Item.new("Aged Brie", 2, 0) }
  let(:brie_q) { Item.new("Aged Brie", 2, 50) }
  let(:brie2) { Item.new("Aged Brie", 0, 0) }
  let(:brie2_q) { Item.new("Aged Brie", 0, 49) }

  let(:elixir) { Item.new("Elixir of the Mongoose", 0, 7) }
  let(:elixir_q) { Item.new("Elixir of the Mongoose", 0, 1) }

  let(:sulfuras) { Item.new("Sulfuras, Hand of Ragnaros", 1, 80) }

  let(:passes) { Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 20) }
  let(:passes2) { Item.new("Backstage passes to a TAFKAL80ETC concert", 1, 20) }
  let(:passes2_q) { Item.new("Backstage passes to a TAFKAL80ETC concert", 1, 48) }
  let(:passes3) { Item.new("Backstage passes to a TAFKAL80ETC concert", 6, 20) }
  let(:passes3_q) { Item.new("Backstage passes to a TAFKAL80ETC concert", 6, 49) }
  let(:passes4) { Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 20) }
  let(:passes4_q) { Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 50) }

  let(:conjured) { Item.new("Conjured Mana Cake", 10, 10) }
  let(:conjured_q) { Item.new("Conjured Mana Cake", 10, 1) }
  let(:conjured2) { Item.new("Conjured Mana Cake", 0, 10) }
  let(:conjured2_q) { Item.new("Conjured Mana Cake", 0, 3) }

  let(:items) {
    [
      vest, vest_q, brie, brie_q, brie2, brie2_q, elixir, elixir_q, sulfuras,
      passes, passes2, passes2_q, passes3, passes3_q, passes4, passes4_q,
      conjured, conjured_q, conjured2, conjured2_q
    ]
  }

  subject(:gilded_rose) { described_class.new(items) }

  describe '#update_quality' do
    before do
      gilded_rose.update_quality
    end

    describe 'updates sell_in' do
      context 'item is not sulfuras' do
        it 'decreases sell_in by 1' do
          expect(vest.sell_in).to eq 9
        end
      end

      context 'item is sulfuras' do
        it 'does not decrease sell_in' do
          expect(sulfuras.sell_in).to eq 1
        end
      end
    end

    context 'item is Aged Brie' do
      context 'sell by date has not passed' do
        it 'increases the quality by 1' do
          expect(brie.quality).to eq 1
        end

        it 'does not increase the quality beyond 50' do
          expect(brie_q.quality).to eq 50
        end
      end

      context 'sell by date has passed' do
        it 'increases the quality by 1' do
          expect(brie2.quality).to eq 2
        end

        it 'does not increase the quality beyond 50' do
          expect(brie2_q.quality).to eq 50
        end
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

    context 'item is Sulfuras, Hand of Ragnaros' do
      it 'does not change in quality' do
        expect(sulfuras.quality).to eq 80
      end
    end

    context 'item is Conjured Mana Cake' do
      context 'sell by date has not passed' do
        it 'reduces the quality by 2' do
          expect(conjured.quality).to eq 8
        end

        it 'does not reduce the quality beyond 0' do
          expect(conjured_q.quality).to eq 0
        end
      end

      context 'sell by date has passed' do
        it 'reduces the quality by 4' do
          expect(conjured2.quality).to eq 6
        end

        it 'does not reduce the quality beyond 0' do
          expect(conjured2_q.quality).to eq 0
        end
      end
    end

    context 'item is any of the others i.e. besides brie, passes, sulfuras and conjured' do
      context 'sell by date has not passed' do
        it 'reduces the quality by 1' do
          expect(vest.quality).to eq 19
        end

        it 'does not reduce the quality beyond 0' do
          expect(vest_q.quality).to eq 0
        end
      end

      context 'sell by date has passed' do
        it 'reduces the quality by 2' do
          expect(elixir.quality).to eq 5
        end

        it 'does not reduce the quality beyond 0' do
          expect(elixir_q.quality).to eq 0
        end
      end
    end
  end
end
