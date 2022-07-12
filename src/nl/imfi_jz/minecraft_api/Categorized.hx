package nl.imfi_jz.minecraft_api;

interface Categorized {
    ///** Obtain a list of implemented interface names **/
    //function getCategories():StandardCollection<String>;
    /**
        Returns whether or not this object falls into a given `category`. 
        
        For exmpale, a Zombie would fall into categories "monster", "creature", "undead", "zombie", etc. An Arrow, Egg or Snowball would fall into "projectile" and a Minecart or Boat would fall into "vehicle". This method is case insensitive and categories can match partially, meaning "pig" could match a Pig but also a PigZombie.

        Most available categories on Spigot can be found at the "All Known Subinterfaces" at https://hub.spigotmc.org/javadocs/bukkit/org/bukkit/entity/Entity.html, at https://hub.spigotmc.org/javadocs/spigot/org/bukkit/entity/EntityType.html and https://hub.spigotmc.org/javadocs/spigot/org/bukkit/Material.html.
        However, there is no "complete list" available.

        Generally, objects match interface/class names from Spigot. In addition, encounters match the EntityType enum, and blocks/items match the Material enum from Spigot.
    **/
    function isA(category:String):Bool;
}