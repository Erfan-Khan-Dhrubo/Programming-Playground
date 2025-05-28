// ========== 1. DOM Manipulation ==========

// Selects an HTML element with the ID "heading"
const heading = document.getElementById("heading");

// Changes the text inside the selected element
heading.innerText = "Text changed using JavaScript!";

// ========== 2. Event Handling ==========

// Selects the button with ID "clickBtn"
const button = document.getElementById("clickBtn");

// Adds an event handler that runs when the button is clicked
button.onclick = function () {
  // Shows an alert popup when the button is clicked
  alert("Button clicked!");
};

// ========== 3. Objects ==========

// Creates an object with two properties: name and power
const weapon = { name: "Sword", power: 100 };

// Accesses the 'name' property using dot notation
console.log(weapon.name); // Output: "Sword"

// Accesses the 'power' property using bracket notation
console.log(weapon["power"]); // Output: 100

// ========== 4. Arrays of Objects ==========

// Creates an array containing two objects (each representing a monster)
const monsters = [
  { name: "Slime", health: 30 },
  { name: "Dragon", health: 300 },
];

// Accesses the name of the first monster in the array
console.log(monsters[0].name); // Output: "Slime"

// ========== 5. Math.random() and Math.floor() ==========

// Generates a random decimal between 0 (inclusive) and 1 (exclusive),
// multiplies it by 10 to get a number between 0–9.999...
// Math.floor() then rounds it down to the nearest whole number
const randomNum = Math.floor(Math.random() * 10);

// Displays the random number
console.log("Random number:", randomNum);

// ========== 6. style.display Manipulation ==========

// Selects an HTML element with the ID "box"
const box = document.getElementById("box");

// Hides the element by setting its display style to "none"
box.style.display = "none"; // This will make the element invisible

// ========== 7. innerText vs innerHTML ==========

// Selects an HTML element with the ID "textBox"
const textBox = document.getElementById("textBox");

// innerText sets the text as plain text (HTML tags will show as text)
textBox.innerText = "<b>This is not bold</b>";

// innerHTML parses the string as HTML, so tags like <b> are rendered
textBox.innerHTML = "<b>This is bold</b>";

// ========== 8. Template Literals ==========

// Defines a variable containing a name
const user = "Alice";

// Creates a message using template literals (backticks and ${})
const message = `Hello, ${user}! Welcome back.`;

// Displays the message in the console
console.log(message); // Output: "Hello, Alice! Welcome back."

// ========== 9. shift() and pop() ==========

// Creates an array representing an inventory
const inventory = ["stick", "dagger", "sword"];

// Removes the first item from the array
inventory.shift(); // Removes "stick"

// Removes the last item from the array
inventory.pop(); // Removes "sword"

// Shows the current state of the inventory array
console.log(inventory); // Output: ["dagger"]
