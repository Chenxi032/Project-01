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
VAR berries = 0
->theMagicBakery
== theMagicBakery ==
 The aroma of warm pastries and cinnamon fills the air. You are standing inside The Magic Backery. Today you nned create a legendary Moonlight Croissant. "Welcome guys!", The bakery's head witch. "A Moonlight Croissant needs three special ingredients. Choose wisely, for the magic will change depending on what you use!!"
 
 It is {advance_time()}
 
+ [Visit the Magical Market] -> market
+ [Forage for Wild Ingredients in the Enchanted Forest] -> forest
+ [Check the Bakery's Storage Room] ->storage

== market ==
The bustling Magical Market is filled with potion sellers, spice traders, and mystical bakers. You spot a glowing vial of Moonflower Essence for sale.
It is {advance_time()}

* { time == 0 }[Buy the Moonflower Essence (Costs 3 gold)] {gold >= 3} -> buy_Moonflower
* [Talk to the mysterious spice merchant] -> spice_merchant
* [Leave the market] -> theMagicBakery

== buy_Moonflower ==
You hand over 3 gold and carefully take the Moonflower Essence.
~ gold = gold - 3
-> storage

== spice_merchant ==
The spice merchant whispers, "A touch of Celestial Cinnamon can make any pastry glow under the moonlight. But beware—it may cause unexpected wishes!"


* [Trade for the Celestial Cinnamon] -> get_cinnamon
* [Decline and leave] -> theMagicBakery

== get_cinnamon ==
You trade for the Celestial Cinnamon.
->storage

== forest ==
The Enchanted Forest is full of glowing mushrooms, whispering trees, and hidden creatures. You spot Stardust Berries growing near a river.
 It is {advance_time() }
 
* { time == 2 }[Pick the Stardust Berries] -> pick_berries
* [Search for another ingredient] -> deeper_forest

== pick_berries ==
{not pick_berries: You carefully collect the Stardust Berries, which sparkle like tiny stars.}
->return_to_bakery
~ berries = berries + 100
You now have a torch. May it light the way.
* [Go bakery] -> return_to_bakery
-> END

== deeper_forest ==
You sense something powerful nearby--- A Fairy’s Blessing! This rare magic can enhance any baked good.
-> Master

== storage ==
The storage room is dark and dusty, but you find a jar labeled Moonlit Sugar*, a rare and sweet magical ingredient.
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

== Master ==
You are already a master baker! You have the blessing of the fairies and you don't need to go shopping for any ingredients now, just use magic to make any kosher.
-> END

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
    
    

    

    
    









