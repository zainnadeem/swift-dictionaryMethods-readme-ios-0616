# Dictionary Methods

![Drawing](http://d.gr-assets.com/authors/1341965730p5/16667.jpg)

> The most exciting phrase to hear in science, the one that heralds the most discoveries, is not "Eureka!" (I found it!) but 'That's funny...'

## Learning Objectives - The student should be able to...

* Update values within a dictionary using subscript syntax and `updateValue(_:forKey:)`.
* Understand that by accessing something within a dictionary using a key, you are getting back a value, but it's an optional value which requires you to unwrap it.
* Access a value with a given key, update that value and reflect that update (change) back to the dictionary.
* Remove a key/value pair by assigning the value to `nil`.
* Remove a key/value pair using the method `removeValueForKey()`.
* Explain that by using `.count`, you will retrieve the total number of key/value pairs within the dictionary.
* Explain that `.isEmpty` is a way to see if in fact the dictionary is empty, in that it returns a `Bool`.
* What `.keys` and `.values` does and how you can iterate over what this returns.

## Working With Dictionaries

So far, you've learned about a few basic operations you can perform on or with dictionaries. You learned how to create a dictionary, how to add items to a dictionary, how to remove items from a dictionary, and how to iterate over it. In this lesson, you'll learn about a few of the _methods_ you can use to work with dictionaries even more effectively.

The playground file included in this repo has some examples to look over as you work through this lesson. They will demonstrate the use of several different methods available to dictionaries. Once again, you are working with a dictionary to store information about movie franchises. An initial dictionary with this information, `movies`, has been created for you in the playground.

### Updating Dictionaries

You've already learned one way to update a dictionary: By setting a key to a specific value. In the included playground, _The Godfather_ films have not yet been added to the `movies` dictionary. You could add them simply like this:

```swift
movies["The Godfather"] = godfatherFilms
```

Swift also provides another method for adding items to a dictionary: the `updateValue(_:forKey:)` method. You can call this method to add a new key and value to a dictionary:

```swift
movies.updateValue(godfatherFilms, forKey: "The Godfather")
```

What's the difference between this method and just assigning a value to a new key? `updateValue(_:forKey:)` can also be used to update an _existing_ key:

```swift
movies.updateValue(fastAndFuriousFilms, forKey: "The Fast and the Furious")
```

Here, the key "The Fast and the Furious" already exists, and you're assigning it a value.

On the surface, this still doesn't look much different than assigning a value to a key. So what's the difference?

The main difference is that `updateValue(_:forKey:)` has a return value that tells you whether a key was added or updated. The return type is an optional, so it can be `nil`. If a new key/value pair was _added_, the return value is `nil`. If an existing key/value pair was _updated_, the return value of `updateValue(_:forKey:)` is the key's _new_ value, wrapped in an `Optional`.

Take a look at this code:

```swift
let result1 = movies.updateValue(godfatherFilms, forKey: "The Godfather")
let result2 = movies.updateValue(fastAndFuriousFilms, forKey: "The Fast and the Furious")
print(result1)
print(result2)
```

Can you guess what is printed to the console? Think about it: `updateValue(_:forKey:)` returns `nil` if a new key/value pair is added, and the new value if a key is updated instead. "The Godfather" did not exist in the dictionary before, but "The Fast and the Furious" did. What appears in your console?

You should see this:

```
nil
Optional(["The Fast and the Furious", "2 Fast 2 Furious", "Turbo-Charged Prelud", "Tokyo Drift", "Fast & Furious", "Los Bandoleros", "Fast Five", "Fast & Furious 6", "Furious 7", "Fast 8"])
```

Does it make sense why the first line is `nil`, and the second is an optional array of strings?

Now that you've added "The Godfather" key, you should be able to retrieve the value. What gets printed to the console when you run this code?

```swift
let films = movies["The Godfather"]
print(films)
```

Remember: "The Godfather" now exists in the `movies` dictionary, so you should expect to get a value back. But accessing a key always returns an `Optional`, even if the key exists (do you remember why that's the case?), so you should see this in your console:

```
Optional(["The Godfather", "The Godfather Part II", "The Godfather Part III"])
```

How do you get rid of that "Optional" gobbledygook? You can _unwrap_ the value. Do you remember how to do that? Unwrapping the optional value allows you to access the "raw" value inside the `Optional`. This code will just print the array without the "Optional(...)" bit around it:

```swift
if let godfatherMovies = movies["The Godfather"] {
    print(godfatherMovies)
}
// prints "["The Godfather", "The Godfather Part II", "The Godfather Part III"]"
```

Most of the time, you'll probably just assign a value directly to a key, using subscript notation. Sometimes, though, it's important to know whether a key was added or modified. In that case, it is helpful to use `updateValue(_:forKey:)` instead.

### Modifying Values

Sometimes a value is _mutable_, which means that you can alter it in some way. For example, you may want to append an item to an `Array` value. Imagine we just got word from the studio that there are going to be two more _Fast and Furious_ movies: _Faster! 9_ and _THE FASTEST 10_. Since the values of the `movies` dictionary are all arrays of strings, you have probably guessed that you can use the `append()` method of `Array` to add items to those values.

But how? Would this work?

```swift
movies["The Fast and the Furious"].append("Faster! 9")
movies["The Fast and the Furious"].append("THE FASTEST 10")
```

Try it! Did it work?

You probably noticed the obvious problem: `movies["The Fast and the Furious"]` does not return an array (a `[String]`). It returns an _optional_ array (a `[String]?`). `Optional` types do not have an `append()` method.

So what to do? You can instead unwrap the optional return value, and add items to it:

```swift
if var films = movies["The Fast and the Furious"] {
    films.append("Faster! 9")
    films.append("THE FASTEST 10")
}
```

That worked beautifully, didn't it? Print out the `movies` dictionary to the console to see the results of your fine work.

Err...wait. Something's wrong. The dictionary _hasn't_ been updated to include these two hot new titles. Why not?

When you unwrap an optional, you get a _copy_ of the array back. When you call `append()` on this _copy_, it doesn't affect the _original_ array stored in the dictionary. In order to update that array, you're going to have to get a bit more clever.

Try this:

```swift
if var films = movies["The Fast and the Furious"] {
    films.append("Faster! 9")
    films.append("THE FASTEST 10")

    movies["The Fast and the Furious"] = films
}
```

What's happening here? Like before, you unwrapped the optional value of `movies["The Fast and the Furious"]` into the `films` variable. Then you added "Faster! 9" and "THE FASTEST 10" to the `films` variable. Finally, you assigned `films` to the key "The Fast and the Furious" in the `movies` dictionary. That's the crucial step in updating the value of "The Fast and the Furious" in the dictionary.

You can confirm that you added those two titles by printing out the dictionary:

```swift
if let fastMovies = movies["The Fast and the Furious"] {
    for (index, film) in fastMovies.enumerate() {
        print("\(index + 1). \(film)")
    }
}

// prints:
// 1. The Fast and the Furious
// 2. 2 Fast 2 Furious
// 3. Turbo-Charged Prelud
// 4. Tokyo Drift
// 5. Fast & Furious
// 6. Los Bandoleros
// 7. Fast Five
// 8. Fast & Furious 6
// 9. Furious 7
// 10. Fast 8
// 11. Faster! 9
// 12. THE FASTEST 10
```

### Deleting Key/Value Pairs

Sometimes you want to remove an existing key/value pair from a dictionary. Imagine you want to remove all information you have about the _Fast and Furious_ franchise. Deleting a key/value pair from a dictionary is pretty easy: You just assign `nil` to the key.

```swift
movies["The Fast and the Furious"] = nil
```

You can confirm that the key has been deleting by trying to retrieve the value for the key and unwrapping it:

```swift
if let fast3rFilms = movies["The Fast and the Furious"] {
    print("\(fast3rFilms)")
} else {
    print("YAY! no more Fast & Furious movies!")
}
// prints "YAY! no more Fast & Furious movies!"
```

Pretty easy, right?

Remember the `updateValue(_:forKey:)` method, though? There is a corresponding `Dictionary` method called `removeValueForKey()`. You can also remove a key using that method:

```swift
movies.removeValueForKey("The Fast and the Furious")
```

`removeValueForKey()` serves a similar purpose as `updateValue(_:forKey:)`. If the key _exists_ in the dictionary, `removeValueForKey()` deletes it, and returns its value wrapped in an `Optional`. If the key does _not_ exist in the dictionary, then `removeValueForKey()` returns `nil`. Therefore, this method serves two purposes: It removes a key from the dictionary _and_ lets you know whether it existed in the dictionary or not.

In most cases, it's easier to remove a key simply by assigning `nil` to it, and you'll use that method much more often. But `removeValueForKey()` is sometimes useful when you want to know if a key existed or not.

### Counting Items

What if you want to know how many items are in a dictionary? Imagine you have this dictionary:

```swift
let planetsAndTheirMoons = [
    "Mercury": 0,
    "Venus": 0,
    "Earth": 1,
    "Mars": 2,
    "Jupiter": 50,
    "Saturn": 53,
    "Uranus": 27,
    "Neptune": 13
]
```

![Notice that Pluto isn't listed here](https://s3.amazonaws.com/learn-verified/neil-degrasse-tyson-pluto.jpg)

You want to get a count of how many items are in the dictionary. How would you do that?

You could iterate over the dictionary and keep a count of how many items you see:

```swift
var planetCount = 0
for (planet, numberOfMoons) in planetsAndTheirMoons {
    planetCount += 1
}
print(planetCount)
// prints 8
```

But this will quickly get unwieldy. Luckily, there's an easier way in Swift: Dictionaries have a `count` property.

```swift
let planetCount2 = planetsAndTheirMoons.count
print(planetCount2)
// prints 8
```

Yep. Just like `Array`s, that's all there is to it.

`Dictionary` also provides an `isEmpty` property to check if a dictionary is empty or not (an empty dictionary has 0 keys):

```swift
if planetsAndTheirMoons.isEmpty {
    print("planetsAndTheirMoons is empty")
} else {
    print("planetsAndTheirMoons has \(planetsAndTheirMoons.count) items")
}
// prints "planetsAndTheirMoons has 8 items"
```

`isEmpty` returns `true` if the dictionary contains 0 items, and `false` if it contains at least one. Here you can see how it works on a dictionary that's actually empty:

```swift
var emptyDictionary = [String: String]()
if emptyDictionary.isEmpty {
    print("Ah hah! It's empty.")
} else {
    print("There's something here...")
}
// prints "Ah hah! It's empty."
```

### Retrieving All Keys

Right now, the `planetsAndTheirMoons` dictionary contains a mapping of planet names to the number of moons orbiting that planet. What if you want to get just the names of the planets?

Dictionaries also have a `keys` property that will return _only_ the keys contained in the dictionary. You can easily create an array from this set of keys:

```swift
let planetNames = Array(planetsAndTheirMoons.keys)
```

Or, if you want to print out the keys one per line, you could easily iterate over them:

```swift
for planet in planetsAndTheirMoons.keys {
    print(planet)
}
// prints:
// Jupiter
// Venus
// Earth
// Mercury
// Mars
// Uranus
// Neptune
// Saturn
```

One important thing to note: The `keys` property will not necessarily return the keys in the same order you defined or added them to the dictionary. Remember: Dictionaries are _unordered!_

### Retrieving All Values

As you can probably imagine, dictionaries also come with a `values` property for returning all the values in the dictionary. In this case, you could use it to get back just the number of moons:

```swift
let allTheMoons = Array(planetsAndTheirMoons.values)
```

You can iterate over these values, too:

```swift
for numberOfMoons in planetsAndTheirMoons.values {
    print(numberOfMoons)
}
// prints:
// 50
// 0
// 1
// 0
// 2
// 27
// 13
// 53
```

Just like with keys, values are not returned in any particular order. (Dictionaries are _unordered_—remember that!)

That covers the fundamental operations you can perform on dictionaries. As you work with Swift, you'll encounter many more, but these basic operations are the ones you'll see and use the most.

<a href='https://learn.co/lessons/DictionaryMethods' data-visibility='hidden'>View this lesson on Learn.co</a>
