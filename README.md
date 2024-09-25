# 🦈 Gruesome Fish

## Overview
**Gruesome Fish** is a fast-paced survival game created during a two-week game jam using Godot. You play as a shark stranded on the beach, desperately trying to reach the ocean before you dehydrate. But wait — humans are 70% water, right? Devour them to extend your life, grow bigger, and slide your way to survival!

## 🎮 Gameplay

- **Goal:** Survive long enough to find the ocean before you dehydrate.
- **Mechanics:**
  - **Eat People**: Devour humans to live longer and grow larger.
  - **Growth and Speed**: As you eat, you grow bigger but slower. However, sliding on blood keeps you fast.
  - **Wet and Dry States**: 
    - **Wet Shark**: Slides around quickly on blood trails and stays healthy.
    - **Dry Shark**: Flops around slowly on the sand and dehydrates rapidly.
- **Map**: Explore a sandy beach with the ocean hidden somewhere. Find it to survive!

## 🖼️ Art and Assets

- **Beach Environment**: Sandy terrain with the ocean hidden somewhere.
- **Shark**: 
  - **Wet Shark**: Covered in blood, sliding everywhere, leaving a blood trail.
  - **Dry Shark**: Flopping, drying out, and close to death.
- **Humans**: Edible entities that explode into blood when eaten.

## 🧑‍💻 Code Structure

**Controls**:
- Eight-directional movement.
- (Stretch goal) Lunge mechanic on `Space` or `Shift`.

**Gameplay Loop**:
1. Search for humans.
2. Eat humans to extend your life and grow.
3. Repeat until you find the ocean or die.

**Timer**:
- 1-minute base timer.
- Extended by 3 seconds for every human eaten.

### Code Organization:
- `GameScene` for overall game logic.
- `SharkScene` for player (shark) controls.
- `HumanScene` for human entities.
- `EnvironmentScene` for beach and ocean.
- `StartScreenScene` for the start menu.
- `PauseScreenScene` for game pause functionality.

### Code Style:
- Following the [Godot GDScript style guide](https://docs.godotengine.org/en/stable/getting_started/scripting/gdscript/gdscript_styleguide.html).

## 🌐 Play the Game

You can play **Gruesome Fish** directly in your browser! Check out our live Itch.io page and dive into the chaos:

👉 [Play Gruesome Fish on Itch.io](https://lego3d.itch.io/gruesome-fish)

## 👩‍💻 Team
- Matthias Van Horn - **Artist**
- Haty Johansen - **Artist**
- Liam Neary - **Artist**
- Dylan Rothbauer - **Programmer**
- Riley DuLak - **Programmer**
- Joe Luther - **Programmer**
---

Thanks for checking out **Gruesome Fish**! We hope you enjoy playing it as much as we enjoyed creating it!
