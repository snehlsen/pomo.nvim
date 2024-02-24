# pomo.nvim
A simple pomodoro-style task list for nvim. You will need a separate timer, as timekeeping is not integrated. 

## Installation
### lazy
```lua
require("lazy").setup({
  {
    "snehlsen/pomo.nvim",
    config = true
  }
})
```

## Usage
Pomo adds four user commands for pomodoro like task worksheets.

### Setup for the day
You can use `:PomoNewDay` to get a simple template for the day with a heading for the current day and a first task. Add your tasks and assign timeslots for the current line with `:PomoAssign`
```
2024-02-24
----------
- update pomo README.md  ☐
- review and merge PR ☐
- research timer APIs in nvim ☐ ☐
```

### Work on your tasks
When a task is finished you can use `:PomoComplete` to mark a timeslot complete on the current line. If you put in more slots than estimated in the morning, this will be marked visually. For interuptions use `:PomoPause`, this will also add a visual mark so you can track interruptions.
```
2024-02-24
----------
- update pomo README.md  ☑ ✓
- review and merge PR ☑ ⏸ ⏸
- research timer APIs in nvim ☑ ☐
```
