%dw 2.0
output application/json
---
payload filter ( $.id > 198) map (todo) -> {
    myId: todo.id,
    task: todo.title,
    done: todo.completed
}