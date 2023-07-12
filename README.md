# ee-ids-master
Simple Fivem Show Player ID Command Script

EE-IDs is a script for FiveM that allows you to display player IDs above their characters. When the `/ids` command is executed, it shows the player IDs for a duration of 5 seconds within a 100-unit range, and then automatically hides them.

## Features

- Toggle the visibility of player IDs with the `/ids` command.
- Player IDs are displayed above characters within a customizable distance.
- Player IDs include the server ID and player name.

## Installation

1. Download the `ee-ids-master` script.
2. Rename the folder to `ee-ids` (if not already named).
3. Place the `ee-ids` folder in your FiveM server's resource directory.
4. Add `start ee-ids` to your `server.cfg` file.

## Usage

1. In the FiveM server, execute the `/ids` command to toggle the visibility of player IDs.
2. Player IDs will be displayed above characters within a 100-unit range for 5 seconds.
3. After 5 seconds, the player IDs will automatically hide.

## Customization

You can customize the maximum distance for displaying player IDs by modifying the value in the script (`distance < 100`).

## Contributing

Contributions to this project are welcome! If you find any issues or have suggestions for improvements, please feel free to submit a pull request or open an issue.
