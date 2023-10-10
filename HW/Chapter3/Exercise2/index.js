const express = require("express");
const port = 3000;

const app = express();

app.get("/board/page/:page", (req, res) => {
  const pageNumber = req.params.page;
  res.send(`This is page #${pageNumber}`);
});

app.listen(port, () => console.log(`Server listening on port ${port}!`));
