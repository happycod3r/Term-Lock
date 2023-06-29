#!/bin/bash

# To disable the pin simply set USE_PIN to "false"
USE_PIN="true"

function term_lock() {
    
    if [[ -n $USE_PIN && "$USE_PIN" == "true" ]]; then

        function fatal() {
            CYAN='\033[0;36m'
            RED='\033[0;31m'
            NC='\033[0m'
            echo -e "$0: ${RED}Error:${CYAN} $*" >&2
            exit 0
        }

        function out() {
            CYAN='\033[0;36m'
            PURPLE='\033[0;35m'
            NC='\033[0m'
            echo -e "${CYAN}[Term-Lock] ${PURPLE}$*${NC}"
        }

        encode() {
            if [[ $# -eq 0 ]]; then
                cat | base64
            else
                printf '%s' "$1" | base64
            fi
        }

        decode() {
            if [[ $# -eq 0 ]]; then
                cat | base64 --decode
            else
                printf '%s' "$1" | base64 --decode
            fi
        }

        CONFIG_DIRECTORY="${${(%):-%x}:h}/.config/term-lock/"
        PIN_FILE="${CONFIG_DIRECTORY}/.pin.conf"
        DONE="false"
        new_user="true"

        if [[ ! -d "$CONFIG_DIRECTORY" ]]; then
            mkdir -p "$CONFIG_DIRECTORY"
        fi

        while [[ "$DONE" == "false" ]]; do

            good_pin="false"
            pin_pattern='^[0-9]{4}$' # 4 digits.
            exit_char="q"

        # ------------------- CURRENT USERS ------------------

            if [[ -f "$PIN_FILE" ]]; then

                new_user="false"
                correct_pin="$(sed "1q;d" $PIN_FILE | cut -d':' -f2)"
                decoded_pin="$(decode $correct_pin)"

                while [[ "$good_pin" == "false" ]]; do

                    clear
                    out "Enter your pin to continue." 
                    read "pin?pin: "

                    if [[ -z "$pin" ]]; then
                        out "Pin is empty. Enter a valid pin to continue."
                        clear
                        continue
                    fi

                    if [[ "$pin" == "$exit_char" ]]; then
                        out "Press enter to exit..."
                        read "a?"
                        clear
                        exit 0
                    fi

                    if [[ $pin =~ $pin_pattern ]]; then
                    
                        if [[ "$pin" == "$decoded_pin" ]]; then
                            good_pin="true"
                            DONE="true"
                            clear
                            break
                        else
                            continue
                        fi

                    else
                        clear
                        out "Invalid pin. Must be no less than 4 digits and no letter or characters."
                    fi

                done
            fi

            # --------------- NEW USERS ------------------

            while [[ "$good_pin" == "false" ]]; do

                out "Set a pin for future use
Pin or (q) to quit" 
                read "pin?pin: "

                if [[ -z "$pin" ]]; then
                    clear
                    out "Pin is empty. Enter a valid pin to continue."
                    read "a?Press enter to continue..."
                    clear
                    continue
                fi

                if [[ "$pin" == "$exit_char" ]]; then
                    out "Press enter to exit..."     
                    read "a?"
                    clear
                    exit 0
                fi

                if [[ $pin =~ $pin_pattern ]]; then
                    local encode_pin
                    encoded_pin="$(encode $pin)"
                    echo "pin:$encoded_pin" > "$PIN_FILE"
                    good_pin="true"
                    DONE="true"
                    clear
                else
                    clear
                    out "Invalid pin. Must be no less than 4 digits and no letter or characters."
                    read "a?Press enter to continue..."
                    clear
                fi
            done

            if [[ $DONE == "true" ]]; then
                break
            fi

        done

    elif [[ -n $USE_PIN && "$USE_PIN" == "false" ]]; then
        out "Pin system will be disabled."
    fi    

}

term_lock
