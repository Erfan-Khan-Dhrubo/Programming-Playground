// Loop: prints "Hello, number 1" to "Hello, number 5"
for (let i = 1; i <= 5; i++) {
  console.log("Hello, number " + i);
}

// Conditional: checks if age is 18 or older
let age = 18;

if (age >= 18) {
  console.log("You are an adult."); // true case
} else {
  console.log("You are a minor."); // false case
}

// Array: stores a list of fruits
let fruits = ["apple", "banana", "mango"];

console.log(fruits[0]); // prints first item: apple
console.log(fruits.length); // prints total number of items: 3

// Array methods: push and unshift
let colors = ["red", "blue"];

// push() adds item to the END of the array
colors.push("green");
console.log(colors); // ["red", "blue", "green"]

// unshift() adds item to the START of the array
colors.unshift("yellow");
console.log(colors); // ["yellow", "red", "blue", "green"]

// Function: greets the person by name
function greet(name) {
  console.log("Hello, " + name + "!");
}

greet("Alice"); // prints: Hello, Alice!
greet("Bob"); // prints: Hello, Bob!

// String method: repeats a word 3 times
let word = "Hi";
let repeatWord = word.repeat(3);

console.log(repeatWord); // prints: HiHiHi
