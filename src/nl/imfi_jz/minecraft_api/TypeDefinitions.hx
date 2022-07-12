package nl.imfi_jz.minecraft_api;

//final HAXE_VERSION:Float = haxe.macro.Context.definedValue("haxe_ver");

typedef StandardCollection<T> = Array<T>;
typedef ReadOnlyArray<T> = haxe.ds.ReadOnlyArray<T>;

/*
@:forward(iterator)
abstract ReadOnlyArray<T>(Array<T>) from Array<T> {
    @:arrayAccess
    private inline function get(key:Int) {
        return this[key];
    }
}
*/