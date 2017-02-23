var mysql = require('mysql');
var inquirer = require('inquirer');

var connection = mysql.createConnection({
        host      : 'localhost',
        user      : 'root',
        password  : '',
        database  : 'bamazon_db',
});

connection.connect();

function selectTable(table) {
  connection.query('SELECT * FROM ' + table, function(error, results, fields) {
      if(error) throw error;
      console.log(results);
  });
}

connection.query('SELECT * FROM products ', function(error, results, fields) {
  console.log(results);
  console.log("\n");
  inquirer.prompt([
    { type: "input",
      name: "product_id", 
      message: "Enter the ID of the product you would like to purchase." }

  ]).then(function(data) {
        console.log(data.product_id);
  });

  inquirer.prompt([
    { type: "input",
      name: "stock_quantity", 
      message: "How many units of the product which you like to purchase?" }

  ]).then(function(data) {
        console.log(data.product_id);
  });

      
});

/* End of database connection */
