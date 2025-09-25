[README.md](https://github.com/user-attachments/files/22535437/README.md)
# GHOSTRACE-RISCV: Analysis of Speculative Race Conditions on RISC-V Platforms

## Overview

This project extends the research on Speculative Race Conditions (SRCs) to the RISC-V architecture. The primary goal of this work is the submission of the paper "Breaking Thread Isolation: GhostRace Attack and Mitigation on RISC-V" to the COMCOMAP 2025 conference. Building upon the foundational research by the VUSec group on x86 architectures, this project introduces new testing and analysis capabilities for SRCs on the gem5 simulator and the BeagleV-Fire, a RISC-V-based single-board computer.

The codebase and concepts for this project are derived from the original GhostRace work, which can be found at https://github.com/vusec/ghostrace.

## Project Contributions

The key contributions of this project include:

* **Adaptation to RISC-V**: The speculative race condition concepts from the x86-based GhostRace project have been adapted and tested for the RISC-V instruction set architecture.

* **gem5 Simulator Testing**: A testing framework has been developed to analyze speculative race conditions within the gem5 simulation environment, allowing for detailed and controlled experimentation.

* **BeagleV-Fire Hardware Implementation**: The research has been extended to practical hardware testing on the BeagleV-Fire platform, providing insights into the real-world implications of these vulnerabilities on RISC-V systems.

## Getting Started

This section provides instructions on how to set up the environment and run the tests on both the gem5 simulator and the BeagleV-Fire hardware.

### Prerequisites

* A working installation of the gem5 simulator for simulated testing.
* A BeagleV-Fire single-board computer, along with the appropriate toolchain for cross-compilation and deployment.
* A Linux-based host machine for development and testing.

### Running the Hardware Tests on BeagleV-Fire

This section details the procedure for compiling and running the GhostRace tests directly on the BeagleV-Fire hardware.

#### 1. Physical Connection

First, ensure the BeagleV-Fire board is physically connected to your host computer.

#### 2. File Transfer

Open a PowerShell terminal on your host machine and use the Secure Copy Protocol (scp) to transfer the necessary source and build files to the board.

**Required Files:**
- `src_ghostrace.c`
- `src_countermeasure_ghostrace.c`
- `fr.h`
- `Makefile`

**Command:**  
Execute a command similar to the following, replacing `<beagleV_fire_ip>` with your board's IP address and specifying the target directory.

```bash
scp src_ghostrace.c src_countermeasure_ghostrace.c fr.h Makefile user@<beagleV_fire_ip>:/home/user/ghostrace_riscv
```

#### 3. Remote Access and Compilation

Connect to the BeagleV-Fire board using SSH, navigate to the correct directory, and compile the code.

**Connect via SSH:**

```bash
ssh user@<beagleV_fire_ip>
```

**Compile:**  
Once logged in, navigate to the directory where you transferred the files. The Makefile provides two compilation options. Choose the one that matches your hardware.

- To compile WITHOUT support for the Zicbom extension, run:

```bash
make all
```

- To compile WITH support for the Zicbom extension, run:
```bash
make all_zicbom
```

#### 4. Execution

After the compilation is successful, run each executable on the board to perform the tests.

**Run the main GhostRace test:**

```bash
./src_ghostrace
```

**Run the test with the countermeasure:**

```bash
./src_countermeasure_ghostrace
```
