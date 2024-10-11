# MIPS Assembly Code Runner

This repository contains MIPS assembly code that you can run using the QTSpim simulator. Follow the steps below to set up and run the `.asm` files.

## Steps to Run the `.asm` File

1. **Install QTSpim**:
   - Download and install QTSpim from the official [QTSpim website](http://spimsimulator.sourceforge.net/).

2. **Add QTSpim Directory to the Environment Variables**:
   - Add the directory where QTSpim is installed to your system's environment variables.
   - **For Windows**:
     - Search for "Environment Variables" in the Start Menu.
     - Click on "Edit the system environment variables."
     - In the System Properties window, click on the "Environment Variables" button.
     - In the Environment Variables window, find the "Path" variable in the "System variables" section and select it, then click "Edit."
     - Click "New" and add the path to the QTSpim installation directory (e.g., `C:\QtSpim`).
     - Click "OK" to close all dialog boxes.

3. **Run the Assembly Code**:
   - Open a command prompt or terminal.
   - Navigate to the directory containing your `.asm` file.
   - Use the following command to run the code:
     ```bash
     qtspim -file <file_name>.asm
     ```
   - Replace `<file_name>` with the name of your assembly file.

## Example Usage
To run an example assembly file named `example.asm`, you would enter:
```bash
qtspim -file example.asm
