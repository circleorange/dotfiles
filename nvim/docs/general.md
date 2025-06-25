# Macros
1. Press `q` followed by register letter (a-z), e.g. `qa` starts recording to register `a`,
2. Perform actions (motions, edits, etc.),
3. Stop recording by pressing `q` again,
4. Replay macro with `@`, e.g. `@a` to replay macro from register `a`, `@@` to replay last used macro, `5@a` to replay `a` macro 5 times.

# Marks
- Add Mark: `m`, e.g. `ma` to add mark under character "a"
- Go to Mark: Backtick, e.g. `<Backtick>a` to go to mark "a"
```
- Delete mark: `:delmarks a` or delete all marks with `:delmarks!`

# mini.nvim
## Surround:
- `saiw)`: Surround Add Inner Word ")", i.e. word -> (word)
