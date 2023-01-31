# sct_skillcheck_minigame

https://youtu.be/tRjK1EvacrM

```
local result =
    exports["sct_skillcheck_minigame"]:ActionMinigame(
    {
        duration = 1, -- เวลา timeout ใส่เป็นจำนวนวิ
        maxRound = 4 -- กี่รอบ
    }
)

-- ค่าที่ result เป็น { 'sucess': int, 'fail': int }
print(json.encode(result))
```