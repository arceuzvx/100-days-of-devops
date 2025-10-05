#!/bin/bash

README_FILE="README.md"
TEMP_FILE=$(mktemp)

# Start timeline container
echo '<div style="border-left: 3px solid #4CAF50; margin:20px 0; padding-left: 15px;">' > "$TEMP_FILE"

# Loop over commits (oldest → newest)
git log --reverse --pretty=format:"%h|%s|%ad" --date=short | while IFS="|" read -r HASH MSG DATE; do
    if echo "$MSG" | grep -iq "doc\|note"; then
        EMOJI="✍︎"           # Documentation / Notes
    elif echo "$MSG" | grep -iq "script\|devops"; then
        EMOJI="🛠️"           # Scripts / DevOps
    elif echo "$MSG" | grep -iq "security\|audit"; then
        EMOJI="🛡︎"           # Security / Audit
    elif echo "$MSG" | grep -iq "ci\|cd\|automation"; then
        EMOJI="⏩"           # Automation / CI/CD
    elif echo "$MSG" | grep -iq "highlight"; then
        EMOJI="✧"            # Highlight / Important
    else
        EMOJI="✓"            # Default completed
    fi

    # Get changed files for this commit
    FILES=$(git diff-tree --no-commit-id --name-status -r "$HASH")
    
    FILE_LIST_HTML=""
    while read -r line; do
        STATUS=$(echo "$line" | awk '{print $1}')
        FILE=$(echo "$line" | awk '{print $2}')
        case $STATUS in
            A) COLOR="green" ;;
            M) COLOR="orange" ;;
            D) COLOR="red" ;;
            *) COLOR="black" ;;
        esac
        FILE_LIST_HTML+="<li><span style='color:$COLOR;'>[$STATUS]</span> $FILE</li>"
    done <<< "$FILES"

    # Add card for this commit/day
    cat <<EOF >> "$TEMP_FILE"
<div style="margin-bottom:15px; padding:10px; border:1px solid #ddd; border-radius:5px; background-color:#f9f9f9;">
<h4 style="margin:0 0 5px 0;">$EMOJI $MSG</h4>
<p style="margin:0 0 5px 0;">
<strong>Commit:</strong> <code>$HASH</code> | <strong>Date:</strong> $DATE
</p>
<ul style="margin:0; padding-left:20px;">
$FILE_LIST_HTML
</ul>
</div>
EOF
done

# Close timeline container
echo '</div>' >> "$TEMP_FILE"

# Insert or replace timeline section in README
if grep -q "<!--TIMELINE_START-->" "$README_FILE"; then
    # Replace old timeline
    awk '
    BEGIN {p=1}
    /<!--TIMELINE_START-->/ {print; system("cat '"$TEMP_FILE"'"); p=0; next}
    /<!--TIMELINE_END-->/ {p=1}
    p {print}
    ' "$README_FILE" > "${README_FILE}.tmp" && mv "${README_FILE}.tmp" "$README_FILE"
else
    # Append timeline with markers
    echo -e "\n<!--TIMELINE_START-->\n$(cat $TEMP_FILE)\n<!--TIMELINE_END-->" >> "$README_FILE"
fi

rm "$TEMP_FILE"
echo "✅ Timeline updated in README with kawaii/professional emojis!"
