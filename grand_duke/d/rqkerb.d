BEGIN ~rqkerb~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN DoingHere
    SAY ~Insolent madmen! Guards! To arms!~
    IF ~~ THEN DO ~Enemy()~ EXIT
END
