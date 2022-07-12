package nl.imfi_jz.minecraft_api;

interface Enchantable {
    /** Gets the level at which `enchantment` is applied to this object. 0 means it is not applied. **/
    function getEnchantmentLevel(enchantment:String):Int;
    /** Applies `enchantment` to this object at given `level`. Returns whether or not applying this enchantment has succeeded. **/
    function setEnchantmentLevel(enchantment:String, level:Int):Bool;
}