const mysql = require("mysql2/promise");

// pool = connection pool
const pool = mysql.createPool({
  host: "localhost",
  port: 3306,
  user: "kwebuser",
  password: "kwebpw",
  database: "kwebdb2",
  multipleStatements: true,
});

const runQuery = async (pstmt, data) => {
  const conn = await pool.getConnection();
  try {
    const sql = conn.format(pstmt, data);
    const [result] = await conn.query(sql);
    return result;
  } finally {
    conn.release();
  }
};

module.exports = { runQuery };