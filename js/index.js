var mysql = require('mysql');
var inquirer = require('inquirer');

inquirer.prompt([
  { type: "input",
    name: "database",
    message: "What database do you want to connect to?"}
]).then(function(data) {
    var connection = mysql.createConnection({
        host      : 'localhost',
        user      : 'root',
        password  : '',
        database  : data.database,
    });

    connection.connect();

    function selectTable(table) {
        connection.query('SELECT * FROM ' + table, function(error, results, fields) {
            if(error) throw error;
            console.log("The solution is " + results);
        });
    }

    inquirer.prompt([
        { type: "input",
          name: "table", 
          message: "What table do you want to select from?" }
    ]).then(function(data) {
          selectTable(data.table);

    });

    /* End of database connection */
});