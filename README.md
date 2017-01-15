# Merkur-board helpers #

Some wrappers used to flash the [merkur-board][0].

To flash the first stage bootloader to the device:

* [connect][1] avrdude
* turn on power (+3.3V)
* then right away

       make NUM=2

To check if the board answers at all _before_ flashing
the loader you can use:

       make check

[0]: http://osdwiki.open-entry.com/doku.php/de:projekte:merkur
[1]: https://honk.sigxcpu.org/piki/hw/merkur-board/merkur-board-flash-1st-stage-1.jpg
