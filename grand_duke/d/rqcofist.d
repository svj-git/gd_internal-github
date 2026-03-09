// Lezgyn Hawk
BEGIN ~rqcofist~

IF ~Global("rqGDNeutralPathStep4","GLOBAL",1)~ THEN BEGIN Introduction
    SAY ~You? How did you find me?~
    IF ~~ THEN REPLY ~Krivy told me where I can find you.~ GOTO Death
    IF ~~ THEN REPLY ~That is the last question you should be asking.~ GOTO Death
    IF ~~ THEN REPLY ~I know you are and who are you working for so lets talk.~ GOTO Negotiation
END

IF ~~ THEN BEGIN Death
    SAY ~I know what you're about. Let's get this over with. Draw steel!~
    IF ~~ THEN REPLY ~There is no need for you to lose your life. Let's talk.~ GOTO Negotiation
    IF ~~ THEN REPLY ~Calm down! I am are here to talk.~ GOTO Negotiation
    IF ~~ THEN REPLY ~No need for that Lezgyn. Want you to accept an offer that you cannot refuse.~ GOTO Negotiation
END

IF ~~ THEN BEGIN Negotiation
    SAY ~Talk? What do you want from me?~
    IF ~~ THEN REPLY ~I want you to work for me. If Belt makes any move against me, you will send a warning message.~ GOTO Ending
    IF ~~ THEN REPLY ~You will act in such a way that it will not be suspicious to Belt, but you will warn me about any incoming danger.~ GOTO Ending
END

IF ~~ THEN BEGIN Ending
    SAY ~Is that all? Well, I could certainly do that. Better to enjoy your life than die in this dank cellar.~
        IF ~~ THEN DO
        ~SetGlobal("rqGDNeutralPathStep4","GLOBAL",2)
        SetGlobal("rqGDNeutralPathStep5","GLOBAL",1)~
    EXIT
END
