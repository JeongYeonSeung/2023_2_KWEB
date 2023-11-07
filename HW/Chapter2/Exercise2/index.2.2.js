const fs = require("fs");
const path = require("path");
const util = require("util");

const readdir = util.promisify(fs.readdir);
const stat = util.promisify(fs.stat);

/** 현재 작업 디렉토리를 스크립트 파일의 디렉토리로 변경 */
process.chdir(__dirname);
const testPath = "./test";

/** path를 받아서 search */
const searchDirectory = async (directory) => {
  const files = await readdir(directory);
  files.forEach(async (file) => {
    const filePath = path.join(directory, file);
    const stat = await stat(filePath);
    /** 만약 dir이면 차례5f대로 search. 이전 dir의 search가 끝날 때 까지 기다리기 */
    if (stat.isDirectory()) await searchDirectory(filePath);
    /** path의 확장자가 .js 인 경우 출력 */ else if (
      path.extname(filePath) === ".js"
    )
      console.log(filePath);
  });
};

(async () => {
  try {
    searchDirectory(testPath);
  } catch (err) {
    console.error(err);
  }
})();
