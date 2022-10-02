# LD 51

[ldjam.com](https://ldjam.com/events/ludum-dare/51)

**Theme: Every 10 Seconds**

## Background

My son is in 4th grade.
In 3rd grade, as well as in 4th grade, his class does math facts.
The concept is pretty straight forward:

> There are 100 math questions on a page
> 
> Students have 4 minutes to complete as many questions as possible
> 
> Students are graded by how many questions they answer correctly within the time limit
> 
> They are then graded accordingly:
> 
> | grade        | skill              |
> |:-------------|:-------------------|
> | 100%         | Advanced (Mastery) |
> | 99-94        | Proficient         |
> | 93-80        | Basic              |
> | 79 and below | Below Basic        |

My son has a really, _really_, hard time with this.
He's actually pretty good at math, but the time limit gets him distracted and he stops focusing on the problems and focuses more on how much time is left.

I figured this may be a fun way for him to practice.

## Overview

~The idea is that enemies will come at you, and you will have 10 seconds to gun them down by solving math facts.~

I thought of a _better_ idea last night.
This is dangerous though, because this is **scope creep**.

This will be a mashup between a math game and a tower defence game.

The idea is you own a pizza shop.
It's the best pizza shop around.
There are zombies and other undead creatures trying to break in.
This is because they love pizza and haven't had it since they were alive.
You must protect your pizza shop, so you place turrets throughout the town to stop them

There will be four main gameplay loops, each taking 10 seconds.
The gameplay loops are:
* solve as many math facts as you can
  * this is how you earn coins to buy turrets
* buy turrets or upgrades
* place turrets or make repairs to existing turrets
* withstand a wave of enemies

---

## TODO

* [asset] tileset for city
* [juice] make enemies flash white when hit
* [asset] gameplay loop music
* [asset] pizza shop sprite
* lots and lots of unknown tasks
* [td] set all turret positions from placement

## CURRENT

* [build] turret placement less janky

## DONE

* [build] able to place turrets
* [shop] extendable Item which has Turret child
* [shop] be able to buy turrets
* [general] ten second timer
* [math] basic input setup
* [math] refactor input to add keyboard input
* [td] base projectile
* [td] base enemy
* [td] base turret
* [td] Get pathfinding to work
  * Path2D and PathFollow2D made this almost too easy
* [asset] horrible looking sprite for city


