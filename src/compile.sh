#!/bin/bash

# Prerequisites:
# tab2opf: https://github.com/apeyser/tab2opf
# kindlegen: https://www.amazon.com/gp/feature.html?docId=1000765261

# Step 1 - plunder open dictionaries, create TSV of entries (done)
#    Here's where you fiddle the TSV to add a new dictionary or edit entries.

# Step 2: tsv to opf
python tab2opf/tab2opf.py ../Combined_Esperanto_English.tsv

# Step 4: Edit the outputs to add the inflections
for i in `seq 0 30` 
do
    if [ -f "Combined_Esperanto_English$i.html" ] 
    then
        python inflect.py Combined_Esperanto_English$i.html > Esperanto_English$i.html
    fi
done

# Step 5: Fix up some metadata
awk -f metadata.awk Combined_Esperanto_English.opf > Esperanto_English.opf

# Step 6: Run kindlegen
kindlegen Esperanto_English.opf

# Step 7: Copy to Kindle!
