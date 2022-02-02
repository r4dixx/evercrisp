#!/bin/bash
# cleans srt formatted subtitles of common blocks that may be considered unwanted, works well as a post-process script for software such as Bazarr or Sub-Zero
# from https://github.com/brianspilner01/media-server-scripts

SUB_FILEPATH="$1"

# check usage
[ ! -f "$SUB_FILEPATH" ] && { echo "usage: sub-clean.sh [FILE]" ; echo "Warning: subtitle file does not exist" ; exit 1 ; }

# lowercase list of regex (gore/magic?) that will be removed from srt
REGEX_TO_REMOVE='opensubtitles|sub(scene|rip)|podnapisi|addic7ed|titlovi|bozxphd|sazu489|psagmeno|normita|anoxmous|(br|dvd|web).?(rip|scr)|english (- )?us|sdh|srt|(yahoo|mail|book|fb|4m|hd)\. ?com|(sub(title)?(bed)?(s)?(fix)?|encode(d)?|correct(ed|ion(s)?)|caption(s|ed)|sync(ed|hroniz(ation|ed))?|english)(.pr(esented|oduced))?.?(by|&)|[^a-z]www\.|http|\. ?(co|pl|link|org|net|mp4|mkv|avi|pdf)([^a-z]|$)|©|™'

if [[ $SUB_FILEPATH =~ \.srt$ ]] # only operate on srt files
then

        # convert any DOS formatted files to UNIX (remove carriage return line endings)
        sed -i.bak 's/\r$//' "$SUB_FILEPATH" && rm "${SUB_FILEPATH}.bak"

        ### each record (in awk) is defined as a block of srt formatted subs (record seperator RS is essentially \n\n+, see docs), with each line of the block a seperate field .i.e.:
        # LINE NUMBER
        # TIMESTAMP --> TIMESTAMP
        # SUB LINE 1
        # SUB LINE 2
        # ...
        #

        awk 'tolower($0) !~ /'"$REGEX_TO_REMOVE"'/ { $1 = VAR++ ; print ; next } { print >> TRASH }' RS='' FS='\n' OFS='\n' ORS='\n\n' VAR=1 TRASH="$SUB_FILEPATH.trash.tmp" "$SUB_FILEPATH" > "$SUB_FILEPATH.tmp" && \
        mv "$SUB_FILEPATH.tmp" "$SUB_FILEPATH" && \
        chmod 666 "$SUB_FILEPATH" && \
        echo "sub-clean.sh succesfully processed $SUB_FILEPATH"

        if [ -f "$SUB_FILEPATH.trash.tmp" ]
        then

                REMOVED_LINES=$(cat "$SUB_FILEPATH.trash.tmp")
                rm "$SUB_FILEPATH.trash.tmp"

                if [[ $REMOVED_LINES ]]
                then
                        echo "The following lines were removed:"
                        echo "$REMOVED_LINES"
                fi
        fi

else
        echo "Provided file must be .srt"
        exit 1
fi

