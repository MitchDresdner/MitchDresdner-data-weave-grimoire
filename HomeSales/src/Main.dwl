%dw 2.0
output application/json
var invoiceNo = 10000
---
csvFile flatMap (line, xy) -> [
  {
    sellPrice  : line.Sell  as Number,
    listPrice  : trim(line.List) as Number,
    itemAmount : trim(line.Taxes) as Number
  }
]