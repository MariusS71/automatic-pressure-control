# Automatic Pressure Control System

This project focuses on designing and implementing two types of controllers—**PID** and **RST**—to achieve automatic pressure regulation. The goal is to optimize system performance by ensuring stability, robustness, and responsiveness to perturbations.

##  Project Overview
- **Objective**: Develop and test automatic pressure controllers (PID and RST) on a simulated system.
- **Technologies Used**: MATLAB, Control Systems Toolbox.
- **Team Members**: Marius-Andrei Saioc, Maria-Cristina Sima.

## Methodology
1. **System Identification**:
   - Experimental data was collected to model the system's behavior and derive the transfer function.
   - Discretization of the transfer function was performed for digital controller implementation.

2. **Controller Design**:
   - **PID Controller**:
     - Developed using the pole-zero method.
     - Tuned to achieve performance metrics: <10% overshoot, <5s settling time, and zero steady-state error.
   - **RST Controller**:
     - Designed using the Sylvester matrix method for robust reference tracking.
     - Included a trajectory generator for smooth reference changes.

3. **Simulation & Testing**:
   - Controllers were simulated in MATLAB under various conditions, including step inputs and perturbations.
   - Final implementations were tested on the physical platform to validate performance.

##  Key Features
- System modeling and identification using experimental data.
- Design and tuning of **PID** and **RST** controllers for optimal performance.
- Real-time testing on a simulated pressure system with robust disturbance rejection.

##  Results
- Both **PI** and **RST** controllers successfully maintained the desired pressure levels while handling disturbances.
- The controllers demonstrated stability, quick response times, and minimal overshoot, meeting all performance criteria.

##  Conclusion
This project successfully implemented **PID** and **RST** controllers to automate pressure regulation, achieving high performance, robustness, and stability. Both controllers proved effective in handling system variations and perturbations.

For detailed documentation and MATLAB scripts, refer to the project files.
