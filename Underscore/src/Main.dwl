%dw 2.0
output application/json
import * from utils
---
{
	underscored: addUnderscore("howdy")
}