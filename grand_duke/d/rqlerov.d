BEGIN ~rqlerov~
// Neutral Path

IF ~~ THEN BEGIN LerovNothing
    SAY ~I don't have anything to say to you.~
    IF ~~ THEN EXIT
END

IF ~Global("rqGDNeutralPathStep2","GLOBAL",1)~ THEN BEGIN Intro
    SAY ~Greetings <CHARNAME>. You certainly recognized me. I was with Iachino, and right now I would like you to talk to my friend behind Sorcerous Sundries.~
    IF ~~ THEN REPLY ~I saw you there with Iachino, but Iachino never introduced you.~ GOTO Introduced
    IF ~~ THEN REPLY ~Why are you following me?~ GOTO Found
END

IF ~~ THEN BEGIN Introduced
    SAY ~Yes, unfortunate that we are in this situation of uncertainty, but I am under orders to bring you to Krivy. Will you let me do my job?~
    IF ~~ THEN REPLY ~I will meet with Krivy.~ GOTO Accepted
    IF ~~ THEN REPLY ~Certain more pressing issues have appeared, so no, I cannot do anything for you right now.~ GOTO Rejected
END

IF ~~ THEN BEGIN Found
    SAY ~We do have a few people working for us. How do you think we were able to bring wealthy landowners to you?~
    IF ~AreaCheck("AR7800")~ THEN REPLY ~Interesting, though I want to speak to Krivy now.~ GOTO Accepted
    IF ~!AreaCheck("AR7800")~ THEN REPLY ~Interesting, though I want to speak to Krivy now.~ GOTO Accepted2
    IF ~~ THEN REPLY ~No, I have more important matters to attend to right now.~ GOTO Rejected
END

IF ~~ THEN BEGIN Accepted
    SAY ~Meet me behind Sorcerous Sundries.~
    IF ~~ THEN DO
        %SetGlobal("rqGDNeutralPathStep2","GLOBAL",2)
        MoveToPoint([328.1889])%
        UNSOLVED_JOURNAL ~Duke of Baldur's Gate:

        After speaking to Lerov, who claims to act on Krivy's behalf, I have agreed to meet Krivy behind Sorcerous Sundries.~
    EXIT
END

IF ~~ THEN BEGIN Accepted2
    SAY ~Go to the Eastern district and meet me behind Sorcerous Sundries.~
    IF ~~ THEN DO
        %SetGlobal("rqGDNeutralPathStep2","GLOBAL",2)
        EscapeAreaObject("Exit7800")%
        UNSOLVED_JOURNAL ~Duke of Baldur's Gate:

        After speaking to Lerov, who claims to act on Krivy's behalf, I have agreed to meet Krivy behind Sorcerous Sundries.~
    EXIT
END

IF ~~ THEN BEGIN Rejected
    SAY ~No? Fine, I will be at the Elfsong if you want to continue helping Krivy.~
    IF ~~ THEN DO
        %SetGlobal("rqGDNeutralPathStep2","GLOBAL",10)
        EscapeArea()%
        UNSOLVED_JOURNAL ~Duke of Baldur's Gate:

        Rejected Lerov's attempt to meet with Krivy behind Sorcerous Sundries. If I change my mind, I can find Lerov in the Elfsong Tavern.~
    EXIT
END

IF ~Global("rqGDGrandDukeQuest","GLOBAL",1) Global("rqGDNeutralPathStep2","GLOBAL",10)~ THEN BEGIN Reconsidered
    SAY ~Have you reconsidered? Are you ready to resume our quest?~
    IF ~~ THEN REPLY ~I will meet with Krivy.~ GOTO Resume
    IF ~~ THEN REPLY ~No, I do not want to deal with your shady master.~ GOTO Nope
END

IF ~~ THEN BEGIN Nope
    SAY ~Testing, eh? Well, I guess I have to wait a little longer.~
    IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Resume
    SAY ~*He smiles* Then meet me behind Sorcerous Sundries.~
    IF ~~ THEN DO
        %SetGlobal("rqGDNeutralPathStep2","GLOBAL",2)
        EscapeAreaObject("Exit7800")
        %
        UNSOLVED_JOURNAL ~Duke of Baldur's Gate:

        After speaking to Lerov, who claims to act on Krivy's behalf, I have agreed to meet Krivy behind Sorcerous Sundries.~
    EXIT
END

