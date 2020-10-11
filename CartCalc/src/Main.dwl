%dw 2.0
output application/json
type Currency = String { format: "\$#,###.00" }
var dbgMsg = (loglvl, logmsg) -> log(loglvl, logmsg)
var calcTax = (price,taxRate) -> (price * taxRate)
var calcTotal = (price,taxRate) -> (price * taxRate + price)
var subTotal = (payload.wine reduce (wine, total = 0) -> 
            total + wine.price)
---
{
    order: "",
    items: payload.wine map {
        id: $.id,
        price: $.price       
    },
subtotal: (payload.wine reduce (wine, total = 0) -> 
      total + wine.price)  as Currency,
    taxes: calcTax(subTotal, payload.taxRate) as Currency,
    total: calcTotal(subTotal,  payload.taxRate) as Currency 
}