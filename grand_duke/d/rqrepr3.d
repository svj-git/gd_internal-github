// Melwis

BEGIN ~rqrepr3~

IF ~Global("rqGDGrandDukeQuest","GLOBAL",1)~ THEN BEGIN Repre3Intro
    SAY ~<LADYLORD> <CHARNAME>: I am Melwis. I will represent the interests of the Kelthor family in the potential collaboration between the Kelthors and you.~
    IF ~~ THEN REPLY ~Let's talk about support from your family.~ GOTO Assurances
    IF ~~ THEN REPLY ~Representative? Why didn't anybody from the Kelthor family come here to talk to me?~ GOTO Assurances
END

IF ~~ THEN BEGIN Assurances
    SAY ~I assure you, <CHARNAME>, that I am here on behalf of Argraar, Elder of the Kelthor family. If you are so inclined, I can produce written proof of my qualifications to speak to you as a representative of Lord Argraar.~
    IF ~~ THEN REPLY ~Yes, show me that letter of yours.~ GOTO ProofOf
    IF ~~ THEN REPLY ~No, that is not necessary. Tell me what you require of me.~ GOTO NoProofNeeded
    IF ~~ THEN REPLY ~Well, you can tell this *Elder* that he has insulted me by sending his underling instead of talking to me himself.~ GOTO RejectionOf3Repre
END

IF ~~ THEN BEGIN ProofOf
    SAY ~Please see this letter; I am sure it will dispel any doubt.~
    IF ~~ THEN DO ~GiveItem("rqletre3", Player1)~ GOTO ProofGiven
END

IF ~~ THEN BEGIN NoProofNeeded
    SAY ~I thank you for your trust. Lord Argraar wishes to eliminate certain Merchelen who was last seen in the Low Lantern. However, you do not need to kill him; you only need to intimidate him into leaving the city.~
    IF ~~ THEN REPLY ~Alright, that sounds pretty simple. I will do it.~ GOTO AgreedToTask3
    IF ~~ THEN REPLY ~I really don't like your Lord's plot, and I shall not take part in it.~ GOTO RejectionOf3Repre
    IF ~~ THEN REPLY ~If I can convince this Merchelen to leave the city without resorting to violence, then I will do this.~ GOTO AgreedToTask3
    IF ~~ THEN REPLY ~No deal. I will not sully my reputation with these nefarious plots.~ GOTO RejectionOf3Repre
END

IF ~~ THEN BEGIN RejectionOf3Repre
    SAY ~Apologies, I shall not waste your time. Farewell.~
    IF ~~ THEN DO
        %IncrementGlobal("rqGDVotes","GLOBAL",-1)
        AddExperienceParty(500)
        EscapeArea()%
        SOLVED_JOURNAL ~Duke of Baldur's Gate: Kelthor family represented by Melwis: vote lost

        Melwis a Kelthor family representative wanted me to enact revenge deal with Merchelen, but I rejected him.~
    EXIT
END

IF ~~ THEN BEGIN ProofGiven
    SAY ~As you can see, I am acting with the full authority of my Lord.~
    IF ~~ THEN REPLY ~Perhaps it is genuine, perhaps not. What does Lord Argraar want from me?~ GOTO NoProofNeeded
END

IF ~~ THEN BEGIN AgreedToTask3
    SAY ~If you succeed with this task, please report it to Iachino. We shall have no further contact from now on.~
    IF ~~ THEN DO
        %SetGlobal("rqGDRepreJob3","GLOBAL",1)
        EscapeArea()%
        UNSOLVED_JOURNAL ~Duke of Baldur's Gate: Melwis, a Kelthor family representative

        Melwis, a representative for the Kelthor family, wants me to deal with Merchelen. I should intimidate him into leaving the city, though I do not think Melwis would mind if Merchelen dies. Iachino in the Elfsong is the contact person if I wish to complete this quest.~
    EXIT
END

// Merchelen
BEGIN ~rqmerch~

IF ~Global("rqGDRepreJob3","GLOBAL",1)~ THEN BEGIN MerchelenIntro
    SAY ~What do you want?~
    IF ~~ THEN REPLY ~Do you know someone from the Kelthor family?~ GOTO AgraarPales
    IF ~~ THEN REPLY ~Your head on a platter!~ GOTO DirectThreat
    IF ~~ THEN REPLY ~Lord Argraar sends his regards, Merchelen.~ GOTO AgraarRegards
END

IF ~~ THEN BEGIN DirectThreat
    SAY ~Well, we'll see who will be dying here!~
    IF ~~ THEN DO ~SetGlobal("rqGDRepreJob3","GLOBAL",2) Enemy()~ EXIT
END

IF ~~ THEN BEGIN AgraarRegards
    SAY ~How did he figure out where I am? Listen, I have some gold. Why don't you just look the other way for this heavy pouch?~
    IF ~~ THEN REPLY ~Listen, Merchelen, I do not need your gold. Why don't you just leave this city and never come back, and I will not hurt you.~ GOTO FewDrinks
    IF ~~ THEN REPLY ~Do you seriously think that some pittance will persuade me to let you live?~ GOTO RunForYourLife
    IF ~~ THEN REPLY ~No, I think I'd rather kill you.~ GOTO DirectThreat
    IF ~~ THEN REPLY ~Can you just keep a low profile and disappear? The Kelthors are after you.~ GOTO DoNotLeave
END

IF ~~ THEN BEGIN AgraarPales
    SAY ~*Suddenly, Merchelen's face pales* I have some gold. Would that be enough to let me escape from the city?~
    IF ~~ THEN REPLY ~Give me the gold and run for your life!~ GOTO RunForYourLife
    IF ~~ THEN REPLY ~I think your turning up dead in the bay is a better solution for Lord Argraar.~ GOTO DirectThreat
END

IF ~~ THEN BEGIN FewDrinks
    SAY ~Oh, I see. Can I just get a few drinks from the bartender? I am as thirsty as the desert.~
    IF ~CheckStatLT(LastTalkedToBy,10,WIS)~ THEN REPLY ~Alright, but make sure you leave afterward!~ GOTO DoNotLeave
    IF ~CheckStatGT(LastTalkedToBy,9,WIS)~ THEN REPLY ~Do you think I am stupid?~ GOTO RunForYourLife
END

IF ~~ THEN BEGIN DoNotLeave
    SAY ~The Kelthors scare me. After a few drinks, I will disappear from this city forever.~
    IF ~~ THEN DO ~SetGlobal("rqGDRepreJob3","GLOBAL",10)~ EXIT
END

IF ~~ THEN BEGIN RunForYourLife
    SAY ~*Merchelen throws a pouch filled with iron coins at you and flees*~
    IF ~~ THEN DO ~SetGlobal("rqGDRepreJob3","GLOBAL",2) ApplySpellRES("runrun", Myself) EscapeArea()~ EXIT
END
