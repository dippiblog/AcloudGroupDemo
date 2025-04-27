const express = require('express');
const app = express();
const port = 3000;

app.get('/', (_, res) => {
  res.send('Hello from Node.js on EKS!');
});

app.listen(port, () => {
  console.log(`Demo app running on port ${port}`);
});
