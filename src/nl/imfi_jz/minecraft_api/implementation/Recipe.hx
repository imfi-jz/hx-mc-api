package nl.imfi_jz.minecraft_api.implementation;

import nl.imfi_jz.minecraft_api.TypeDefinitions;
import nl.imfi_jz.minecraft_api.GameObject.Item;
import nl.imfi_jz.minecraft_api.Recipe;

/** Class that allows construction of shapeless recipes. **/
class ConstructableShapelessRecipe implements ShapelessRecipe {
    private final ingredientNameMatrix:StandardCollection<String>;
    private final resultStack:StandardCollection<Item>;

    /**
        Creates a new shapeless recipe that requires one of each ingredient from `ingredientNameMatrix`. Upon crafting the recipe will result in `result` item, `resultAmount` times.
    **/
    public function new(ingredientNameMatrix:StandardCollection<String>, result:Item, resultAmount:Int = 1) {
        this.ingredientNameMatrix = ingredientNameMatrix;
        resultStack = new StandardCollection<Item>();
        for (count in 0...resultAmount){
            resultStack.push(result);
        }
    }

    /** Returns the ingredient matrix given when constructing the recipe. **/
    public function getIngredientMatrix():StandardCollection<String> {
        return ingredientNameMatrix;
    }

    /** Returns the result given when constructing the recipe. The returned value is a collection of the item containing it as many times as the given result amount at construction of the recipe. **/
    public function getResult():StandardCollection<Item> {
        return resultStack;
    }
}

class ConstructableShapedRecipe implements ShapedRecipe {
    private final ingredientNameMatrix:StandardCollection<StandardCollection<String>>;
    private final resultStack:StandardCollection<Item>;

    public function new(ingredientNameMatrix:StandardCollection<StandardCollection<String>>, result:Item, resultAmount:Int = 1) {
        this.ingredientNameMatrix = ingredientNameMatrix;
        resultStack = new StandardCollection<Item>();
        for (count in 0...resultAmount){
            resultStack.push(result);
        }
    }

    public function getIngredientMatrix():StandardCollection<StandardCollection<String>> {
        return ingredientNameMatrix;
    }

    public function getResult():StandardCollection<Item> {
        return resultStack;
    }
}