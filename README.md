# mips
  MIPS processor in SystemVerilog. Made from scratch with limited instructions (from MIPS ISA)
  THIS IS A UNIVERSITY PROJECT - NOT MODIFIED SINCE 2021, it could be optimize (adding Immediate instructions or interrupts handling) 
  
  ##Posible Instructions:
    _ Arithmetics (ADD, SUB, MUL) made by an UAL
    _ Load registers from memory
    _ Write from register to memory
    _ Jump instruction
    _ Branch instruction (Branch if inferior)
 
  ##Folder organization:
    _ rtl - location of all the source files, corresponding to different SystemVerilog modules & "memory.dat" contains the values for memory initialization
    _ bench - Test bench to test every module and the top one (MIPS is "top_sequential")
    _ scripts - Bash scripts to initialize librairies and run simulations using MODELSIM only
    _ Presentation: Slides to present project and the results



# Running simulation -- using MODELSIM on a Linux OS
To run simulation and create the modules using Modelsim tool, you can run the files corresponding in "scripts" folder. 
First create the different libraries: use "scripts/lib" folder and source the different scripts in it
Then read the SystemVerilog file for different Test-bench: use the scripts "scripts/bench*.sh" to read the SV files and create modules in Modelsim. To run the top module run "benchSeq.sh", else run "bench<name_module_test>.sh".
Finnaly open Modelsim and laucnh the simulation corresponding to the test-bench you read. 

To verify the top_sequential module (MIPS CPU + memory) you can check that Jump instructions and branch are done (see the values written in memory at the end)
The instructions used for the tests of "top_sequential" can be found in the presentation file, and in the "rtl/memory.dat" (coding instructions).
