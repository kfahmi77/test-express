const express = require('express');
const app = express();


// Gunakan PORT dari environment (Coolify menyediakannya) atau default 3000
const PORT = process.env.PORT || 6969;


app.use(express.json());


app.get('/', (req, res) => {
res.send('Hello from Coolify + Express! 🚀');
});


// Endpoint healthcheck untuk container/platform
app.get('/health', (req, res) => {
res.status(200).json({ status: 'ok' });
});


app.listen(PORT, '0.0.0.0', () => {
console.log(`Server listening on http://0.0.0.0:${PORT}`);
});