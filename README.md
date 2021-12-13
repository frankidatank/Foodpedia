# Foodpedia  🍏🍎🍐🍊🍋🍌🍉🍇🍓
## CSC690-Final Project
---

### Description

An app that allows users to input ingredients readily available in their homes, then suggests to user a list of recipes that includes those ingredients, additionally highlighting within each recipe page any additional ingredients they may need. 

Possible APIs that may help: Allrecipe API, Google search API to look for recipes in other website(?),

---

### Screenshots


---


### Whats next?



Hello Everyone,

Presenting to you is “Foodpedia”, an app to Solve The Trivial Situation of Deciding What To Cook and Eat At Home. , it is an ingredient based recipe searching app. For user , our app offers the most simple and easy to use UI , yes its not the best looking out there , but it is one of the easiest to use , users just have to provide some ingredients and our app will provide them recipe based on that ingredients ,this give them a lot of variety to choose from. currently our app doesn’t focus on multi device though it works great on any iPhone. In our app we have used swift ui , which is to share Data very easily all across the app environment and let swift ui makes the necessary changes , guided by our code. we are making a network call which is getting back a JSON from API. We then pass the selected ingredients in the url parameters. It returns the recipe back in a json format. 

The recipe result page shows data from an array of recipe and before the fetch call it doesn't have any recipe, it's just a empty array, after Fetch call we add all recipes to this recipe array which is then displayed using a controller view. 
