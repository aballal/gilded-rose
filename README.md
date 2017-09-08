Gilded Rose
---

The requirements of this project have been described [here](requirements.txt).

Testing
---

In order to ensure refactoring did not alter existing functionality, I first wrote the [tests](spec/gilded_rose_spec.rb). I ensured that every code path of the legacy code had a corresponding test. While carrying out refactoring in small chunks I checked that the new code didn't break any tests. If it did, the refactoring had gone wrong, so I went back to the previous green state and started again.

In the end I also ran Emily Bache's testtest_fixture.rb copied [here](legacy/texttest_fixture.rb) against both legacy code and new code, then compared the two outputs. You can see the results [here](results_comparison/).

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
