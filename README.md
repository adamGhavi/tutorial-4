## Preface
For this tutorial, I created two simple platformer level layouts and implemented rudimentary obstacles to serve as challenges within them. For the tilemaps, level layouts, and transition mechanic, I relied on the step-by-step instructions on the tutorial page. There was nothing notable about this process and I was able to finish the tutorial smoothly.

## Added mechanics:
In addition to the basic mechanics which were expected of this assignment, I've implemented some of my own:

### 1. Level Transition Sequence
The player transitions between levels by touching the rocketship object that serves as every level's end goal. I've added a small sequence to better deliver the sense of achievement of completing a level. This sequence consists of the rocketship taking off, shaking, and producing particle effects as expected from the combustion of jet fuel.

### 2. Allied Character
I've added a friendly NPC that follows the player around. There is no particular purpose to this character, I just wanted to experiment with rudimentary pathfinding and AI for this tutorial.

### 3. Frog Enemy & AI
I've also added a hostile NPC that follows the player through a state machine implementation with two distinct states: "Idle" and "jumping". I wasn't able to fully implement this NPC, it merely jumps in the direction of the player but doesn't pose any threat to them. It also exhibits some unexpected behaviour when players happen to move under the NPC while it is mid-air.

### 4. Fish Obstacle Blinking
I added a minor effect where the fish obstacles blink for a few moments before disappearing.
