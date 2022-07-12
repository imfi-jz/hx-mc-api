package nl.imfi_jz.minecraft_api;

/** Effects that can be applied to `PotionEffectable`s. **/
interface PotionEffect extends Named {
    function getDurationInSeconds():Float;
    /** The strenght of this potion effect. **/
    function getAmplification():Int;
}

/** Something that a `PotionEffect` can be applied to. **/
interface PotionEffectable {
    //function applyPotionEffect(potionEffect:PotionEffect):Bool;
    // todo perhaps change arguments to PotionEffect
    /**
        Applies the potion effect `effectName` to this object. Overwrites existing effect with `effectName`.

        Returns the applied effect, or null if it was not able to apply.
     **/
    @:deprecated('API might change')
    function setPotionEffect(effectName:String, durationInSeconds:Float, amplification:Int):PotionEffect;
    /** If this object has `effectName` active, it will be returned as `PotionEffect`. **/
    function getPotionEffect(effectName:String):PotionEffect;
    // todo maybe add count or iterable
}