# Makefile for LFSR simulation with Cocotb

# Defaults
SIM ?= icarus                    # Default simulator (can be changed to modelsim or others)
TOPLEVEL_LANG ?= verilog         # Language of top-level module (Verilog)
SRC_DIR = $(PWD)/../src          # Source directory for Verilog files
PROJECT_SOURCES = lfsr.v         # Main LFSR Verilog file (updated for lfsr module)

ifneq ($(GATES),yes)

# RTL simulation:
SIM_BUILD = sim_build/rtl
VERILOG_SOURCES += $(addprefix $(SRC_DIR)/,$(PROJECT_SOURCES))

else

# Gate level simulation:
SIM_BUILD = sim_build/gl
COMPILE_ARGS    += -DGL_TEST
COMPILE_ARGS    += -DFUNCTIONAL
COMPILE_ARGS    += -DUSE_POWER_PINS
COMPILE_ARGS    += -DSIM
COMPILE_ARGS    += -DUNIT_DELAY=\#1
VERILOG_SOURCES += $(PDK_ROOT)/sky130A/libs.ref/sky130_fd_sc_hd/verilog/primitives.v
VERILOG_SOURCES += $(PDK_ROOT)/sky130A/libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v

# This gets copied in by the GDS action workflow
VERILOG_SOURCES += $(PWD)/gate_level_netlist.v

endif

# Allow sharing configuration between design and testbench via `include`:
COMPILE_ARGS += -I$(SRC_DIR)

# Include the testbench sources:
VERILOG_SOURCES += $(PWD)/tb.v     # The testbench file, which is tb.v
TOPLEVEL = tb                       # Testbench module (corresponds to tb.v)

# MODULE is the basename of the Python test file
MODULE = test

# Include Cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim
