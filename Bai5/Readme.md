
# getmax.s - MIPS Assembly Program

This repository contains a MIPS assembly program that reads two integers from the user and prints the maximum of the two. The program is designed to run using the SPIM simulator.

## Prerequisites

Before you can run the program, ensure you have the following installed on your system:

- [SPIM](http://spimsimulator.sourceforge.net/) (version 8.0 or later)

To install SPIM on Ubuntu/Debian-based systems, run:

```bash
sudo apt-get install spim
```

## How to Run

1. Clone this repository to your local machine.
2. Open a terminal in the project directory.
3. Use SPIM to run the `getmax.s` program by executing the following command:

```bash
spim -file getmax.s
```

4. You will be prompted to enter two integers:

```bash
Enter two numbers: 50
100
```

The program will then print the maximum of the two numbers.

## Example Output

```bash
SPIM Version 8.0 of January 8, 2010
Copyright 1990-2010, James R. Larus.
All Rights Reserved.
See the file README for a full copyright notice.
Loaded: /usr/lib/spim/exceptions.s
Enter two numbers: 50
100
The maximum is: 100
```

## License

This project is distributed under the MIT License. See `LICENSE` for more information.
```

