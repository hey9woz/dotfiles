#!/bin/bash

echo "🌐 Choose your tmux layout mode:"
echo "1: Default  (Vertical split: 70% / 30%)"
echo "2: Custom   (Interactive split)"
echo "3: Random   (Random directions and ratios)"
read -p "Enter your choice (1/2/3): " mode

case $mode in
  1)
    echo "🚀 Applying default layout (Vertical split: 70% / 30%)"
    tmux split-window -v -p 30
    ;;

  2)
    echo "⚙️  Custom layout selected."
    read -p "How many panes do you want? (e.g. 2–5): " count
    for i in $(seq 1 $((count - 1))); do
      read -p "[$i] Split direction? (Vertical: v / Horizontal: h): " dir
      read -p "[$i] Size percentage for the new pane (e.g. 30): " percent

      if [[ "$dir" == "v" ]]; then
        tmux split-window -v -p $percent
      elif [[ "$dir" == "h" ]]; then
        tmux split-window -h -p $percent
      else
        echo "❗ Invalid direction. Use 'v' or 'h'."
        exit 1
      fi
      tmux select-pane -t :.+
    done
    ;;

  3)
    echo "🎲 Generating a random layout..."
    count=$((RANDOM % 3 + 2))  # 2–4 panes
    echo "➡️ Number of splits: $count"

    for i in $(seq 1 $((count - 1))); do
      dir=$((RANDOM % 2))
      percent=$((RANDOM % 61 + 20))  # 20–80%

      if [[ "$dir" -eq 0 ]]; then
        echo "[$i] 🔻 Vertical split at $percent%"
        tmux split-window -v -p $percent
      else
        echo "[$i] 🔺 Horizontal split at $percent%"
        tmux split-window -h -p $percent
      fi
      tmux select-pane -t :.+
    done
    ;;

  *)
    echo "❌ Invalid selection. Please choose 1, 2, or 3."
    exit 1
    ;;
esac

