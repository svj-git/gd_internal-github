BEGIN ~rqfistd9~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN YouAreNotWelcome
    SAY ~<CHARNAME>, you might be a savior of our city, but you are to leave the citadel immediately. Belts' orders: if you do not submit to our authority we shall be forced to harm you.~
    IF ~~ THEN REPLY ~Hah, don't make me laugh, Fist. You will die this <DAYNIGHT>.~ GOTO AlarmAnastasov
    IF ~~ THEN REPLY ~Just so you know, there is a traitor among you who has ordered your death. Know this and die, little Fist.~ GOTO AlarmAnastasov
END

IF ~~ THEN BEGIN AlarmAnastasov
    SAY ~We are under attack, <CHARNAME>, and his cohorts are attacking. Defend the citadel!~
    IF ~~ THEN DO ~Enemy()~ EXIT
END
