package nl.imfi_jz.minecraft_api;

@:deprecated
interface Identifier {
    function isItem(name:String):Bool;
    function isBlock(name:String):Bool;
    function isPlayer(name:String):Bool;
    function isMonster(name:String):Bool;
    function isAnimal(name:String):Bool;
    //function isCreature(name:String):Bool;
}