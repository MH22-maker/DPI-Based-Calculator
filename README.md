# DPI-Based-Calculator
This Repo serves as a very simple example about DPI Integration between the verilog modules and a foreign language which in our case is the c language. This model was created for basic understanding of the first layer working and integration of two different languages.

# Install Verilator
To run the code, you have to install the verilator. You can install it easily from here.
https://verilator.org/guide/latest/install.html 

# Run The Project
```bash
export VERILATOR_HOME=/home/user-name/verilator/
export PATH=$VERILATOR_HOME/bin:$PATH
mkdir build
cd build
cmake ..        # Compile
make dpi_sim    # Build
./Vsimv         # Execute
```
