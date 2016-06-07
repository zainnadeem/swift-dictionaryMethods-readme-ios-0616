let toyStoryFilms = [
    "Toy Story",
    "Toy Story 2",
    "Buzz Lightyear of Star Command: The Adventure Begins",
    "Toy Story 3",
    "Toy Story 4"
]

let starWarsFilms = [
    "Star Wars",
    "The Empire Strikes Back",
    "Star Wars: Episode VI",
    "Star Wars: Episode I",
    "Star Wars: Episode II",
    "Star Wars: Episode III",
    "Star Wars: The Clone Wars",
    "Star Wars: The Force Awakens",
    "Star Wars: Episode VIII",
    "Star Wars: Episode IX"
]

let fastAndFuriousFilms = [
    "The Fast and the Furious",
    "2 Fast 2 Furious",
    "Turbo-Charged Prelud",
    "Tokyo Drift",
    "Fast & Furious",
    "Los Bandoleros",
    "Fast Five",
    "Fast & Furious 6",
    "Furious 7",
    "Fast 8"
]

var movies = [
    "Toy Story": toyStoryFilms,
    "Star Wars": starWarsFilms,
    "The Fast and the Furious": fastAndFuriousFilms
]

let godfatherFilms = [
    "The Godfather",
    "The Godfather Part II",
    "The Godfather Part III"
]


// this will return nil if the key does not exist in the dictionary and then add the provided key, value pair to the dictionary in which we are calling the method on.
// if the key ALREADY exists, the value for that provided key will change (or update) to the provided value in this method.

movies.updateValue(godfatherFilms, forKey: "The Godfather")

let films = movies["The Godfather"]
print(films)

// CHALLENGE the student at this point. before you show them what this would print to the console... have them think it through and SEE if they know what prints.


// prints "Optional(["The Godfather", "The Godfather Part II", "The Godfather Part III"])"



// Maybe include gif here


// We forgot to unwrap it!

if let godfatherMovies = movies["The Godfather"] {
    print(godfatherMovies)
}
// prints "["The Godfather", "The Godfather Part II", "The Godfather Part III"]"




// Show them how they normally will be updating their Dictionary as follows

// What if we wanted to update the value (which is an array) for key "The Fast and the Furious"
// We just saw one way we can do this using the method updateValue(_:forKey:), but we can also do so using subscript syntax

// We were just given word that there are set to be 2 more Fast and furious methods that we need to add to this array. Lets do this:


// Here... we are retrieving the value through subscript syntax which we're familiar with.

// There's a lot going on in the code below. I like for them to see this though and have it broken down into a paragraph word by word describing every line so that they they can see the proper way to explain what is going on here.

if var films = movies["The Fast and the Furious"] {
    films.append("Faster! 9")
    films.append("THE FASTEST 10")
    
    movies["The Fast and the Furious"] = films
}

if let fastMovies = movies["The Fast and the Furious"] {
    
    for (index, film) in fastMovies.enumerate() {
        print("\(index + 1). \(film)")
    }
    
}

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






// What now... if we want to get rid of this entire Key, Value pair that exists for these fast and furious movies.... we can do so by setting the Value to nil with the given Key.

movies["The Fast and the Furious"] = nil

if let fast3rFilms = movies["The Fast and the Furious"] {
    print("\(fast3rFilms)")
} else {
    print("YAY! no more Fast & Furious movies!")
}

// prints "YAY! no more Fast & Furious movies!"




// or we can do this

movies.removeValueForKey("The Fast and the Furious")



// I think we can move onto some other example now that doesn't have as much data going on like the movies above:

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

// What if we wanted to get a count of all of our Keys (all the planets in this case). We could iterate over the entire dictionary and produce a counter variable which goes up by 1 each time in the for loop... but this seems crazy, there must be a better way.

// Similar to Arrays, we also have the ability to use count with a dictionary... count gives back to us a value of type Int which represents the number of entries in the dictionary.

planetsAndTheirMoons.count  // 8



// What now... if we weren't concerned with the number of moons associated with each planet but instead just concerened with the planet names. There's a method for that! I'm a little worried about them seeing Array like this..... but it is useful for them to know how to do this. I say we show them.

let planetsOnly = Array(planetsAndTheirMoons.keys)


// maybe we show them this instead - notice the order!! Dictionaries are unordered.

for planet in planetsAndTheirMoons.keys {
    print(planet)
}

// Jupiter
// Venus
// Earth
// Mercury
// Mars
// Uranus
// Neptune
// Saturn



// Or.. just the values


let allTheMoons = Array(planetsAndTheirMoons.values)



var emptyDictionary = [String: String]()

if emptyDictionary.isEmpty {
    print("Ah hah! It's empty.")
} else {
    print("There's something here...")
}

// prints "Ah hah! It's empty."
















