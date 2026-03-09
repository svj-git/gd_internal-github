BEGIN ~rqmerc09~

IF ~True()~ THEN BEGIN Test111
    SAY ~Do you wish to purchase some items?~
    IF ~~ THEN REPLY ~Yes.~ DO ~StartStore("rqstor09",LastTalkedToBy())~ EXIT
    IF ~~ THEN REPLY ~No.~ EXIT
END
