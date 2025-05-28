# 🧠 JavaScript Fundamentals – Part 01

---

## 🔁 1. Loops – Repeating Tasks

**What is it?**  
A loop allows you to **repeat a block of code** multiple times.

**Example:**

```javascript
for (let i = 1; i <= 5; i++) {
  console.log("Hello, number " + i);
}
```

**What it does:**

- Starts from 1 and runs until 5
- Prints:

```
Hello, number 1
Hello, number 2
...
Hello, number 5
```

---

## 🧠 2. Conditionals – Making Decisions

**What is it?**  
Conditionals let you **run different code depending on a condition**.

**Example:**

```javascript
let age = 18;

if (age >= 18) {
  console.log("You are an adult.");
} else {
  console.log("You are a minor.");
}
```

**What it does:**

- Checks if age is 18 or more
- If true → prints: "You are an adult."
- If false → prints: "You are a minor."

---

## 📦 3. Arrays – Storing Lists

**What is it?**  
An array stores **multiple values in one variable**.

**Example:**

```javascript
let fruits = ["apple", "banana", "mango"];

console.log(fruits[0]); // Access first item: apple
console.log(fruits.length); // Get total number of items: 3
```

---

## 🧊 4. Array Methods: `push()` and `unshift()`

**`push()` – Adds an item to the end of the array**

```javascript
let colors = ["red", "blue"];
colors.push("green");
console.log(colors); // ["red", "blue", "green"]
```

**`unshift()` – Adds an item to the start of the array**

```javascript
colors.unshift("yellow");
console.log(colors); // ["yellow", "red", "blue", "green"]
```

---

## 🧩 5. Functions – Reusable Code Blocks

**What is it?**  
A function is a block of code you can **run again and again**.

**Example:**

```javascript
function greet(name) {
  console.log("Hello, " + name + "!");
}

greet("Alice"); // Hello, Alice!
greet("Bob"); // Hello, Bob!
```

**What it does:**

- You pass a name into the function
- It prints a custom message

---

## 🔤 6. String Methods: `repeat()`

**What is it?**  
String methods let you **manipulate text**.

**Example:**

```javascript
let word = "Hi";
let repeatWord = word.repeat(3);
console.log(repeatWord); // HiHiHi
```

**What it does:**

- "Hi" is repeated 3 times to create "HiHiHi"

---

## ✅ Summary Table

| Concept       | What It Does           | Example                            |
| ------------- | ---------------------- | ---------------------------------- |
| `for` loop    | Repeats code           | `for (let i = 1; i <= 5; i++)`     |
| `if` / `else` | Makes decisions        | `if (age >= 18)`                   |
| Arrays        | Store lists of values  | `let fruits = ["apple", "banana"]` |
| `push()`      | Add to end of array    | `colors.push("green")`             |
| `unshift()`   | Add to beginning       | `colors.unshift("yellow")`         |
| Functions     | Reuse code with inputs | `function greet(name) { ... }`     |
| `repeat()`    | Repeat strings         | `"Hi".repeat(3)`                   |

---
