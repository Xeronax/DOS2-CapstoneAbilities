# DOS2-Capstone Abilities

Capstone Abilities is an unfinished mod for Divinity Original Sin 2: Definitive Edition that adds extra effects to the Pyrokinetic spells upon reaching a skill threshold.

## Purpose

- Introduce new mechanics without introducing new buttons to Divinity
- Incentivize heavy investment into one skill path
- Tie spells to each other via interactions such as cooldown reduction
- Create more decision points per turn
- Make Divinity feel more like a game with rotations than disparate spells

## Core loop
This mod encourages players to do the following:
Apply Burning → ramp crit chance → convert crits into cooldown reduction and AP → spend AP on AoE to maintain Burning. 

## Post-Mortem

### Design problems
- Spontaneous Combustion proved to trivialize applying Burning to enemies
- This made Awakened Fury in particular hard to balance especially with spells like Searing Daggers or Ignition that could net you two or three AP on cast, this created degenerate play patterns that I didnt foresee:
- - Clear-Mind -> Ignition on two targets +2 AP -> Fireball +2 AP -> Searing Daggers on two targets +2 AP -> Ignition +2 AP
- - Sometimes start your turn with an Ignition that gives you an extra 3 AP. Having spells pay for themselves is not a healthy play pattern in my view.
- - Turn start Ignition consuming your Heating Up stacks undermined that mechanic
- Application problems were also compounded by free Ignition casts which themselves somewhat trivialized Spontaneous Combustion's spreading effects
- Gaining Clear-Minded when Fireball comes up did too much of the player's work for them, in hindsight I would make this a much more tame bonus

These issues somewhat undermined the play patterns I was trying to encourage of having to carefully choose your burning application spells. Discretion had to be exercised via tuning knobs like making some bonuses status dependent or % chances of procs happening, but % chance procs particularly only partially solve the problem by relegating the balance issues to spikes in play patterns accompanied by stretches of relative downtime. Even though it's fun to play, future efforts would include more attention to loop-terminating mechanisms and failure modes that actually ask something of the player.

From a complexity standpoint, it introduced a lot of interplay with existing statuses like Clear Minded or Haste, and while I think Divinity does a good job of onboarding the player to these effects gradually, but there are questions to be asked about whether the pace at which you can reach the skill thresholds matches the pace the game introduces these statuses.

### What worked
- Mod did a good job of adding class complexity without more buttons, very much needed in Divinity
- Incredibly fun to run through the campaign with because the power fantasy and identity are very real!
- Achieves making Divinity playstyle feel more rotational and less scrappy and disparate
- Incentivizes heavy investment (which I think is fun)

### What didnt work
- Positive feedback loops don't terminate well enough
- Playstyle doesn't really have failure modes; too much work done for the player
- Somewhat trivializes the AP economy
- Onboards a lot of information in little time

### What I would change in hindsight
- Add hard 1 AP per spell cap to Awakened Fury to force the failure mode of wrong choices
- Trigger a different spell on turn start than Ignition
- Ignition doesn't crit Burning enemies, this removes a lot of the cushion that cause the playstyle to have no failure modes, your Heating Up stacks matter if you don't get auto-crits from Ignition
- Spontaneous Combustion spreads to 1 target within 20m
- Flamestrider introduced later into Pyro skill investment
- Replace some status bonuses and procs with cooldown reduction to introduce more decisions to the player

### Engine Limitations
The Divinity Engine imposes constraints that make it difficult if not impossible to implement some of these behaviors. Some of these gaps aren't able to be bridged by Norbyte's Script Extender despite their tireless work to add functionality via lua implementation. In particular, cooldown reduction, % damage taken as healing, and % damage dealt as shielding are things that require incredibly janky solutions. As a result, many of these effects are designed under that engine constraint, so there is a much stronger reliance on status effects to do a lot of the heavy lifting.

## Full Ability Reference

**Flame Strider** (Status)
Convert 22% of fire damage you take into healing.

**Fireball**

Send a fiery sphere that will explode and deal [damage].

Capstone Effects

Heating Up (Pyrokinetic 4) — Dealing non-critical damage grants you Heating Up, which increases your critical strike chance by [X]% until you critically strike.

Phoenix's Breath (Pyrokinetic 8) — Fireball's cooldown is doubled. Whenever you critically strike, Fireball's cooldown is reduced by 2 turns. When Fireball comes off cooldown, you gain Clear-Minded.


**Searing Daggers**

Shoot three flaming daggers in a row, each setting Warm. Deals a total of [damage].

Capstone Effects

Pyrokinetic 4 — When Searing Daggers deals direct damage to an enemy, it resets the cooldown of Ignition.


**Ignition**

Set enemy characters on fire around you and deal [damage]. Ignite all susceptible surfaces.

Capstone Effects

Pyrokinetic 3 — Ignition critically strikes burning enemies.

Pyrokinetic 7 — Ignition critical strikes cause enemies to Bleed Fire for 2 turns.


**Clear-Minded**

Target gains Clear-Minded, which increases Strength, Finesse, and Intelligence by [X] and Wits by [Y]. Removes Blinded, Terrified, Charmed, Taunted, Sleeping, Enraged.

Capstone Effects

Phoenix's Blazing Sight (Pyrokinetic 6) — Your direct attacks and skills while Clear-Minded deal an additional 3% of your target's maximum vitality as fire damage.

Awakened Fury (Pyrokinetic 10) — Whenever you critically strike with a fire skill while Clear-Minded, you gain 1 AP.


**Haste**

Set Hasted on target character. Hasted increases movement speed by 2m per AP and gives an additional [X] AP per turn. Clears Slowed and Crippled.

Capstone Effects

Flame Strider (Pyrokinetic 2) — If you're both Burning and Hasted, you gain Flame Strider.

Rising Sun (Pyrokinetic 8) — When you start your turn with Flame Strider, you cast Ignition at no AP cost.


**Spontaneous Combustion**

Deal [damage] around target character. If the character has Burning or Necrofire statuses, the damage gets a bonus for each turn of duration left.

Capstone Effects

Infernal Chains (Pyrokinetic 5) — Spontaneous Combustion spreads Burning and Necrofire statuses on the target to other enemies within 20m. Inflicting Burning or Necrofire has a [X]% chance to reduce the cooldown of Spontaneous Combustion by 1 turn.

Gathering Flame (Pyrokinetic 7) — You siphon a portion of fire damage dealt to enemies as a shield that blocks incoming damage.

