// Nestor Low Lantern floor -1 AR7233

BEGIN ~rqrepr9~
// wyvern head
IF ~Global("rqGDGrandDukeQuest","GLOBAL",1)~ THEN BEGIN Repre9Intro
    SAY ~<CHARNAME>, my name is Nestor and I am happy to finally meet you in person. Krivy told me about your ambition. Are you ready for the mantle of leadership?~
    IF ~~ THEN REPLY ~Yes, I am.~ GOTO RequiredStuff
    IF ~~ THEN REPLY ~This is a mistake, I have other things to do.~ GOTO WhatTheHell
END

IF ~~ THEN BEGIN WhatTheHell
    SAY ~You are a fool to waste my time like this, <CHARNAME>.~
    IF ~~ THEN REPLY ~Apologies, let us resume.~ GOTO RequiredStuff
    IF ~~ THEN REPLY ~I must go, farewell.~ GOTO Idiots
END

IF ~~ THEN BEGIN Idiots
    SAY ~Bah! Idiots!~
    IF ~~ THEN DO
        %IncrementGlobal("rqGDVotes","GLOBAL",-1)
        EscapeArea()%
        SOLVED_JOURNAL ~Duke of Baldur's Gate: Nestor Vote lost

        Nestor tried to send me to kill a wyvern for him. If he has such needs, I could have just sent him to Cloakwood, where he could find plenty of such heads if he can prevent his bladder from leaking.~
    EXIT
END

IF ~~ THEN BEGIN RequiredStuff
    SAY ~Good... good... Krivy and I have known each other for a long time now, and I know he wants the fate of the city in capable hands like yours.~
    =
    ~Thus, my request: I want you to bring me the head of a wyvern.~
    IF ~~ THEN REPLY ~Why? Why do you need a wyvern's head?~ GOTO WhyNeedHead
    IF ~PartyHasItem("misc52")~ THEN REPLY ~I actually have such a head; I will give it to you in exchange for your support.~ GOTO AlreadyHaveHead
    IF ~~ THEN REPLY ~I will make the effort. Where can I find such a beast?~ GOTO IPromisWyvernHead
END

IF ~~ THEN BEGIN AlreadyHaveHead
    SAY ~You already have it? Strong hands make for a strong duke, I would say. Thank you, <CHARNAME>. I will certainly support your dukedom. Farewell.~
    IF ~~ THEN DO
        %TakePartyItem("misc52")
        IncrementGlobal("rqGDVotes","GLOBAL",1)
        AddExperienceParty(5000)
        EscapeArea()%
        SOLVED_JOURNAL ~Duke of Baldur's Gate: Nestor Vote gained

        I gave Nestor the head I have on me; what he will do with it, though, is a mystery to me.~
    EXIT
END

IF ~~ THEN BEGIN WhyNeedHead
    SAY ~There are many reasons. It is a test of your ability, and the head itself could be fashioned into a magical item if I recall correctly. Lastly, I do not want the duke to be weak.~
    IF ~~ THEN REPLY ~We are of the same mind on this. Where can I find these wyverns?~ GOTO IPromisWyvernHead
    IF ~PartyHasItem("misc52")~ THEN REPLY ~I actually have the wyvern's head you require.~ GOTO AlreadyHaveHead
    IF ~~ THEN REPLY ~Get someone else to risk <HISHER>'s neck!~ GOTO Idiots
END

IF ~~ THEN BEGIN IPromisWyvernHead
    SAY ~Cloakwood Forest is plagued with wyvern beasts. If you obtain a beast's head, bring it to Iachino. I do not have time to wait here. Farewell.~
    IF ~~ THEN DO
        %SetGlobal("rqGDRepreJob9","GLOBAL",1)
        EscapeArea()%
        SOLVED_JOURNAL ~Duke of Baldur's Gate: Nestor

        Kill wyvern for a vote, that's new to me. Either way, I am going to get the wyvern's head and bring it to Iachino.~
    EXIT
END
