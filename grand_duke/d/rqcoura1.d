BEGIN ~rqcoura1~

IF ~Global("rqGDNeutralPathStep1","GLOBAL",1)~ THEN BEGIN Messenger1
    SAY ~His eyes focus on you. Greetings. You seem to fit the description of <CHARNAME>. Yes... yes, you do. A certain gentleman has asked me to deliver this letter to you. Farewell.~
    IF ~~ THEN DO
        %SetGlobal("rqGDNeutralPathStep1","GLOBAL",2)
        SetGlobal("rqGDNeutralPathStep2","GLOBAL",1)
        GiveItem("rqletbe1",LastTalkedToBy)
        EscapeArea()%
        UNSOLVED_JOURNAL ~Duke of Baldur's Gate:

        It seems that my actions have caught the attention of the Dukes. This is both good and bad. The bad thing is that the Dukes will intervene if I continue on my current course. The good part is that Krivy can actually deliver on his promises; otherwise, I would not have received this letter. Now I have two options: either continue with my quest with Krivy or take Belt's offer.~
    EXIT
END
