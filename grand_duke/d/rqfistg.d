// Styr
BEGIN ~rqstyr~

IF ~True()~ THEN BEGIN Guards1
    SAY ~Why are you talking to me? Shouldn't you be removing our *comrades* from the Citadel?~
    IF ~~ THEN EXIT
END

// Lerus
BEGIN ~rqlerus~

IF ~True()~ THEN BEGIN Guards2
    SAY ~This had better work; I am nervous about this as it is. I hope you will succeed.~
    IF ~~ THEN EXIT
END

// Maxmillion
BEGIN ~rqmaxmil~

IF ~True()~ THEN BEGIN Guards3
    SAY ~None shall pass through here; I can assure you, <CHARNAME>.~
    IF ~~ THEN EXIT
END
