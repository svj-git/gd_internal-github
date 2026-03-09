BEGIN ~rqbelt~

IF ~Global("rqGDGoodPathStep5","GLOBAL",1)~ THEN BEGIN DukeBeltIntro
    SAY ~Indeed, I did not expect you to arrive here, <CHARNAME>. However, to be honest, I was actually intending to seek you out.~
    IF ~~ THEN REPLY ~Why?~ GOTO SeekOutCharname
END

IF ~~ THEN BEGIN SeekOutCharname
    SAY ~We know the true motive of this Krivy, and I know why he pushed you as a candidate for Duke. I know Krivy planned to use you as a tool - a tool for the elimination of the Thieves Guild. So my question is simple: why are you working with the thief and liar Krivy?!~
    IF ~~ THEN REPLY ~Getting rid of thieves seems like a noble goal to me.~ GOTO GettingRidOfThieves
    IF ~~ THEN REPLY ~So my candidacy had no real chance of succeeding?~ GOTO NoChance
    IF ~~ THEN REPLY ~This does not answer why you were against my candidacy.~ GOTO NoAnswerCandidacy
END

IF ~~ THEN BEGIN GettingRidOfThieves
    SAY ~No, it is not! Krivy was just planning to use you to replace the current thieves thieves guild with his own. Of this I have no doubt.~
    IF ~~ THEN REPLY ~Now how did you come to this information?~ GOTO BeltExplains
    IF ~~ THEN REPLY ~So the devil you know is better for your rule?~ GOTO BeltExplains
END

IF ~~ THEN BEGIN NoChance
    SAY ~Without us? No, none, and absolutely negative chance.~
    IF ~~ THEN REPLY ~Damn, it was worth a try though.~ GOTO BeltExplains
END

IF ~~ THEN BEGIN NoAnswerCandidacy
    SAY ~There is nothing noble about being manipulated by a deceitful thief, so I ask once more: do you work for Krivy?!~
    IF ~~ THEN REPLY ~Why are you so hostile?~ GOTO BeltExplains
    IF ~~ THEN REPLY ~My affairs are of no concern to you.~ GOTO BeltExplains
END

IF ~~ THEN BEGIN BeltExplains
    SAY ~Do not avoid my question: are you or are you not working for Krivy?! The city is in a precarious situation; this Iron Crisis has weakened us severely, and I suspect that Krivy is working for someone who intends to do us even more harm.~
    IF ~~ THEN REPLY ~Actually, Krivy sent me to speak to you.~ GOTO TalkToBelt1
END

IF ~~ THEN BEGIN TalkToBelt1
    SAY ~Alright, perhaps I was too hasty in accusing you, so I suppose I owe you an apology. You are certainly a lesser threat, though you are not entirely forgiven. I still want you to prove that you are not aligned with Krivy. We need to know who he is working for and what his plans are. Use any methods desired, then kill him. A man like him cannot be allowed to live.~
    IF ~~ THEN REPLY ~I welcome this opportunity to prove myself. I shall find Krivy and extract from him the desired information.~ GOTO GoAfterKrivy
    IF ~~ THEN REPLY ~Whoa... going against Krivy, interrogation, murder. Is there another way to settle this matter?~ GOTO Negotiation1
    IF ~~ THEN REPLY ~Find another stooge for your dirty work.~ GOTO NoChoice
END

IF ~~ THEN BEGIN NoChoice
    SAY ~You forced my hand, <CHARNAME>. For the security of our city, I, the Grand Duke Belt, am forced to mete out punishment to you, <CHARNAME>. Though my actions are forced, I am no fool, and and I do recognize it was your actions which solved the Iron Crisis. Therefore, your punishment is just temporary exile for the duration of one month.~
    =
    ~Guards, take <PRO_HIMHER> away!~
    IF ~~ THEN DO
        ~SetGlobal("rqGDZZEnding","GLOBAL",1)
        SetGlobal("rqGDGoodPathStep5","GLOBAL",2)
        ActionOverride("rqenfist",StartDialogueNoSet([PC]))~
    EXIT
END

IF ~~ THEN BEGIN Negotiation1
    SAY ~This is not negotiable, <CHARNAME>. We need to know who is behind Krivy's actions. <CHARNAME>, are you with us for the greater good of our city, or are you against us and exiled?~
    IF ~~ THEN REPLY ~If you put it this way... I shall find out who is behind this.~ GOTO GoAfterKrivy
    IF ~~ THEN REPLY ~No. While I do not like Krivy's deceptions, I do not like you either. I shall not do anything for you.~ GOTO NoChoice
END

IF ~~ THEN BEGIN GoAfterKrivy
    SAY ~Fine. I am relieved we came to an understanding. We have trapped Krivy in the Undercellar; you just have to interrogate him.~
    IF ~~ THEN DO
        ~SetGlobal("rqGDGoodPathStep5","GLOBAL",2)
        SetGlobal("rqGDGoodPathStep6","GLOBAL",1)~
        UNSOLVED_JOURNAL ~Duke of Baldur's Gate:

        I have taken this opportunity to get back into the good graces of Duke Belt. I think it would be much better for the city, and I have no wish to become like Sarevok.~
    EXIT
END

