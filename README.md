# Slightly broken GB emulator

This works on macOS/Linux and Windows 11 through WSLg (Sorry old Windows users!)

1. Clone this repo (https://github.com/BUGS-NYU/gbemu-demo)
2. Build it (install make first)
    - To run the game, after running make, run `./build/gbemu tetris.gb`
3. Two instructions are broken in opcodes.cc, try to fix them!
4. Get Tetris working!
    - There are two instructions that are broken in /src/opcodes.cc: _opcode_and(u8 value) and _opcode_adc(u8 value).
    - Work on the `and` instruction first!
    - Note: Use the pandocs (https://gbdev.io/pandocs/CPU_Instruction_Set.html)

Your goal is to fix two broken instructions (_opcode_adc(u8 value), _opcode_and(u8 value)). Use the pandocs for help.

Original readme below

# gbemu

`gbemu` is a Nintendo Gameboy emulator written in C++. It was written as an exercise (and for fun!) so its goals are exploration of modern C++ and clean code rather than total accuracy.

## Building

Building the emulator requires `cmake` and SDL and has been tested on macOS and Debian. To compile the project, run:

```sh
$ make
```

This builds two versions of the emulator:

* `gbemu` - the main emulator, using SDL for graphics and input
* `gbemu-test` - a headless version of the emulator for debugging & running tests

## Playing

```
usage: gbemu <rom_file> [--debug] [--trace] [--silent] [--exit-on-infinite-jr] [--print-serial-output]

arguments:
  --debug                   Enable the debugger
  --exit-on-infinite-jr     Stop emulation if an infinite JR loop is detected
  --print-serial-output     Print data sent to the serial port
  --trace                   Enable trace logging
  --silent                  Disable logging
```

The key bindings are: <kbd>&uarr;</kbd>, <kbd>&darr;</kbd>, <kbd>&larr;</kbd>, <kbd>&rarr;</kbd>, <kbd>X</kbd>, <kbd>Z</kbd>, <kbd>Enter</kbd>, <kbd>Backspace</kbd>.

## Tests

The emulator is tested using [Blargg's tests][blarggs] - these can be ran with `./scripts/run_test_roms`.

<img src="https://jgilchrist.uk/img/emulator/blarggs-tests.png" width="400">

The test it fails is due to the lack of a timer implementation.

## Missing features

Currently, `gbemu` only supports Gameboy games. I'm working on Gameboy Color support off-and-on at the moment. There's also no audio support yet.

## Screenshots

Menu | Gameplay
:-------------------------:|:-------------------------:
<img src="https://jgilchrist.uk/img/emulator/tetris-menu.png" width="400"> | <img src="https://jgilchrist.uk/img/emulator/tetris-gameplay.png" width="400">
<img src="https://jgilchrist.uk/img/emulator/zelda-menu.png" width="400"> | <img src="https://jgilchrist.uk/img/emulator/zelda-gameplay.png" width="400">
<img src="https://jgilchrist.uk/img/emulator/pokemon-menu.png" width="400"> | <img src="https://jgilchrist.uk/img/emulator/pokemon-gameplay.png" width="400">

[blarggs]: http://gbdev.gg8.se/wiki/articles/Test_ROMs
