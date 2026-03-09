// Gemerkan

BEGIN ~rqrepr2~

IF ~Global("rqGDGrandDukeQuest","GLOBAL",1)~ THEN BEGIN WelcomeCHARNAME
    SAY ~Greetings, <CHARNAME>. My name is Gemerkan, a Burgher. We make pitch, amongst other things, if that would be of interest to you. What should interest you, though, is that Krivy is our common friend.~
    IF ~~ THEN REPLY ~So what do you want from me?~ GOTO KnowingCHARNAMEName
    IF ~~ THEN REPLY ~How do you know my name?~ GOTO NothingIsFree
    IF ~~ THEN REPLY ~No, I do not want to be your pawn.~ GOTO NotInterestedAtAll
END

IF ~~ THEN BEGIN KnowingCHARNAMEName
    SAY ~Yes, nothing is free. In exchange for my support, I wish for you to perform a service for me.~
    IF ~~ THEN REPLY ~What exactly do you want from me?~ GOTO MainTask1
END

IF ~~ THEN BEGIN NothingIsFree
    SAY ~Everybody important knows your name. I am pressed for time, so let's get down to decisive things, shall we?~
    IF ~~ THEN REPLY ~So what do you want for your support?~ GOTO MainTask1
END

IF ~~ THEN BEGIN MainTask1
    SAY ~Bring me the corpse of Sirine. She should have wounds on her arm. There is a lighthouse in the area where I wounded her, so I would suggest starting your search from there.~
    IF ~~ THEN REPLY ~For use as an alchemical ingredient?~ GOTO AlchemySirine
    IF ~~ THEN REPLY ~Uh, alright.~ GOTO AlchemySirine
    IF ~~ THEN REPLY ~I have better things to do.~ GOTO NotInterestedAtAll
END

IF ~~ THEN BEGIN NotInterestedAtAll
    SAY ~What kind of foolishness has possessed you!~
    IF ~~ THEN DO
        %IncrementGlobal("rqGDVotes","GLOBAL",-1)
        AddExperienceParty(500)
        EscapeArea()%
        SOLVED_JOURNAL ~Duke of Baldur's Gate: Gemerkan vote lost

        Gemerkan, yet another city dweller, wanted to offload his burdens onto me. Though I wonder why or how a member of a pitch-making family would wound Sirine; that remains a mystery to me.~
    EXIT
END

IF ~~ THEN BEGIN AlchemySirine
    SAY ~I have wounded her with my weapon, and I wish to study its impact.~
    IF ~~ THEN REPLY ~Agreed. Then I will do this in exchange for your support.~ GOTO FinalWordOf
END

IF ~~ THEN BEGIN FinalWordOf
    SAY ~Oh, and before I forget. Bring the body to Krivy or Iachino; they will take care of our matter from there.~
    IF ~~ THEN DO
        %SetGlobal("rqGDRepreJob2","GLOBAL",1)
        EscapeArea()%
        UNSOLVED_JOURNAL ~Duke of Baldur's Gate: Gemerkan

        Eligible voters want something for their votes; I should have known. This one, though, is relatively straightforward: kill Sirine and bring her body to Iachino or Krivy in the Elfsong Tavern. Sirine should have wounds on her body, and she should be located in the lighthouse area near the coastline.~
    EXIT
END

