# 🧠 JavaScript Fundamentals – Part 02

---

## 1️⃣ DOM Manipulation

**What is it?**  
The DOM (Document Object Model) is how JavaScript interacts with the HTML structure of a web page.

**Example:**

```javascript
const heading = document.getElementById("heading");
heading.innerText = "Hello from JavaScript!";
```

**Explanation:**

- `document.getElementById()` selects an HTML element by ID
- `.innerText` sets or gets the text inside the element

---

## 2️⃣ Event Handling

**What is it?**  
Make your website interactive by responding to user actions.

**Example:**

```javascript
const button = document.getElementById("clickBtn");
button.onclick = function () {
  alert("You clicked the button!");
};
```

**Explanation:**

- `onclick` attaches a function to a click event
- `alert()` shows a popup

---

## 3️⃣ Objects

**What is it?**  
Objects group data with key-value pairs.

**Example:**

```javascript
const weapon = { name: "Sword", power: 100 };
console.log(weapon.name); // Sword
```

**Explanation:**

- `weapon.name` accesses the object’s `name` property

---

## 4️⃣ Arrays of Objects

**What is it?**  
Store multiple objects in a single array.

**Example:**

```javascript
const monsters = [
  { name: "Slime", health: 30 },
  { name: "Dragon", health: 300 },
];
console.log(monsters[1].name); // Dragon
```

**Explanation:**

- `monsters[1]` = second object; `.name` = Dragon

---

## 5️⃣ Math.random() and Math.floor()

**What is it?**  
Generate and round random numbers.

**Example:**

```javascript
const number = Math.floor(Math.random() * 10);
console.log(number); // 0 to 9
```

**Explanation:**

- `Math.random()` → 0 to 0.999...
- `Math.floor()` rounds down

---

## 6️⃣ style.display Manipulation

**What is it?**  
Show or hide HTML elements using JS.

**Example:**

```javascript
const box = document.getElementById("box");
box.style.display = "none"; // Hide element
```

**Explanation:**

- `.style.display = "none"` hides the element

---

## 7️⃣ innerText vs innerHTML

**What is it?**  
Different ways to set HTML content.

**Example:**

```javascript
textBox.innerText = "<b>Not bold</b>";
textBox.innerHTML = "<b>Bold</b>";
```

**Explanation:**

- `innerText` treats as plain text
- `innerHTML` renders the HTML

---

## 8️⃣ Template Literals

**What is it?**  
A cleaner way to insert variables in strings.

**Example:**

```javascript
const name = "Alice";
const message = `Hello, ${name}!`;
console.log(message); // Hello, Alice!
```

**Explanation:**

- `${}` lets you embed variables easily

---

## 9️⃣ Array Methods: `shift()` and `pop()`

**What is it?**  
Remove items from start/end of an array.

**Example:**

```javascript
const inventory = ["stick", "dagger", "sword"];
inventory.shift(); // removes "stick"
inventory.pop(); // removes "sword"
console.log(inventory); // ["dagger"]
```

**Explanation:**

- `shift()` → removes first item
- `pop()` → removes last item

---

## ✅ Summary Table

| Concept           | Method/Keyword     | Description                          |
| ----------------- | ------------------ | ------------------------------------ |
| DOM Selection     | `getElementById()` | Select elements from the page        |
| Text Update       | `innerText`        | Change plain text                    |
| HTML Rendering    | `innerHTML`        | Render HTML tags                     |
| Event Handling    | `onclick`          | Trigger function when clicked        |
| Random Numbers    | `Math.random()`    | Generate random decimal              |
| Rounding Down     | `Math.floor()`     | Get whole number from decimal        |
| Objects           | `{}`               | Store key-value data                 |
| Arrays            | `[]`               | Store multiple items                 |
| Template Literals | `` `Hello ${x}` `` | Easier string formatting             |
| Hide Element      | `.style.display`   | Show or hide HTML elements           |
| Array Methods     | `shift()`, `pop()` | Remove items from start/end of array |

---
