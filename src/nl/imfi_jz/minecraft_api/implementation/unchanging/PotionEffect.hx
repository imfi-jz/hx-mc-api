package nl.imfi_jz.minecraft_api.implementation.unchanging;

@:deprecated
class UnchangingPotionEffect implements PotionEffect {
    private final durationInSeconds:Float;
    private final amplification:Int;
    private final name:String;

    public inline function new(name:String, durationInSeconds:Float, amplification:Int = 0) {
        this.name = name;
        this.durationInSeconds = durationInSeconds;
        this.amplification = amplification;
    }
    
    public inline function getDurationInSeconds():Float {
        return durationInSeconds;
    }
    public inline function getAmplification():Int {
        return amplification;
    }
    public inline function getName():String {
        return name;
    }
}