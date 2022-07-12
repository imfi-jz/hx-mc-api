package nl.imfi_jz.minecraft_api.implementation.unchanging;

import nl.imfi_jz.minecraft_api.TypeDefinitions;

/** Class that allows construction of a point in three dimensional space. The values (coordinates) will not changes once constructed. **/
class UnchangingThreeDimensional implements ThreeDimensional {
    private final x:Float;
    private final y:Float;
    private final z:Float;

    private var xyzAverage(null, null):Null<Float> = null;
    private var volume(null, null):Null<Float> = null;

    @:overload
    public inline function new(x:Float, y:Float, z:Float) {
        this.x = x;
        this.y = y;
        this.z = z;
    }
    @:overload
    public inline function new(threeDimensional:ThreeDimensional) {
        this.x = threeDimensional.getX();
        this.y = threeDimensional.getY();
        this.z = threeDimensional.getZ();
    }

    public inline function getX():Float {
        return x;
    }
    public inline function getY():Float {
        return y;
    }
    public inline function getZ():Float {
        return z;
    }

    /** Cached **/
    public function getAverage():Float {
        if(xyzAverage == null){
            var pX = x < 0 ? -x : x;
            var pY = y < 0 ? -y : y;
            var pZ = z < 0 ? -z : z;
            xyzAverage = (pX + pY + pZ) / 3;
        }
        return xyzAverage;
    }
    /** Cached **/
    public function getVolume():Float {
        if(volume == null){
            var pX = x < 0 ? -x : x;
            var pY = y < 0 ? -y : y;
            var pZ = z < 0 ? -z : z;
            volume = pX * pY * pZ;
        }
        return volume;
    }

    /** Gets the difference between two points. Useful to measure distance without using square root. **/
    public function differenceFromOther(other:ThreeDimensional):UnchangingThreeDimensional {
        return new UnchangingThreeDimensional(
            difference(getX(), other.getX()),
            difference(getY(), other.getY()),
            difference(getZ(), other.getZ())
        );
    }
    public static function difference(a:Float, b:Float):Float {
        if(a < 0){
            if(b < 0){
                a = -a;
                b = -b;
            }
            else {
                return (-a) + b;
            }
        }
        else if(b < 0){
            return (-b) + a;
        }
        
        return a > b ? a - b : b - a;
    }

    /** Determines whether `other` is within `range` of this point. **/
    public function isWithin(range:Float = 1, other:ThreeDimensional):Bool {
        var dX = difference(getX(), other.getX());
        var dY = difference(getY(), other.getY());
        var dZ = difference(getZ(), other.getZ());

        if(dX > range || dY > range || dZ > range)
            return false;
        else return true;
    }
    
    @:op(A + B) public function withAddedValues(values:StandardCollection<Float>):UnchangingThreeDimensional {
        return new UnchangingThreeDimensional(
            this.getX() + (values.length > 0 ? values[0] : 0),
            this.getY() + (values.length > 1 ? values[1] : 0),
            this.getZ() + (values.length > 2 ? values[2] : 0)
        );
    }
    @:op(A + B) public function withAdded3D(other:ThreeDimensional):UnchangingThreeDimensional {
        return new UnchangingThreeDimensional(
            this.getX() + other.getX(),
            this.getY() + other.getY(),
            this.getZ() + other.getZ()
        );
    }
    @:op(A - B) public function withSubtracted3D(other:ThreeDimensional):UnchangingThreeDimensional {
        return new UnchangingThreeDimensional(
            this.getX() - other.getX(),
            this.getY() - other.getY(),
            this.getZ() - other.getZ()
        );
    }

    public function toString():String {
        return "3D{" + [getX(), getY(), getZ()].join(", ") + "}";
    }
}