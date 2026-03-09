BEGIN ~rqcourb1~

IF ~Global("rqGDGoodPathStep1","GLOBAL",1)~ THEN BEGIN Messenger3
    SAY ~Greetings you must be <PRO_LADYLORD> <CHARNAME> Grand Duke Belt has message for you, Farewell.~
        IF ~~ THEN DO
        %SetGlobal("rqGDGoodPathStep1","GLOBAL",2)
        SetGlobal("rqGDGoodPathStep2","GLOBAL",1)
        GiveItem("rqletbe1",LastTalkedToBy)
        EscapeArea()%
        UNSOLVED_JOURNAL ~Duke of Baldur's Gate:

        Received a message from Duke Belt. This is both good and bad. The bad thing is that the Dukes will intervene if I continue on my current course. The good part is that Krivy can actually deliver on his promises; otherwise, I would not have received this letter. Now I have two options: either continue with my quest with Krivy or take Belt's offer to leave the city.~
    EXIT
END
