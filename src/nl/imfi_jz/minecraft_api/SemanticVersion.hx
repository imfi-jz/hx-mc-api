package nl.imfi_jz.minecraft_api;

/** A specific version in semantic versioning 2.0.0 format. Visit https://semver.org/ for details. **/
interface SemanticVersion {
    /**
        MAJOR version when you make incompatible API changes.

        Major version X (X.y.z | X > 0) MUST be incremented if any backwards incompatible changes are introduced to the public API. It MAY also include minor and patch level changes. Patch and minor versions MUST be reset to 0 when major version is incremented.
    **/
    public function getMajor():Int;
    /**
        MINOR version when you add functionality in a backwards compatible manner.
        
        Minor version Y (x.Y.z | x > 0) MUST be incremented if new, backwards compatible functionality is introduced to the public API. It MUST be incremented if any public API functionality is marked as deprecated. It MAY be incremented if substantial new functionality or improvements are introduced within the private code. It MAY include patch level changes. Patch version MUST be reset to 0 when minor version is incremented.
    **/
    public function getMinor():Int;
    /**
        PATCH version when you make backwards compatible bug fixes.
    
        Patch version Z (x.y.Z | x > 0) MUST be incremented if only backwards compatible bug fixes are introduced. A bug fix is defined as an internal change that fixes incorrect behavior.
    **/
    public function getPatch():Int;
    
    /**
        A pre-release version MAY be denoted by appending a hyphen and a series of dot separated identifiers immediately following the patch version. Identifiers MUST comprise only ASCII alphanumerics and hyphens [0-9A-Za-z-]. Identifiers MUST NOT be empty. Numeric identifiers MUST NOT include leading zeroes. Pre-release versions have a lower precedence than the associated normal version. A pre-release version indicates that the version is unstable and might not satisfy the intended compatibility requirements as denoted by its associated normal version. Examples: 1.0.0-alpha, 1.0.0-alpha.1, 1.0.0-0.3.7, 1.0.0-x.7.z.92, 1.0.0-x-y-z.--.
    **/
    public function getPreRelease():String;
    /**
        Build metadata MAY be denoted by appending a plus sign and a series of dot separated identifiers immediately following the patch or pre-release version. Identifiers MUST comprise only ASCII alphanumerics and hyphens [0-9A-Za-z-]. Identifiers MUST NOT be empty. Build metadata MUST be ignored when determining version precedence. Thus two versions that differ only in the build metadata, have the same precedence. Examples: 1.0.0-alpha+001, 1.0.0+20130313144700, 1.0.0-beta+exp.sha.5114f85, 1.0.0+21AF26D3----117B344092BD.
    **/
    public function getBuild():String;

    /**
        Produces a String value that represents this version.
        
        Examples: 1.0.0, 1.2.0, 1.0.0-alpha, 1.0.0-0.3.7+001.
    **/
    public function toString():String;

    /** Returns whether this version is considered newer than the `other` version. **/
    public function isNewerThan(other:SemanticVersion):Bool;

    /** Returns whether this version is considered equal to the `other` version. **/
    public function equals(other:SemanticVersion):Bool;
}