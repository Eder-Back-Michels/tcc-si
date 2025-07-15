require ('dotenv').config({path: require('path').join(__dirname,'.env')});

const { Pool } = require ('pg');

const pool = new Pool({
    user: process.env.DB_USER,
    host: process.env.DB_HOST, 
    database: process.env.DB_NAME,
    password: process.env.DB_PASSWORD,
    port: Number(process.env.DB_PORT),
});

const query = (text, params) => pool.query(text,params);
const fs = require('fs');
const path = require('path');

const syncDatabase = async () =>{
    const sql = '';
    try {
        const sql = fs.readFileSync(
            path.join(__dirname, '../migracao/versao-1.sql'),'utf8'
        );
        await pool.query(sql);
        console.log(sql, 'Banco de dados sincronizado!');
    } catch (error){
        console.error('Erro ao sincronizar o banco de dados:',error);
    }
}

module.exports = {
    query,
    pool,
    syncDatabase,
};