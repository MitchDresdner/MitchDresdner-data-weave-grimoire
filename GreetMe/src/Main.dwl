%dw 2.0
output application/json
// 1st class lambda functions
var sayHowdy = (whom) -> "Greetings $(whom)"
var dbgMsg = (loglvl, logmsg) -> log(loglvl, logmsg)
---
{
   greetMe: sayHowdy(payload.message),
   logme: dbgMsg("WARNING", "Houston, we have a problem."),
   arrayCat : payload.a1 ++ payload.a2,
   strCat: "Go Home " ++ payload.message,
   // concat two objects, flatten
   objCat: {"person": payload.message} ++ payload.phone,
   finis: dbgMsg("INFO","Return to Earth.")
}