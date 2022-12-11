import * as peggy from "peggy";
import * as fs from "fs";

const pegRule = fs.readFileSync("src/peg.pegjs").toString();
export const parser = peggy.generate(pegRule);
const result = JSON.stringify(parser.parse("su molo li molo"), null, 2);
fs.writeFileSync("./result.json", result);
console.log(result);
