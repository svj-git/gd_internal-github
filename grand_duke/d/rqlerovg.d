BEGIN ~rqlerovg~
// Good Path
IF ~Global("rqGDGrandDukeQuest","GLOBAL",1) Global("rqGDGoodPathStep2","GLOBAL",1)~ THEN Opus
    SAY ~<CHARNAME>, Iachino has instructed me to invite you to parley with Krivy behind Sorcerous Sundries.~
    IF ~~ THEN REPLY ~Why has Iachino not introduced you himself?~ GOTO Meeting
    IF ~~ THEN REPLY ~How did you know where I was, Lerov?~ GOTO FoundCharname
END

IF ~~ THEN Meeting
    SAY ~I do not know his reasoning. Does it matter though?~
    IF ~~ THEN REPLY ~Maybe it does. I will meet with Krivy at Sorcerous Sundries.~ GOTO Accept
    IF ~~ THEN REPLY ~I have more important things to do right now.~ GOTO Reject
END

IF ~~ THEN FoundCharname
    SAY ~Finding the hero of Baldur's Gate is the easiest task I've been assigned to.~
    IF ~~ THEN REPLY ~I will be there.~ GOTO Accept
    IF ~~ THEN REPLY ~No, I have other matters tying my hands right now.~ GOTO Reject
END

IF ~~ THEN Reject
    SAY ~I know you will change your mind, <CHARNAME>, and when you do I will be at the Elfsong.~
    IF ~~ THEN DO
        %SetGlobal("rqGDGoodPathStep2","GLOBAL",10)
        MoveBetweenAreas("AR7705",[794.335],0)%
        UNSOLVED_JOURNAL ~Duke of Baldur's Gate:

        Rejected Lerov's attempt to meet with Krivy behind Sorcerous Sundries. If I change my mind, I can find Lerov in the Elfsong Tavern.~
    EXIT
END

IF ~~ THEN Accept
    SAY ~Do not tarry!~
    IF ~~ THEN DO
        %SetGlobal("rqGDGoodPathStep2","GLOBAL",2)
        ApplySpell(Myself,"WIZARD_HASTE")
        MoveToPoint([407.1913])%
        UNSOLVED_JOURNAL ~Duke of Baldur's Gate:

        After speaking to Lerov, who claims to act on Krivy's behalf, I have agreed to meet Krivy behind Sorcerous Sundries.~
    EXIT
END

IF ~Global("rqGDGrandDukeQuest","GLOBAL",1) Global("rqGDGoodPathStep2","GLOBAL",10)~ THEN BEGIN Reconsideration
    SAY ~Welcome back. Have you reconsidered parleying with Krivy? He wants to meet you near Sorcerous Sundries.~
    IF ~AreaCheck("AR7800")~ THEN REPLY ~I will meet with Krivy.~ GOTO Shall
    IF ~!AreaCheck("AR7800")~ THEN REPLY ~I will meet with Krivy.~ GOTO Shall2
    IF ~~ THEN REPLY ~What exactly do you want?~ GOTO Specifics
    IF ~~ THEN REPLY ~No, I do not want to deal with your shady master.~ GOTO Unusable
END

IF ~~ THEN BEGIN Specifics
    SAY ~You are to speak to Krivy about furthering your ducal election prospects.~
    IF ~~ THEN REPLY ~Yes, that sounds like something to my liking. Tell Krivy I will be there.~ GOTO Shall
    IF ~~ THEN REPLY ~It still holds no interest for me.~ GOTO Unusable
END

IF ~~ THEN BEGIN Unusable
    SAY ~What?! I mean I... Apologies, <CHARNAME>. Farewell.~
    IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN Shall
    SAY ~*He smiles* Then meet me behind Sorcerous Sundries.~
    IF ~~ THEN DO
        %SetGlobal("rqGDGoodPathStep2","GLOBAL",2)
        MoveToPoint([328.1889])%
        UNSOLVED_JOURNAL ~Duke of Baldur's Gate:

        After speaking to Lerov, who claims to act on Krivy's behalf, I have agreed to meet Krivy behind Sorcerous Sundries.~
    EXIT
END

IF ~~ THEN BEGIN Shall2
    SAY ~*He smiles* Go to the Eastern district and meet me behind Sorcerous Sundries.~
    IF ~~ THEN DO
        %SetGlobal("rqGDGoodPathStep2","GLOBAL",2)
        MoveBetweenAreas("AR7800",[328.1889],0)%
        UNSOLVED_JOURNAL ~Duke of Baldur's Gate:

        After speaking to Lerov, who claims to act on Krivy's behalf, I have agreed to meet Krivy behind Sorcerous Sundries.~
    EXIT
END

