const express = require('express');
const { syncDatabase } = require('./config/database.js');
const path = require('path');
const { error } = require('console');
const app = express();
const PORT = 3000;

app.use(express.json());

syncDatabase().then(() => {
    app.listen(PORT, '0.0.0.0', () => {
        console.log(`Servidor rodando em http://localhost:${PORT}`);
    });
}).catch((error) => {
    console.error('Erro ao iniciar o servidor:', error);
})