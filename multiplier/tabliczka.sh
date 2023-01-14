#!/bin/bash

let overall;
let goodAnswers=0
let badAnswers=0

header() {
    echo "************************************************************************************************"
    echo "*                                TABLICZKA MNOŻENIA                                            *"
    echo "************************************************************************************************"
}

summary() {
    echo "------------------------------------------------------------------------------------------"
    echo "Zadanych pytań: $overall."
    echo "Poprawnych odpowiedzi: $goodAnswers"
    echo "Złych odpowiedzi: $badAnswers"

    let goodAnswersPercent=$(($goodAnswers*100/$overall))

    if [[ goodAnswersPercent -ge 95 ]]; then
        say "Gratuluję. Jesteś mistrzem w tabliczce mnożenia."
    elif [[ goodAnswersPercent -ge 80 && goodAnswersPercent -lt 95 ]]; then
        say "Nieźle, ale stać cię na jeszcze więcej."
    elif [[ goodAnswersPercent -ge 65 && goodAnswersPercent -lt 80 ]]; then
        say "Tragedii nie ma, ale mogło by być lepiej."
    else
        say "Tragicznie. Weź się do roboty głąbie bo będziesz kiblował!"
    fi
}

good() {
    taunts=(
        "Dobrze!" "Brawo!" "Elegancko" "Tak trzymaj!" "I gitara" "Wspaniale!" "Tak jest" "Git" "Zgadza się"
    )

    let arrayLength=${#taunts[@]}-1
    let randomIndex=`jot -r 1 0 $arrayLength`

    say ${taunts[$randomIndex]}
}

bad() {
    taunts=(
        "Źle!" "Źle gamoniu!" "Dupa" "Źle. Takie rzeczy to dzieci w drugiej klasie wiedzą" "Srały muchy będzie wiosna" 
        "Chyba u twojej starej" "A jedzie mi tu tramwaj?" "Coś ci się pokręciło" "Jaja sobie robisz?" "Gówno!"
    )

    let arrayLength=${#taunts[@]}-1
    let randomIndex=`jot -r 1 0 $arrayLength`

    say ${taunts[$randomIndex]}
}

task() {
    let val1=`jot -r 1 2 10`
    let val2=`jot -r 1 2 10`
    let expectedResult=val1*val2

    echo -n "$val1 * $val2 = "
    read answer

    if [[ expectedResult -eq answer ]]; then 
        good
        let goodAnswers++
    else
        bad
        echo "Prawidłowa odpowiedź to $expectedResult"
        let badAnswers++
    fi
}

[ -z "$1" ] && echo "Nie podano ilości pytań" && exit
let overall=$1
header

for (( i=1; i<=$1; i++ ))
do
    task
done

summary