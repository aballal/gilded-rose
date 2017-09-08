Gilded Rose
---
  
The requirements of this project have been described [here](requirements.txt).

Complexity Reduction
---

Complexity of GildedRose class has been reduced from 94.1 to 39 before introducing new functionality.

```
Akshathas-MacBook-Pro:gilded-rose aksjohn$ flog ./legacy/gilded_rose.rb
    94.1: flog total
    47.0: flog/method average

    93.1: GildedRose#update_quality        ./legacy/gilded_rose.rb:7-48
Akshathas-MacBook-Pro:gilded-rose aksjohn$ flog ./lib/gilded_rose.rb
    39.0: flog total
     7.8: flog/method average

    16.3: GildedRose#update_quality        ./lib/gilded_rose.rb:7-17
    10.8: GildedRose#change_for_passes     ./lib/gilded_rose.rb:23-27
```

Complexity of the code only increased by 0.3 when new functionality was introduced.

```
Akshathas-MacBook-Pro:gilded-rose aksjohn$ flog ./lib/gilded_rose.rb
    39.3: flog total
     7.9: flog/method average

    16.3: GildedRose#update_quality        ./lib/gilded_rose.rb:8-18
    10.8: GildedRose#change_for_passes     ./lib/gilded_rose.rb:24-28
```
