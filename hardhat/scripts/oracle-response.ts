type OracleResponse = {
  price: number;
  symbol: string;
};

const responses: OracleResponse[] = [
  { price: 4000, symbol: "ETHUSD" },
  { price: 4100, symbol: "ETHUSD" },
  { price: 4200, symbol: "ETHUSD" },
  { price: 4300, symbol: "ETHUSD" },
  { price: 4400, symbol: "ETHUSD" },
];

function printResponse(response: OracleResponse, index: number) {
  console.log(
    `response ${index + 1}:`,
    response.symbol,
    response.price,
  );
}

function isValid(response: OracleResponse): boolean {
  return (
    response.symbol.length > 0 &&
    Number.isFinite(response.price) &&
    response.price >= 0
  );
}

responses.forEach(printResponse);

console.log("");

for (const response of responses) {
  console.log(
    `${response.symbol} valid=${isValid(response)}`,
  );
}

console.log("");
console.log("oracle response exploration finished");
