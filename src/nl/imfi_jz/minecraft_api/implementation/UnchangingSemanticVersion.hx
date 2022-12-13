package nl.imfi_jz.minecraft_api.implementation;

class UnchangingSemanticVersion implements SemanticVersion {

    private final major:Int;
    private final minor:Int;
    private final patch:Int;
    private final preRelease:String;
    private final build:String;

    public function new(major, minor, patch, ?preRelease, ?build) {
        this.major = major;
        this.minor = minor;
        this.patch = patch;
        this.preRelease = preRelease;
        this.build = build;
    }
    
    public function getMajor():Int {
        return major < 0 ? 0 : major;
    }
    
    public function getMinor():Int {
        return minor < 0 ? 0 : minor;
    }
    
    public function getPatch():Int {
        return patch < 0 ? 0 : patch;
    }
    
    public function getPreRelease():String {
        return preRelease == null ? '' : preRelease;
    }
    
    public function getBuild():String {
        return build == null ? '' : build;
    }

    public function toString():String {
        final preRelease = getPreRelease();
        var suffix = getBuild();
        suffix = suffix.length > 0 ? '+' + suffix : '';
        
        return getMajor() + '.' + getMinor() + '.' + getPatch()
            + (preRelease.length > 0
            ? '-' + preRelease + suffix
            : suffix);
    }

    public function isNewerThan(other:SemanticVersion):Bool {
        final maj = getMajor();
        final min = getMinor();
        final pat = getPatch();
        final pre = getPreRelease();
        final oMaj = other.getMajor();
        final oMin = other.getMinor();
        final oPat = other.getPatch();
        final oPre = other.getPreRelease();

        if(maj > oMaj){
            return true;
        }
        else if(min > oMin){
            return true;
        }
        else if(pat > oPat){
            return true;
        }
        else if(maj == oMaj && min == oMin && pat == oPat){
            if(pre.length < 1 && oPre.length > 0){
                return true;
            }
            else if(pre.length > 0 && oPre.length > 0){
                return pre.length > oPre.length;
            }
            else return false;
        }
        else return false;
    }

    public inline function equals(other:SemanticVersion):Bool {
        return getMajor() == other.getMajor()
            && getMinor() == other.getMinor()
            && getPatch() == other.getPatch()
            && getPreRelease() == other.getPreRelease();
    }
}