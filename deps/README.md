This dockerfile adds dependencies we need in the cuda+optix container before building opticks.

mainly:

* cmake 3.13 (need a newer one than that available for 16.04 by default)
* boost 1.69 (need newer one)
* misc set of packages we grab using apt