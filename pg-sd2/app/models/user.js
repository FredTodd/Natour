// Get the functions in the db.js file to use
const db = require('../services/db');
const bcrypt = require("bcryptjs");


class User {

    // Id of the user
    id;

    // Email of the user
    email;

    constructor(email) {
        this.email = email;
    }
    
// Checks to see if the submitted email address exists in the Users table
    async getIdFromEmail() {
    var sql = "SELECT id FROM Users WHERE Users.Email = ?";
    const result = await db.query(sql, [this.email]);
    // TODO LOTS OF ERROR CHECKS HERE..
    if (JSON.stringify(result) != '[]') {
        this.id = result[0].id;
        return this.id;
    }
    else {
        return false;
    }
    }


    async setUserPassword(password) {
        const pw = await bcrypt.hash(password, 10);
        var sql = "UPDATE Users SET password = ? WHERE Users.id = ?"
        const result = await db.query(sql, [pw, this.id]);
        return true;
        }
    
        
    // Add a new record to the users table    
    async addUser(password) {
        const pw = await bcrypt.hash(password, 10);
        try {
            // Generate a unique ID for the user
            const id = Math.floor(Math.random() * 1000000); // Example: Generate a random ID
            var sql = "INSERT INTO Users (ID, Email, Password) VALUES (?, ?, ?)";
            const result = await db.query(sql, [id, this.email, pw]);
            console.log(result.insertId);
            return true;
        } catch (error) {
            console.error("Error while adding user: ", error.message);
            return false;
        }
    }
        
        
    async authenticate(submitted) {
        // Get the stored, hashed password for the user
        var sql = "SELECT password FROM Users WHERE id = ?";
        const result = await db.query(sql, [this.id]);
        const match = await bcrypt.compare(submitted, result[0].password);
        if (match == true) {
            return true;
        }
        else {
            return false;
        }
    }
}

module.exports = {
    User
}