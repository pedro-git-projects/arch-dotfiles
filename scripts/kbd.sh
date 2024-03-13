layouts=("us" "br")

DMENU_BACKGROUND="#282828"
DMENU_FOREGROUND="#ebdbb2"
DMENU_HIGHLIGHT="#bb7548"

selected_layout=$(printf '%s\n' "${layouts[@]}" | dmenu -nb "$DMENU_BACKGROUND" -nf "$DMENU_FOREGROUND" -sb "$DMENU_HIGHLIGHT" -sf "$DMENU_FOREGROUND")

if [[ " ${layouts[*]} " =~ " ${selected_layout} " ]]; then
    setxkbmap $selected_layout
else
  :
fi
