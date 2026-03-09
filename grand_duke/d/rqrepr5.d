// Temur of Droliegen

BEGIN ~rqrepr5~
// I need a small favor. I could hire mercenaries, but when I found out that you could do it...
IF ~Global("rqGDGrandDukeQuest","GLOBAL",1)~ THEN BEGIN Repre5Intro
    SAY ~Finally, we meet, <CHARNAME>. I am Temur of Droliegen, and you may know my family's mercantile consortium. From what I have been told by Krivy, you wish to take on the burden of the Dukedom yourself?~
    IF ~~ THEN REPLY ~Yes, I am.~ GOTO Repre5IWantToBeDuke
    IF ~~ THEN REPLY ~No, I have changed my mind.~ GOTO Repre5Joke
END

IF ~~ THEN BEGIN Repre5IWantToBeDuke
    SAY ~Well, I have a quest for you to prove your honor.~
    IF ~~ THEN REPLY ~Well, then speak your mind, Temur.~ GOTO QuestWhatIsAllAbout
    IF ~~ THEN REPLY ~I am tired of honor and goodness. Get going!~ GOTO Repre5FinalRejection
END

IF ~~ THEN BEGIN Repre5Joke
    SAY ~What?! Is this some sort of joke?~
    IF ~~ THEN REPLY ~Yes, sincere apologies. For a moment, I confused you with someone else. Please continue with your proposal.~ GOTO QuestWhatIsAllAbout
    IF ~~ THEN REPLY ~I've had enough of doing other people's dirty work.~ GOTO Repre5FinalRejection
END

IF ~~ THEN BEGIN Repre5FinalRejection
    SAY ~Krivy will hear of this outrage!~
    IF ~~ THEN DO
        %IncrementGlobal("rqGDVotes","GLOBAL",-1)
        EscapeArea()%
        SOLVED_JOURNAL ~Duke of Baldur's Gate: Temur vote lost

        Pompous fool Temur got really mad when I rejected his proposal to do the work of his seneschal.~
    EXIT
END

IF ~~ THEN BEGIN QuestWhatIsAllAbout
    SAY ~Here is my proposal to you, <CHARNAME>. Bring death to the Ogre Magi that have ransacked my farms, and you will receive my support for your cause.~
    IF ~~ THEN REPLY ~Why don't you hire mercenaries to do this job? Why do you need me?~ GOTO Repre5Details
    IF ~~ THEN REPLY ~Sounds like you don't like to get your hands dirty. Why should I risk my neck if you or your seneschal aren't interested in fixing this situation?~ GOTO Repre5Details
END

IF ~~ THEN BEGIN Repre5Details
    SAY ~I could have hired mercenaries to drive them off my lands, but when Krivy convinced me to support you as duke, I immediately thought of you and how we could test your resolve.~
    IF ~~ THEN REPLY ~Very well, I will do this thing for you if you will support me.~ GOTO Repre5CameToAgreement
    IF ~~ THEN REPLY ~I don't think I wish to be supported by the likes of you.~ GOTO Repre5FinalRejection
END

IF ~~ THEN BEGIN Repre5CameToAgreement
    SAY ~Yes! I knew I could count on you. Report your success to Krivy or Iachino. Farewell.~
    IF ~~ THEN DO
        %SetGlobal("rqGDRepreJob5","GLOBAL",1)
        EscapeArea()%
        UNSOLVED_JOURNAL ~Duke of Baldur's Gate: Temur of Droliegen

        Looks like another burgher needs my help. This time, Ogre Magi are to be returned to the ground. The Ogre Magi are supposed to terrorize the farmlands northeast of Baldur's Gate. Iachino in the Elfsong Tavern knows about this task, and I am to speak to him when I wish to complete my task.~
    EXIT
END
