var mysql = require('mysql');
var inquirer = require('inquirer');
var Table = require('cli-table');

var connection = mysql.createConnection({
        host      : 'localhost',
        user      : 'root',
        password  : '',
        database  : 'bamazon_db',
});

connection.connect();


/* Create table so SQL response is not in RowDataPacket form */
connection.query('SELECT * FROM products ', function(error, results, fields) {
    
    /* Create a table */
    var table = new Table({
        head : ['Id', 'Product', 'Price']
    });

    var i = 0;
    while(i < results.length) {
        table.push([results[i].id, results[i].product_name, results[i].price]);
        i++;
    }
    console.log(table.toString());
    console.log("\n");
    console.log("\n");

/* Ask customer if they would like to make a purchase */
inquirer.prompt([
    { type: "input",
      name: "purchase", 
      message: "Would you like to make a purchase? (yes/no)" }

  ]).then(function(data) {

        if(data.purchase == 'yes') {
            purchase();

        } else if(data.purchase == 'no') {
            console.log("Come back any time!");

        } else {
            console.log("Sorry, I did not understand your response.");
        }

});

/* Function to handle purchase requests */
function purchase() { 

  /* Prompt user for the ID of the product they wish to purchase */
  inquirer.prompt([
    { type: "input",
      name: "product_id", 
      message: "Enter the ID of the product you would like to purchase." }

  ]).then(function(data) {

        var product = data.product_id;

        /* Prompt user for quantity of product they wish to purchase */
        connection.query('SELECT * FROM products ', function(error, results, fields) {
            console.log("\n");
            inquirer.prompt([
                { type: "input",
                  name: "stock_quantity",
                  message: "How many units of the product would you like to purchase?" }

            ]).then(function(data) {

                  var quantity = data.stock_quantity;
                  var currItem = results[product - 1];
                  var newStock = currItem.stock_quantity - quantity;
                  var purchaseAmount = quantity * currItem.price;
                  console.log(quantity);
                  console.log(currItem);
                  console.log(newStock);
                  console.log(purchaseAmount);
                  /*
                  connection.query('INSERT INTO sales SET ? ', function(error, results, fields) {
                      product_id : product,
                      quantity_purchased : stock 

                  }, function(error, results, fields) {
                        console.log("Insert successful!");
                  });

            }); */
        });

    });

  });

} /********* End of purchase() **************/

}); /********* End of products connection.query() *********/

