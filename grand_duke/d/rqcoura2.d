BEGIN ~rqcoura2~

IF ~Global("rqGDNeutralPathStep5","GLOBAL",1)~ THEN BEGIN Messenger2
    SAY ~Greetings <LADYLORD>. Have you fulfilled the task that my master Krivy set before you?~
    IF ~!Dead("rqcofist")~ THEN REPLY ~Yes, I have. Lezgyn promised to warn us about hostile actions of our enemies.~ GOTO Messages
    IF ~~ THEN REPLY ~No, I haven't. I need to go back to it.~ EXIT
    IF ~Dead("rqcofist")~ THEN REPLY ~Unfortunately, Lezgyn is dead.~ GOTO DeadLezgyn
END

IF ~ ~ THEN BEGIN DeadLezgyn
    SAY ~Dead? I must dash and find Krivy fast. If you would excuse me.~
    IF ~~ THEN REPLY ~Wait a moment, I want to speak to Krivy!~ DO ~SetGlobal("rqGDNeutralPathStep5","GLOBAL",2) EscapeArea()~ EXIT
    IF ~~ THEN REPLY ~What? You haven't told me what to do next?~ DO ~SetGlobal("rqGDNeutralPathStep5","GLOBAL",2) EscapeArea()~ EXIT
    IF ~~ THEN REPLY ~What? You haven't told me what to do next?~ DO ~SetGlobal("rqGDNeutralPathStep5","GLOBAL",2) EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN Messages
    SAY ~I shall seek out Krivy and pass on this information to him. In the meantime, I would recommend leaving this inn as soon as possible, as there is a significant risk that this meeting place has been compromised. Farewell.~
    IF ~~ THEN DO
        %SetGlobal("rqGDNeutralPathStep5","GLOBAL",2)
        EscapeArea()%
        UNSOLVED_JOURNAL ~Duke of Baldur's Gate:

        I passed the news about Lezgyn to Krivy, though a messenger warned me about overstaying in the Blade and Stars Tavern. Why do I smell another ambush? I should prepare myself to fight my way out of here.~
    EXIT
END

