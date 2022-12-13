package nl.imfi_jz.minecraft_api.implementation.adapter;

#if(IniFiction)

import nl.imfi_jz.minecraft_api.TypeDefinitions;
import nl.imfi_jz.file.ini.Key;
import nl.imfi_jz.minecraft_api.Gate.FileSystemManager;
import nl.imfi_jz.file.ini.IniFile;
import nl.imfi_jz.file.ini.Section;

/** Controls a specified ini file inside the 'data folder' similar to yml files. **/
class IniKeyValueFileAdapter extends IniFile implements KeyValueFile<String> {
    private final fileSystemManager:FileSystemManager;
    private var autoSave = false;

    public function new(fileName:String, fileSystemManager:FileSystemManager, ?subFolders:StandardCollection<String>) {
        super(fileName, fileSystemManager.getDataFolderPath(subFolders).join(fileSystemManager.getPathSeparator()));
        load();
        
        this.fileSystemManager = fileSystemManager;
    }

    @:inheritDoc
    public function getFilePath():Array<String> {
        return path.toString().split(fileSystemManager.getPathSeparator());
    }

    /** Sets whether or not this file saves automatically after setting a value or section. **/
    public function setAutoSave(autoSave:Bool) {
        this.autoSave = autoSave;
    }
    /** Returns whether or not this file automatically saves upon setting a value or section. **/
    public function isAutosaving():Bool {
        return autoSave;
    }
    /** Saves the ini file. **/
    public override function save():Bool {
        return super.save();
    }

    /** Gets the first value found with key `key`. Looks in root and sections. **/
    public function getValue(key:String):String {
        for(aKey in keys){
            if(aKey.key == key){
                return aKey.value;
            }
        }
        for(section in sections){
            for(aKey in section.keys){
                if(aKey.key == key){
                    return aKey.value;
                }
            }
        }
        return null;
    }
    /** Sets value `value` to key `key`. If the key exists, its value will be replaced by `value`. If not, the key/value pair is added to the root section. **/
    public function setValue(key:String, value:String):Bool {
        var set = false;
        // Look for root keys to replace value
        for(aKey in super.keys){
            if(aKey.key == key){
                aKey.value = Std.string(value);
                set = true;
                break;
            }
        }

        if(!set){
            // Look for section keys to replace value
            for(section in super.sections){
                for(aKey in section.keys){
                    if(aKey.key == key){
                        aKey.value = Std.string(value);
                        set = true;
                        break;
                    }
                }
                if(set){
                    break;
                }
            }
        }
        
        if(!set) {
            // Add key/value to root
            super.keys.add(new Key(key, Std.string(value)));
            set = true;
        }
        
        if(set){
            if(isAutosaving()){
                return save();
            }
            else return true;
        }
        else return false;
    }

    /** Gets all available keys in this ini file. Looks both in root and sections. **/
	public function getKeys():StandardCollection<String> {
        final keyStrings = getRootKeys();
        for(section in super.sections){
            for(aKey in section.keys){
                keyStrings.push(aKey.key);
            }
        }
        return keyStrings;
	}
    /** Gets the available keys in the root (first) section of this ini file. **/
    public function getRootKeys():StandardCollection<String> {
        final keyStrings = new StandardCollection<String>();
        for(key in super.keys){
            keyStrings.push(key.key);
        }
        return keyStrings;
    }
    /** Gets the available keys under the section name `sectionName`. **/
    public function getSectionKeys(sectionName:String):StandardCollection<String> {
        final section = super.sections.filter(s -> s.name == sectionName).first();
        final keyStrings = new StandardCollection<String>();
        for(key in section.keys){
            keyStrings.push(key.key);
        }
        return keyStrings;
    }

    /** Gets the name of all available sections in this ini file. **/
    public function getSectionNames():StandardCollection<String> {
        final sectionNames = new StandardCollection<String>();
        for(section in sections){
            sectionNames.push(section.name);
        }
        return sectionNames;
    }
    /** Adds a section to this ini file with name `sectionName` and key/value pairs `content`. **/
    public function addSection(sectionName:String, content:Map<String, String>):Bool {
        final section = new Section(sectionName, super.lineSeparator);
        for(entry in content.keyValueIterator()){
            section.keys.add(new Key(entry.key, entry.value));
        }
        super.sections.add(section);

        if(isAutosaving()){
            return save();
        }
        else return true;
    }
    /** Removes the first section found with name `sectionName`. This also removes all underlying keys. **/
    public function removeSection(sectionName:String):Bool {
        final section = super.sections.filter(s -> s.name == sectionName).first();
        final success = super.sections.remove(section);

        if(success && isAutosaving()){
            return save();
        }
        else return success;
    }
    /** Returns the content of section `sectionName` as a key/value map. **/
    public function getSectionContent(sectionName:String):Map<String, String> {
        final content = new Map<String, String>();
        for(key in super.sections.filter(s -> s.name == sectionName).first().keys){
            content.set(key.key, key.value);
        }
        return content;
    }

    /** Returns the name of the ini file. **/
    public function getName():String {
        return super.name;
    }
}
#end