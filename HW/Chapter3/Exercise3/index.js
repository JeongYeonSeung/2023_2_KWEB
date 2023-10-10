const express = require("express");
const port = 3000;

const app = express();

const factorial = (number) => {
  let res = 1;
  for(let i = number; i > 0; i--) {
    res *= i;
  }
  return res;
}

app.get('/factorial', (req, res) => {
  const { number } = req.query;
  if (!number) res.status(400).send("쿼리가 없음!");
  res.redirect(`/factorial/${number}`);
});

app.get('/factorial/:number', (req, res) => {
  const { number } = req.params;
  const parsedNumber = parseInt(number, 10);
  res.send(`factorial of ${parsedNumber} = ${factorial(parsedNumber)}`);
});

app.listen(port, () => console.log(`Server listening on port ${port}!`));