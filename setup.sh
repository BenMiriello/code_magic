#!/bin/bash
# The Code of Secrets: A Terminal Adventure
# Initial startup script

echo "Welcome to Hogwarts School of Terminal Magic!"
echo ""
echo "Before you can begin your training as a code wizard,"
echo "you need to demonstrate basic terminal navigation skills."
echo ""
echo "TASKS:"
echo "1. Create a directory called 'wizard_training' using mkdir"
echo "2. Navigate into that directory using cd"
echo "3. Create a file called 'ready.txt' with the text 'I am ready' using echo"
echo "4. Run the setup script by typing './setup.sh'"
echo ""
echo "Good luck, young wizard!"

# Check if wizard_training directory exists and setup.sh is present
if [ -d "wizard_training" ] && [ -f "setup.sh" ]; then
  chmod +x setup.sh
  echo "The setup script is ready. Once you complete the tasks, run it from inside the wizard_training directory."
else
  # Create the setup script
  cat > setup.sh << 'EOF'
#!/bin/bash

# Check if we're in the right directory
current_dir=$(basename "$(pwd)")
if [ "$current_dir" != "wizard_training" ]; then
  echo "You must run this script from inside the wizard_training directory!"
  exit 1
fi

# Check if ready.txt exists with correct content
if [ ! -f "ready.txt" ] || ! grep -q "I am ready" ready.txt; then
  echo "You need to create ready.txt with 'I am ready' inside it first!"
  exit 1
fi

echo "Excellent! You've demonstrated basic terminal navigation skills."
echo "Your wizarding training can now begin..."
echo ""
echo "Professor McGonagall appears before you in a flash of light:"
echo ""
echo "\"Welcome to Hogwarts. We are in grave danger. The dark wizard"
echo "Lord NullPointer is attempting to introduce fatal bugs into our"
echo "magical core systems. As our newest code wizard apprentice,"
echo "you must help us stop him before it's too late.\""
echo ""
echo "\"First, you must create a secret passageway to access the castle.\""
echo ""
echo "TASK: Create a directory called 'secret_passageway', navigate into it,"
echo "then run the command 'lumos' to illuminate your path forward."
echo ""

# Create the lumos command
cat > lumos << 'LUMOS_EOF'
#!/bin/bash
current_dir=$(basename "$(pwd)")
if [ "$current_dir" != "secret_passageway" ]; then
  echo "You must be inside the secret_passageway to cast Lumos!"
  exit 1
fi

echo "Your wand tip illuminates, revealing the path to Hogwarts Castle!"
echo "Creating the magical environment..."

# Set up the rest of the adventure
cd ..
mkdir -p HogwartsCastle
cd HogwartsCastle

# Create EntryHall
mkdir -p EntryHall
cat > EntryHall/welcome.txt << 'WELCOME_EOF'
Welcome to Hogwarts Castle!

You stand in the grand Entry Hall. Portraits of famous wizards line the walls,
whispering about the dark wizard threat.

Professor McGonagall approaches:
"We must act quickly. Lord NullPointer was last seen in the Potions Dungeon.
Please head there immediately and assist Professor Slughorn."

TASKS:
1. Navigate to the Potions Dungeon (cd PotionsDungeon)
2. Read the instructions (cat instructions.txt)
WELCOME_EOF

# Create Potions Dungeon
mkdir -p PotionsDungeon
cat > PotionsDungeon/instructions.txt << 'POTIONS_EOF'
Professor Slughorn looks worried:

"Thank goodness you're here! I need to brew an antidote potion quickly.
Lord NullPointer has poisoned our magical network!

I need precisely the right number of ingredients:
- 42 lacewing flies
- 7 rat tails
- Unknown amount of essence of wormwood

Create a script called 'brew_potion.sh' that calculates how many drops of
essence of wormwood we need. The formula is lacewing flies divided by rat tails.

IMPORTANT: To ensure accuracy, consult the 'Advanced Potions Making' book for the
precise formula. Type 'advanced_potions_making liquid_death' to open it.

After creating your script, make it executable with 'chmod +x brew_potion.sh'
and run it with './brew_potion.sh'

BE CAREFUL! An incorrect potion will destroy this dungeon. If that happens,
use 'reparo PotionsDungeon' to restore it."
POTIONS_EOF

# Create the advanced potions making command
cat > ../advanced_potions_making << 'APM_EOF'
#!/bin/bash
if [ "$1" == "liquid_death" ]; then
  echo "The Advanced Potions Making book opens to page 394..."
  echo ""
  echo "LIQUID DEATH POTION"
  echo "-------------------"
  echo "For precise measurements, always ensure the number of essence of wormwood"
  echo "drops is EXACTLY equal to the flying insects divided by the mammal tails."
  echo "No more, no less."
  echo ""
  echo "Remember to store your result in a variable called 'essence_drops'"
  echo "and echo it out as part of a complete message."
  echo ""
  echo "WARNING: The slightest miscalculation will cause catastrophic failure."
else
  echo "The Advanced Potions Making book doesn't open to that page."
  echo "Try specifying a known potion name."
fi
APM_EOF
chmod +x ../advanced_potions_making

# Create reparo command
cat > ../reparo << 'REPARO_EOF'
#!/bin/bash
if [ "$1" == "PotionsDungeon" ]; then
  echo "Casting reparo on the Potions Dungeon..."
  rm -rf PotionsDungeon
  mkdir -p PotionsDungeon
  cp -f PotionsDungeon_backup/* PotionsDungeon/
  echo "The Potions Dungeon has been restored!"
else
  echo "You must specify what to repair!"
  echo "Usage: reparo [location]"
fi
REPARO_EOF
chmod +x ../reparo

# Create backup of Potions Dungeon
mkdir -p PotionsDungeon_backup
cp PotionsDungeon/instructions.txt PotionsDungeon_backup/

# Create check potion script
cat > PotionsDungeon/check_potion.sh << 'CHECK_POTION_EOF'
#!/bin/bash
if [ ! -f brew_potion.sh ]; then
  echo "You need to create brew_potion.sh first!"
  exit 1
fi

chmod +x brew_potion.sh 2>/dev/null
output=$(./brew_potion.sh 2>&1)

if [[ "$output" == *"6"* && "$output" == *"essence"* && "$output" == *"wormwood"* ]]; then
  echo "The potion bubbles successfully!"
  echo "Professor Slughorn beams with pride."
  echo ""
  echo "\"Excellent work! The antidote is brewing. While we wait,"
  echo "we've received word that Lord NullPointer was seen in the Library."
  echo "He was searching through the restricted section for something."
  echo "You should investigate immediately!\""
  echo ""
  echo "NEXT TASK: Navigate to the Library (cd ../Library)"
  
  # Set up Library
  mkdir -p ../Library
  mkdir -p ../Library/RestrictedSection
  
  # Create professors patrol script
  cat > ../isolemnlyswear << 'MARAUDER_EOF'
#!/bin/bash
echo "I solemnly swear that I am up to no good..."
echo ""
echo "The Marauder's Map reveals Hogwarts Castle:"
echo ""

# Generate random professor locations
locations=("EntryHall" "PotionsDungeon" "Library" "Library/RestrictedSection" 
           "GreatHall" "AstronomyTower" "TransfigurationClassroom" 
           "DefenseAgainstDarkArts" "Greenhouse" "Dormitories")

professors=("McGonagall" "Slughorn" "Flitwick" "Sprout" 
            "Hagrid" "Trelawney" "Vector")

declare -A occupied_locations

# Randomly place professors
for prof in "${professors[@]}"; do
  placed=false
  while [ "$placed" == "false" ]; do
    rand_idx=$((RANDOM % ${#locations[@]}))
    location=${locations[$rand_idx]}
    
    if [ -z "${occupied_locations[$location]}" ]; then
      occupied_locations[$location]=$prof
      placed=true
    fi
  done
done

# Display locations and who's there
for loc in "${locations[@]}"; do
  printf "%-30s" "$loc:"
  if [ -n "${occupied_locations[$loc]}" ]; then
    echo "Professor ${occupied_locations[$loc]} is here"
  else
    echo "Empty"
  fi
done

echo ""
echo "Mischief managed!"

# Check if both library locations are empty
if [ -z "${occupied_locations['Library']}" ] && [ -z "${occupied_locations['Library/RestrictedSection']}" ]; then
  echo ""
  echo "The coast is clear! Both the Library and Restricted Section are empty."
  echo "This is your chance to investigate!"
fi

# Create detention function if player tries to enter occupied restricted section
# This is checked by the Library directory itself
MARAUDER_EOF
chmod +x ../isolemnlyswear

# Create Library content
cat > ../Library/notice.txt << 'LIBRARY_EOF'
HOGWARTS LIBRARY

NOTICE: The Restricted Section is currently being patrolled by professors.
To enter, you must first ensure no professors are present.

Use the Marauder's Map by typing 'isolemnlyswear' repeatedly until
both the Library and Restricted Section show as empty.

WARNING: Attempting to enter the Restricted Section while professors
are present will result in detention!
LIBRARY_EOF

# Create Restricted Section detector
cat > ../Library/enter_restricted << 'RESTRICTED_EOF'
#!/bin/bash
# Get the last output of isolemnlyswear command
if [ ! -f last_map_check.txt ]; then
  echo "You need to check the Marauder's Map first!"
  echo "Use: isolemnlyswear"
  exit 1
fi

library_clear=$(grep "Library: *Empty" last_map_check.txt)
section_clear=$(grep "Library/RestrictedSection: *Empty" last_map_check.txt)

if [ -n "$library_clear" ] && [ -n "$section_clear" ]; then
  echo "The coast is clear! You can enter the Restricted Section."
  echo "cd RestrictedSection"
else
  echo "CAUGHT! Professor $(grep "Library/RestrictedSection" last_map_check.txt | cut -d' ' -f3) spots you!"
  echo "You've been sent to detention."
  cd ../../
  mkdir -p Detention
  cd Detention
  cat > detention_note.txt << 'DETENTION_NOTE'
You are in detention for attempting to enter the Restricted Section while
professors were present!

To be released, you must write lines:
Create a file called 'lines.txt' with the text:
"I will not enter the Restricted Section without checking the Marauder's Map"
repeated 5 times.

Once complete, run './check_detention.sh'
DETENTION_NOTE

  cat > check_detention.sh << 'CHECK_DETENTION'
#!/bin/bash
if [ -f lines.txt ]; then
  line_count=$(grep -c "I will not enter the Restricted Section without checking the Marauder's Map" lines.txt)
  if [ "$line_count" -ge 5 ]; then
    echo "You have completed your detention."
    echo "Return to the Library to try again."
    echo "cd ../Library"
  else
    echo "Not enough lines. You need to write the line 5 times."
  fi
else
  echo "You need to create lines.txt with your detention lines!"
fi
CHECK_DETENTION
  chmod +x check_detention.sh
fi
RESTRICTED_EOF
chmod +x ../Library/enter_restricted

# Create the restricted section sorting challenge
mkdir -p ../Library/RestrictedSection
cat > ../Library/RestrictedSection/scattered_books.txt << 'BOOKS_EOF'
The Restricted Section is in disarray! Books are scattered everywhere,
and one important tome appears to be missing.

Lord NullPointer has been here and taken a book, but which one?

TASK: Create a script called 'sort_books.sh' that sorts the magical books
in this room. Try different sorting methods to reveal the hidden message.

The books need to be sorted into a directory called 'sorted_books'.
Create this directory before running your script.

Books to sort are in the 'books' directory.
BOOKS_EOF

# Create books with a pattern
mkdir -p ../Library/RestrictedSection/books
book_titles=("Ancient_Runes" "Basilisk_Breeding" "Cryptic_Curses" "Dangerous_Divination" 
             "Forbidden_Formulas" "Haunted_Horcruxes" "Immortal_Incantations" 
             "Jinxed_Journals" "Karmic_Knots" "Lethal_Lexicons")

# The missing book would be "Grim_Grimoires" which should go between F and H
# When sorted alphabetically, the first letters spell "ABCDFHIJKL" with G missing

for title in "${book_titles[@]}"; do
  touch "../Library/RestrictedSection/books/${title}.book"
  # Add content to each book
  echo "Contents of ${title}" > "../Library/RestrictedSection/books/${title}.book"
  echo "First letter: ${title:0:1}" >> "../Library/RestrictedSection/books/${title}.book"
done

# Create verification script for the sorting challenge
cat > ../Library/RestrictedSection/check_sorting.sh << 'CHECK_SORTING_EOF'
#!/bin/bash
if [ ! -d "sorted_books" ]; then
  echo "You need to create a directory called 'sorted_books' first!"
  exit 1
fi

# Check if files were copied/moved to sorted_books
book_count=$(ls -1 sorted_books/*.book 2>/dev/null | wc -l)
if [ "$book_count" -lt 10 ]; then
  echo "Not all books have been sorted yet!"
  exit 1
fi

# Check if they identified the missing book
echo "The books are now organized."
echo "Looking at the first letters of each book title in alphabetical order:"
echo ""
echo "A B C D F H I J K L"
echo ""
echo "There's a gap! The letter 'G' is missing!"
echo ""
echo "What book title starting with 'G' would fit in this collection?"
echo "Create a file called 'missing_book.txt' with your answer."
echo "Format your answer as: Grim_Grimoires"
CHECK_SORTING_EOF
chmod +x ../Library/RestrictedSection/check_sorting.sh

# Create missing book checker
cat > ../Library/RestrictedSection/check_missing_book.sh << 'CHECK_MISSING_EOF'
#!/bin/bash
if [ ! -f "missing_book.txt" ]; then
  echo "You need to create missing_book.txt with your answer first!"
  exit 1
fi

answer=$(cat missing_book.txt)
if [ "$answer" == "Grim_Grimoires" ]; then
  echo "CORRECT! 'Grim_Grimoires' is the missing book!"
  echo ""
  echo "You hear a whisper behind you: 'Looking for this?'"
  echo ""
  echo "You spin around to see a shadowy figure holding an ancient tome."
  echo "Lord NullPointer! He sneers and disappears in a puff of smoke,"
  echo "but drops a page torn from the book."
  echo ""
  echo "The page reveals his plan! He's going to cast his destructive spell"
  echo "from the Astronomy Tower at midnight."
  echo ""
  echo "NEXT TASK: Go to the Astronomy Tower (cd ../../AstronomyTower)"
  
  # Create Astronomy Tower
  mkdir -p ../../AstronomyTower
  # More content to be added here for the next challenge
else
  echo "That doesn't seem right. Try again!"
fi
CHECK_MISSING_EOF
chmod +x ../Library/RestrictedSection/check_missing_book.sh

echo "The adventure has begun! Navigate to HogwartsCastle/EntryHall to start."
echo "cd HogwartsCastle/EntryHall"
echo "cat welcome.txt"

# Make all scripts executable
chmod +x ../isolemnlyswear
chmod +x lumos
chmod +x ../advanced_potions_making
chmod +x ../reparo

echo "Setup complete!"
exit 0
LUMOS_EOF
chmod +x lumos

echo "Setup script created. Complete the tasks to begin your adventure!"
exit 0
EOF
  chmod +x setup.sh
fi