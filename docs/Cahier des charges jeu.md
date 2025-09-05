---
class:
  - R5-04_qualité_dev
---
Nom du jeu :  Invader : 1945 landing

Concept : Top down Shoot'Em Up à défilement game 

**Shoot'Em Up** détruire un grand nombre d'ennemis à l'aide de projectiles tout au long du niveau en esquivant les projectiles adverses.

Guidelines : 
+ respect des normes de [godot](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_styleguide.html)
+ each functionnnality should be tested before push with : GDUnit/GUT for unitest, test papers when unit tests are impossible
+ push sur github et do code reviews 

Description : 
After a main menu with a play and option button, the 2D game shows a soldier landing during the 1945 Normandy's landing. The soldier is following player's mouse. The player is always shooting in front of him and in between, reloading his gun. Enemies move and fire projectiles too. If the player is hit by 3 enemies' projectiles or their body, it's game over. The gamemode is endless with a boss in between (a tank, a bunker) each level. Reaching a certain amount of score will let you fight the boss and go to the next level. Each level increase difficulty. Enemies drop buffs and items that can slow/increase player speed, increase fire rate, damage or remove the need to reload/find bullets but also change weapon and so, mode of fire. Items can also bring help from allies (air strike, canon etc...). The game can be paused while playing and allow settings change.


Minimal Viable Product) MVP : 
After a main menu with a play, the 2D game shows a character. The character is following player's mouse. The player is always shooting in front of him. Enemies move top to bottom. If the player is hit by 3 ennemies' body, it's game over. The gamemode is endless. Reaching a certain amount of score end the level and make it harder for the next run. Enemies drop items increasing player speed, fire rate, damage. 

The nice to haves : 
+ option button
+ The player is reloading his gun.
+ Enemies move randomly or with a pattern and fire projectiles too.
+ If the player is hit by 3 enemies' projectiles or their body, it's game over. 
+ Boss in between (a tank, a bunker) each level. 
+ Reaching a certain amount of score will let you fight the boss and go to the next level.
+ Enemies drop buffs and items that can slow/increase player speed, increase fire rate, damage or remove the need to reload/find bullets but also change weapon and so, mode of fire. 
+ Items can also bring help from allies (air strike, canon etc...). 
+ The game can be paused while playing to twick options.
+ a game over/next level menu with retry/continue button (in the later, it's more like a pause button)
+ save the score, lives, time

# Break down into functions

MVP 
- f_1 -> menu with play button 
- f_2 -> the character is following player's mouse
- f_3 -> character always shooting in front of him
- f_4 -> enemies move top to bottom 
- f_5 -> after 3 hit, game over -> main menu
- f_6 -> reaching a specific score end the game otherwise, it's endless
- f_7 -> enemies drop damage, health bonus

## Sub-functions

f_1 -> 
+ [ ] Menu scene 
+ [ ] Button ui with text
+ [ ] switch to next scene on button click

f_2 ->
- [ ] character always follow player's mouse

f_4 -> 
- [ ] enemies move top to bottom 
- [ ] they can take damage 

f_3 ->
- [ ] character shoots in front of him
- [ ] bullets deals damage to enemies

f_5 -> 
- [ ] the player can take damage 
- [ ] on player death signal, game over
- [ ] on game over, switch to main menu

f_6 -> 
+ [ ] set up a score for killing enemies
+ [ ] reaching a certain score end the game
+ [ ] on win, switch to main menu

f_7 -> 
+ [ ] enemies drop items 
+ [ ] 3 items : buff atk, increase health by one

# Doc technique 

Technical systems : 
- [Godot](https://godotengine.org/download/linux/) godot 4.3 with GDScript
	- [official docs](https://docs.godotengine.org/en/stable/)
	- [simple youtube guide to understand quickly](https://www.youtube.com/watch?v=LOhfqjmasi0)

[[UML Game Design.canvas|UML Game Design]]

