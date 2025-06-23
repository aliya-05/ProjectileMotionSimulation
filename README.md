Overview:

A MATLAB-based simulation tool designed to model and analyze projectile motion trajectories under varying input conditions. The project includes:
- A command-line MATLAB script for detailed calculations and trajectory plotting
- An interactive MATLAB App Designer application for user-friendly input and visualization

Project Description:

This project simulates the projectile motion of an object launched over an obstacle (a building) to a designated landing point.

Problem Setup - 
- An object is launched from Coordinate A (x, y, z) with velocity V at launch angle α
- A tall building (height H) is always located between the launch point and the landing point, blocking the line of sight
- The object must land at Coordinate B (10, 5, 0) relative to the building's position
- Regardless of user-selected launch point A, the building always obstructs the direct path to B, requiring careful calculation of the launch angle and velocity to clear it

Key Features:

- Calculates minimum and maximum feasible launch angles and velocities based on user input
- Determines whether the projectile successfully clears the building
- Visualizes projectile motion using height vs. horizontal distance plots
- User-friendly MATLAB App GUI:
-     input launch coordinates and building height
-     select launch angle within valid range using slider
-     real-time simulation with graphical output
-     built-in input validation to handle errors and ensure meaningful results

Files Included:

- projectile_sim.m
-     main MATLAB code for calculating trajectories and plotting results 
- projectile_app.mlapp
-     MATLAB App Designer file for the interactive GUI version
- README.md
-     project documentation

How to Run:

- Command-Line Script
-     Open MATLAB and locate projectile_sim.m in the current folder
-     Run: projectile_sim
-     Follow prompts to input launch coordinates, building height, and launch angle
-     The projectile trajectory will be plotted automatically

- MATLAB App
-     Open MATLAB and locate projectile_app.mlapp
-     Type the following command to open the App and then press enter: open('projectile_app.mlapp')
-     Fill the required fields for launch coordinates and building height
-     Select a valid launch angle using the slider
-     Click Simulate to display the projectile trajectory

Assumptions & Limitations:

- Air resistance is neglected
- Building is assumed to have no width (modeled as a vertical plane)
- Simulation is based on ideal projectile motion

Future Work & Recommendations:

- Incorporate air resistance to simulate real-world projectile motion more accurately
- Consider building width instead of assuming the building as a single vertical line
- Modify the app to include 3D trajectory visualization for a more comprehensive spatial view
- Optimimize computational efficiency by refining angle search algorithms to reduce processing time
- Implement real-time feedback in the GUI to update trajectory instantly as user adjusts parameters (consider using Python or Simulink integration for advanced modeling)
- Expand educational usability by adding step-by-step solution breakdowns within the app to assist learning

License 

This project is for educational purposes. Feel free to use, modify, and build upon this work with proper credit. 
