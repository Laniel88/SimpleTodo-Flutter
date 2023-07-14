# Simple Todo

A **simple Todo App** with a minimalistic design, built using Flutter.

> Developed for EOS 2023 ESC (Basic)

![](screenshot/a.png)

## Features

- **Create todos** through the floatingActionButton and modalBottomSheet.
- **Delete todo** by simply swiping the todo card (utilizing the Dismissible widget).
- **Check the overall todos** at a glance through the dot marker on the calendar.
- ***Automatically* save todos** in the database (SQLite) using the Drift package.


## Folder Structure

```txt
lib/
├── constant/                   # Constants
│   ├── color_palette.dart          # Contains color constants used throughout the app
│   └── custom_divider.dart         # Custom divider widget used for todo cards
├── model/                      # Database model
│   └── todo_table.dart             # Defines the Todo model for interacting with the database
├── screen/                     # Screens of the app
│   └── home_screen.dart            # Home screen displaying the calendar and todo list
├── widget/                     # Fundamental or reusable widgets
│   ├── custom_calendar.dart        # Custom calendar widget for selecting due dates
│   ├── todo_card.dart              # Widget for displaying a single todo card
│   └── todo_add_sheet.dart         # Bottom sheet for adding new todos
├── database.dart               # Contains the database initialization and setup
├── database.g.dart             # Generated file for database operations
└── main.dart                   # Entry point of the app

asset/font/                     
├── Pretendard-Regular.otf      # Regular font
└── Pretendard-Bold.otf         # Bold font
```

