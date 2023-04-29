package nl.imfi_jz.minecraft_api;

import nl.imfi_jz.minecraft_api.TypeDefinitions;
import nl.imfi_jz.minecraft_api.GameObject.Item;

interface Recipe {
    //function getIngredientMatrix():Array<Dynamic>;
    /** Returns the result item for this crafting recipe. **/
    function getResult():Item;
}

/** A recipe that can be crafted just by putting the right ingredients together. No specific shape is required. **/
interface ShapelessRecipe extends Recipe {
    /** Gets all required ingredient names. **/
    function getIngredientMatrix():StandardCollection<String>;
}

/** A recipe that can be crafted where the ingredients have to be put together in a specific shape. **/
interface ShapedRecipe extends Recipe {
    /** A matrix (two dimensional array) of required ingredient names in the required shape. **/
    function getIngredientMatrix():Array<Array<String>>;
}