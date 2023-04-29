package nl.imfi_jz.minecraft_api.implementation;

import nl.imfi_jz.minecraft_api.TypeDefinitions;
import nl.imfi_jz.minecraft_api.GameObject.Item;
import nl.imfi_jz.minecraft_api.Recipe;

/** Class that allows construction of shapeless recipes. **/
class ConstructableShapelessRecipe implements ShapelessRecipe {
    private final ingredientNameMatrix:StandardCollection<String>;
    private final resultStack:Item;

    /**
        Creates a new shapeless recipe that requires one of each ingredient from `ingredientNameMatrix`. Upon crafting the recipe will result in `result` item, `resultAmount` times.
    **/
    public function new(ingredientNameMatrix:StandardCollection<String>, result:Item) {
        this.ingredientNameMatrix = ingredientNameMatrix;
        resultStack = result;
    }

    /** Returns the ingredient matrix given when constructing the recipe. **/
    public function getIngredientMatrix():StandardCollection<String> {
        return ingredientNameMatrix;
    }

    /** Returns the result given when constructing the recipe. **/
    public function getResult():Item {
        return resultStack;
    }
}

class ConstructableShapedRecipe implements ShapedRecipe {
    private final ingredientNameMatrix:StandardCollection<StandardCollection<String>>;
    private final resultStack:Item;

    public function new(ingredientNameMatrix:StandardCollection<StandardCollection<String>>, result:Item) {
        this.ingredientNameMatrix = ingredientNameMatrix;
        resultStack = result;
    }

    public function getIngredientMatrix():StandardCollection<StandardCollection<String>> {
        return ingredientNameMatrix;
    }

    public function getResult():Item {
        return resultStack;
    }
}