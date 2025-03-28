# Makefile
# See https://docs.cocotb.org/en/stable/quickstart.html for more info

# defaults
SIM ?= icarus
TOPLEVEL_LANG ?= verilog
SRC_DIR = $(PWD)/../src
PROJECT_SOURCES = lfsr.v         # Main LFSR Verilog file
TESTBENCH_SOURCES = lfsr_test.v  # Testbench Verilog file

# Simulation build directory
SIM_BUILD = sim_build

# Include the necessary sources
VERILOG_SOURCES += $(addprefix $(SRC_DIR)/,$(PROJECT_SOURCES)) $(addprefix $(SRC_DIR)/,$(TESTBENCH_SOURCES))

# Include Cocotb's make rules
include $(shell cocotb-config --makefiles)/Makefile.sim

# The top-level testbench module to run in the simulator
TOPLEVEL = lfsr_test

# Module name for Cocotb Python tests
MODULE = test

# Include source directory for compiling Verilog files
COMPILE_ARGS += -I$(SRC_DIR)
