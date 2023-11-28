const util = require("util");
const crypto = require("crypto");
//pbkdf의 param : 1.pw(암호화 할 문자열) 2.salt 3.iter 4.key_len 5.algorithm
const pbkdf2 = util.promisify(crypto.pbkdf2);
const encrypt = async (text) => {
  const ALGO = "sha512";
  const KEY_LEN = 64;
  const digest = await pbkdf2(text, "", 1, KEY_LEN, ALGO);
  console.log(`${text} | ${digest.toString("base64")}`);
};
(async () => {
  await encrypt('samplepasswordsamplepasswordsamplepasswordsamplepasswordsample');
  await encrypt('samplepasswordsamplepastwordsamplepasswordsamplepasswordsample');
  })();
  
