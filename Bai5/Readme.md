SPIM Example: Maximum of Two Numbers
This project demonstrates a simple assembly program that calculates the maximum of two numbers using the SPIM simulator.

Requirements
SPIM: Version 8.0 (or later)
SPIM is a MIPS32 simulator that runs assembly language programs.
Assembly Source File: getmax.s
The assembly program prompts the user for two numbers and outputs the maximum.
Installation
Install SPIM:

On Debian-based systems (e.g., Ubuntu), run:

bash
Copy code
sudo apt-get install spim
For other platforms, refer to SPIM's official documentation.

Clone or download the getmax.s file and place it in your working directory.

Usage
Running the Program:

Execute the getmax.s file using the SPIM simulator with the following command:

bash
Copy code
spim -file getmax.s
Example Output:

yaml
Copy code
SPIM Version 8.0 of January 8, 2010
Copyright 1990-2010, James R. Larus.
All Rights Reserved.
See the file README for a full copyright notice.
Loaded: /usr/lib/spim/exceptions.s
Enter two numbers: 50
100
The maximum is: 100
The program will prompt you to enter two numbers.
It will then compare the numbers and print the larger one.
