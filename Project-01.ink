/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/
VAR gold = 5
VAR time = -1 //  0 Morning, 1 Noon, 2 Night

->theMagicBakery
== theMagicBakery ==
 The aroma of warm pastries and cinnamon fills the air. You are standing inside The Magic Backery. Today you nned create a legendary Moonlight Croissant. "Welcome guys!", The bakery's head witch. "A Moonlight Croissant needs three special ingredients. Choose wisely, for the magic will change depending on what you use!!"
 
 It is {advance_time()}
 
+ [Visit the Magical Market] -> market
+ [Forage for Wild Ingredients in the Enchanted Forest] -> forest
+ [Check the Bakery's Storage Room] ->storage

== market ==

It is {advance_time()}

* { time == 0 }[Buy the Moonflower Essence (Costs 3 gold)] {gold >= 3} -> buy_Moonflower
* [Talk to the mysterious spice merchant] -> spice_merchant
* [Leave the market] -> return_to_bakery

== buy_Moonflower ==
You hand over 3 gold and carefully take the Moonflower Essence.
~ gold = gold - 3
-> return_to_bakery

== spice_merchant ==
The spice merchant whispers, "A touch of Celestial Cinnamon can make any pastry glow under the moonlight. But beware—it may cause unexpected wishes!"

It is {advance_time() }

* { time == 1 }[Trade for the Celestial Cinnamon] -> get_cinnamon
* [Decline and leave] -> return_to_bakery

== get_cinnamon ==
You trade for the Celestial Cinnamon.
-> return_to_bakery

== forest ==

 It is {advance_time() }
 
* { time == 2 }[Pick the Stardust Berries] -> pick_berries
* [Search for another ingredient] -> deeper_forest

== pick_berries ==
{not pick_berries: You carefully collect the Stardust Berries, which sparkle like tiny stars.}
~ gold = gold +- 0
-> return_to_bakery

== deeper_forest ==
You sense something powerful nearby--- A Fairy’s Blessing! This rare magic can enhance any baked good.
-> return_to_bakery

== storage ==
* [Take the Moonlit Sugar] -> take_sugar
* [Look for something else] -> storage_search

== take_sugar==
You take the Moonlit Sugar and return to the kitchen.
-> return_to_bakery

== storage_search ==
You did deeper and find an Ancient Recipe Book
-> return_to_bakery

== return_to_bakery ==
You return to the bakery, ready to bake your Moonlight Croissant. 
* [ Make a croissant with moonflower ] -> moonflower_croissant
* [ Make a croissant with cinnamon ] -> cinnamon_croissant
* [ Make a croissant with berry ] -> berry_crossiant


== moonflower_croissant ==
As the croissant bakes, it glows softly. When you take a bite, you feel a deeo sense of peace and clarity, as if the stars themselves are watching over you.
-> ending

== cinnamon_croissant ==
The moment you taste the croissant, the world shimmers. Suddenly, your wish comes ture! But be careful--sometimes wishes have unexpected consequences.
-> ending

== berry_crossiant ==
The Stardust Berries give the croissant a sparkling, magical aftertaste, and your baking skill increases! You are now one step closer to becoming a Master Baker.
->ending

== ending ==
"Well done, apprentice! You have baked a magical delight." 
Your journey as a magical baker has only just begun...
-> END


== function advance_time ==

    ~ time = time + 1
    
    {
        - time > 2:
            ~ time = 0
    }    
    
    {    
        - time == 0:
            ~ return "Morning"
        
        - time == 1:
            ~ return "Noon"
        
        - time == 2:
            ~ return "Night"
    
    }
    
        
    ~ return time
    
    

    

    
    









