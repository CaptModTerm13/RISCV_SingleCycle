# Bluespec System Verilog Compiling Guide
1. Create the .bsv file (using a text editor)
2. Compile the file using the command **bsc -u file.bsv**
3. Perform .ba elaboration using the command **bsc -u -sim -elab -g <TopModule> <FileName>**
4. Perform .bo elaboration  **bsc -sim -e <TopModule> -o <TopName(Enter the alias for the sim file)>**
5. ./(filename) for simulation

## Convert to verilog 
bsc -u -verilog -g TOPModule FileName.bsv
