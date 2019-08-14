const inquirer = require("inquirer");
const mysql = require("mysql");

const connection = mysql.createConnection({
  host: "localhost",

  // Your port; if not 3306
  port: 3306,

  // Your username
  user: "root",

  // Your password
  password: "root",
  database: "wamazon_db"
});

connection.connect(function (err) {
  if (err) throw err;
  console.log("connected as id " + connection.threadId + "\n");
  readProducts();
  askQuestions();
});

function askQuestions() {
  inquirer.prompt([
    {
      type: "input",
      name: "start",
      message: "What would you like to buy? type the products id",
    },
    {
      type: "input",
      name: "amount",
      message: "how many?"
    }
  ])
    .then(function (answer) {
      let amount = parseInt(answer.amount);
      let ident = parseInt(answer.start);
      const query = connection.query("UPDATE products SET quantity = quantity - " + amount + " where ?", [
        {
          id: ident
        }
      ],
        function (err, res) {
          if (err) 
          
          console.log("error try again");

          askQuestions();
        })
      readProducts();
    })
}

function readProducts() {
  console.log("Selecting all products...\n");
  connection.query("SELECT * FROM products", function (err, res) {
    if (err) throw err;
    if (res.quantity >= 0){
      console.log("nope")
    }
    console.log(res);

  });
}