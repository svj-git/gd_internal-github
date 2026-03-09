BEGIN ~rqpal1a~

IF ~Global("rqGDEvilPathStep1","GLOBAL",1)~ THEN BEGIN PaladinIntro
    SAY ~How did you find us?~
    IF ~~ THEN REPLY ~Does it matter?~ GOTO PaladinAnswer1
    IF ~~ THEN REPLY ~No one stands in my way, Paladin.~ GOTO PaladinAnswer2
    IF ~~ THEN REPLY ~I would tell you, but knowledge is useless to the dead.~ GOTO PaladinAnswer3
    IF ~~ THEN REPLY ~Why don't you leave the city and we can end this without violence.~ GOTO PaladinReeksOfEvil
    IF ~~ THEN REPLY ~I think that bit of generosity suits the future Duke < <CHARNAME>, does it not? Leave now and I shall not harm you.~ GOTO PaladinReeksOfEvil
END

IF ~~ THEN BEGIN PaladinAnswer1
    SAY ~We shall strike you down in the name of Torm!~
    IF ~~ THEN DO
        ~SetGlobal("rqGDEvilPathStep1","GLOBAL",2)
        ActionOverride("rqpal2a",Enemy())
        ActionOverride("rqpal3a",Enemy())
        ActionOverride("rqpal4a",Enemy())
        ActionOverride("rqpal5a",Enemy())
        ActionOverride("rqcle1a",Enemy())
        ActionOverride("rqlerov",Enemy())
        Enemy()~
    EXIT
END

IF ~~ THEN BEGIN PaladinAnswer2
    SAY ~Torm does! On guard, fiend!~
    IF ~~ THEN DO
        ~SetGlobal("rqGDEvilPathStep1","GLOBAL",2)
        ActionOverride("rqpal2a",Enemy())
        ActionOverride("rqpal3a",Enemy())
        ActionOverride("rqpal4a",Enemy())
        ActionOverride("rqpal5a",Enemy())
        ActionOverride("rqcle1a",Enemy())
        ActionOverride("rqlerov",Enemy())
        Enemy()~
    EXIT
END

IF ~~ THEN BEGIN PaladinAnswer3
    SAY ~Torm help us!~
    IF ~~ THEN DO
        ~SetGlobal("rqGDEvilPathStep1","GLOBAL",2)
        ActionOverride("rqpal2a",Enemy())
        ActionOverride("rqpal3a",Enemy())
        ActionOverride("rqpal4a",Enemy())
        ActionOverride("rqpal5a",Enemy())
        ActionOverride("rqcle1a",Enemy())
        ActionOverride("rqlerov",Enemy())
        Enemy()~
    EXIT
END

IF ~~ THEN BEGIN PaladinReeksOfEvil
    SAY ~You?! You reek of evil! We shall not allow your plans to succeed!~
    IF ~~ THEN DO
        ~SetGlobal("rqGDEvilPathStep1","GLOBAL",2)
        ActionOverride("rqpal2a",Enemy())
        ActionOverride("rqpal3a",Enemy())
        ActionOverride("rqpal4a",Enemy())
        ActionOverride("rqpal5a",Enemy())
        ActionOverride("rqcle1a",Enemy())
        ActionOverride("rqlerov",Enemy())
        Enemy()~
    EXIT
END
