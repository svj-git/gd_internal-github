BEGIN ~rqiachin~

IF ~Global("rqGDGrandDukeQuest","GLOBAL",1) GlobalLT("rqGDVotes","GLOBAL",10)~ THEN BEGIN IntroIachino
    SAY ~Iachino is Krivy's right hand man. What can Iachino do for you?~
    IF ~~ THEN REPLY ~Where is Krivy? I need to speak to him.~ GOTO WhereIsKrivy
    IF ~~ THEN REPLY ~Who are you?~ GOTO Iachino
    IF ~~ THEN REPLY ~Perhaps you could help me complete one of my tasks.~ GOTO EndingOfJobs
    IF ~Global("rqGDVotes","GLOBAL",10)~ THEN REPLY ~I think I have completed all the tasks which landowners gave me. Can you send for Krivy?~ GOTO KrivyIsNotHere
END

// Ending reprejobs: 2, 3, 4, 5, 9,
IF ~~ THEN BEGIN EndingOfJobs
    SAY ~Tasks, tasks... Let's see which you have completed.~
    IF ~Global("rqGDRepreJob2","GLOBAL",1) PartyHasItem("rqsirine")~ THEN REPLY ~I have come to deliver the body of Sirine, which a certain Gemerkan requested for his support.~ GOTO RepreJob2
    IF ~Global("rqGDRepreJob3","GLOBAL",2)~ THEN REPLY ~I have come to finalize matters on behalf of a certain supporter of mine, namely Lord Argraar of the Kelthor family.~ GOTO RepreJob3
    IF ~Global("rqGDRepreJob4","GLOBAL",1) Dead("rqgroth")~ THEN REPLY ~Gvalas' quest, I have finished it.~ GOTO RepreJob4
    IF ~Global("rqGDRepreJob4","GLOBAL",1) Global("rqGDGrothukDead","GLOBAL",1)~ THEN REPLY ~Gvalas' quest,I have finished it.~ GOTO RepreJob4
    IF ~Global("rqGDGrothukEscape","GLOBAL",1)~ THEN REPLY ~Gro'Thuk has escaped.~ GOTO RepreJob4Failed
    IF ~Global("rqGDRepreJob5","GLOBAL",1) Dead("rqomagi1")~ THEN REPLY ~I have killed the Ogre Magi on behalf of Temur of Droliegen.~ GOTO RepreJob5
    IF ~Global("rqGDRepreJob9","GLOBAL",1) PartyHasItem("misc52")~ THEN REPLY ~I brought the Wyvern head for Nestor.~ GOTO RepreJob9
    IF ~~ THEN REPLY ~My mistake,I have not completed any tasks.~ EXIT
END

IF ~~ THEN BEGIN WhereIsKrivy
    SAY ~Krivy left because he had some important matters to attend to. You can finish any tasks the voters gave you with Iachino.~
    IF ~~ THEN REPLY ~I need to talk to him.~ GOTO Unavailable
    IF ~~ THEN REPLY ~Right, let me think,I might have completed some tasks.~ GOTO EndingOfJobs
END

IF ~~ THEN BEGIN Unavailable
       SAY ~Terribly sorry, but he is not here. Perhaps you could return later when Krivy might be present?~
    IF ~~ THEN REPLY ~Will do that. Farewell.~ EXIT
END

IF ~~ THEN BEGIN Iachino
    SAY ~Iachino is Krivy's right hand man. The landowners should have mentioned Iachino as the man to talk to if Krivy was unavailable.~
    IF ~~ THEN REPLY ~Right, some of them did. Can I complete my quests with you?~ GOTO EndingOfJobs
END

// Sirine corpse -- 2 --
IF ~~ THEN BEGIN RepreJob2
    SAY ~Yes, yes, thank you for finishing this unpleasant business with corpses. Iachino hopes no one will make such requests in the future.~
    IF ~~ THEN DO
        %IncrementGlobal("rqGDVotes","GLOBAL",1)
        SetGlobal("rqGDRepreJob2","GLOBAL",2)
        TakePartyItem("rqsirine")
        AddExperienceParty(5000)
        EraseJournalEntry(~Duke of Baldur's Gate: Gemerkan

        Eligible voters want something for their votes; I should have known. This one, though, is relatively straightforward: kill Sirine and bring her body to Iachino or Krivy in the Elfsong Tavern. Sirine should have wounds on her body, and she should be located in the lighthouse area near the coastline.~)%
        SOLVED_JOURNAL ~Duke of Baldur's Gate: Gemerkan vote gained

        Weird thing, this Sirine affair, but it secures my vote from Gemerkan.~
    EXIT
END

// Merchelen in Low Lantern --- 3 ---
IF ~~ THEN BEGIN RepreJob3
    SAY ~Have you dealt with Merchelen? Is he dead or has just left the city?~
    IF ~~ THEN REPLY ~My mistake, I still need to deal with Merchelen.~ EXIT
    IF ~Dead("rqmerch")~ THEN REPLY ~Yes, he is dead. You can report this to Krivy.~
    DO %SetGlobal("rqGDRepreJob3","GLOBAL",3)
        IncrementGlobal("rqGDVotes","GLOBAL",1)
        AddExperienceParty(5000)
        EraseJournalEntry(~Duke of Baldur's Gate: Melwis, a Kelthor family representative

        Melwis, a representative for the Kelthor family, wants me to deal with Merchelen. I should intimidate him into leaving the city, though I do not think Melwis would mind if Merchelen dies. Iachino in the Elfsong is the contact person if I wish to complete this quest.~)%
        SOLVED_JOURNAL ~Duke of Baldur's Gate: Melwis Kelthor family representative

        Dead Merchelen means a vote from Agraar.~
        GOTO MoveOn
    IF ~!Dead("rqmerch") Global("rqGDRepreJob3","GLOBAL",2)~ THEN REPLY ~I have forced him out of the city. He won't bother Lord Agraar again unless he changes his mind.~
    DO %SetGlobal("rqGDRepreJob3","GLOBAL",3)
        IncrementGlobal("rqGDVotes","GLOBAL",1)
        AddExperienceParty(5000)
        EraseJournalEntry(~Duke of Baldur's Gate: Melwis, a Kelthor family representative

        Melwis, a representative for the Kelthor family, wants me to deal with Merchelen. I should intimidate him into leaving the city, though I do not think Melwis would mind if Merchelen dies. Iachino in the Elfsong is the contact person if I wish to complete this quest.~)%
        SOLVED_JOURNAL ~Duke of Baldur's Gate: Melwis Kelthor family representative

        Scaring Merchelen was relatively easy, as he was already afraid of Kelthors.~
        GOTO MoveOn
    IF ~Global("rqGDRepreJob3","GLOBAL",10)~ THEN REPLY ~I told him to leave, and he promised to do so. Either way, he was definitely scared of Kelthors.~ GOTO MoveOnFailed
END

// Gvalas Gro'Thuk job failed ---- 4 ---- failed
IF ~~ THEN BEGIN RepreJob4Failed
    SAY ~Iachino is very unhappy with your incompetence, and Gvalas will be as well.~
    IF ~~ THEN DO
        %EraseJournalEntry(~Duke of Baldur's Gate: Gvalas

        The father of the murdered child wants to exact his revenge on certain Gro'Thuk. If I am not convinced by the father's pleas, I could confirm Gro'Thuk's guilt with the Bounty Officer at the Flaming Fist Citadel. I do not need to find Gvalas to report my success. Iachino is the person to speak to if I want to receive my vote. Iachino can be found in the Elfsong Tavern in Baldur's Gate.~)
        SetGlobal("rqGDRepreJob4","GLOBAL",3)
        AddExperienceParty(5000)
        IncrementGlobal("rqGDVotes","GLOBAL",-1)%
        SOLVED_JOURNAL ~Duke of Baldur's Gate: Gvalas vote lost

        Letting Gro'Thuk escape was a pretty stupid, avoidable mistake.~
    EXIT
END

IF ~~ THEN BEGIN MoveOn
    SAY ~Great, you just moved our chess pieces a little closer to your goal. Parlay with Iachino when you have accomplished another task..~
    IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN MoveOnFailed
    SAY ~You might have scared him, but Merchelen never left, and one of Kelthor's men got drunk at the Low Lantern. To cut to the chase, Merchelen ran away, but Kelthor's servant was injured. As result, we just lost Lord Agraar's vote.~
    IF ~~ THEN DO ~AddExperienceParty(1000) IncrementGlobal("rqGDVotes","GLOBAL",-1)~ EXIT
END

// assasination make it look like accident ---- 4 ----
IF ~~ THEN BEGIN RepreJob4
    SAY ~Yes, yes, Iachino recalls this matter as more delicate than the others... Have you disposed of his corpse in such manner that no one can find his body, or did you make it look like an accident?~
    IF ~Global("rqGDGrothukDead","GLOBAL",1)~ THEN REPLY ~Gro'Thuk is swimming with the fishes.~ GOTO GoodEnd
    IF ~Dead("rqgroth")~ THEN REPLY ~We killed Gro'Thuk with our swords and spells.~ GOTO BadEnd
    IF ~Global("rqGDGrothukEscape","GLOBAL",1)~ THEN REPLY ~Unfortunately, we have allowed Gro'Thuk to escape.~ GOTO BadEnd
END

IF ~~ THEN BEGIN GoodEnd
    SAY ~Iachino knew this would be an easy task for you. Speak to Iachino again when you have finished the other tasks.~
    IF ~~ THEN DO
        %SetGlobal("rqGDRepreJob4","GLOBAL",2)
        IncrementGlobal("rqGDVotes","GLOBAL",1)
        AddExperienceParty(5000)
        EraseJournalEntry(~Duke of Baldur's Gate: Gvalas

        The father of the murdered child wants to exact his revenge on certain Gro'Thuk. If I am not convinced by the father's pleas, I could confirm Gro'Thuk's guilt with the Bounty Officer at the Flaming Fist Citadel. I do not need to find Gvalas to report my success. Iachino is the person to speak to if I want to receive my vote. Iachino can be found in the Elfsong Tavern in Baldur's Gate.~)%
        SOLVED_JOURNAL ~Duke of Baldur's Gate: Gvalas vote gained

        It is all about the dosage, and Gro'Thuk has found out that water can be poisonous in large quantities.~
    EXIT
END

IF ~~ THEN BEGIN BadEnd
    SAY ~Unfortunately, Iachino hopes this will not come back to haunt us.~
    IF ~~ THEN DO
        %SetGlobal("rqGDRepreJob4","GLOBAL",2)
        AddExperienceParty(5000)
        EraseJournalEntry(~Duke of Baldur's Gate: Gvalas

        The father of the murdered child wants to exact his revenge on certain Gro'Thuk. If I am not convinced by the father's pleas, I could confirm Gro'Thuk's guilt with the Bounty Officer at the Flaming Fist Citadel. I do not need to find Gvalas to report my success. Iachino is the person to speak to if I want to receive my vote. Iachino can be found in the Elfsong Tavern in Baldur's Gate.~)%
        SOLVED_JOURNAL ~Duke of Baldur's Gate: Gvalas vote gained

        Gro'Thuk is dead, and hopefully Gvalas will be unable to discover that his death did not look like an accident.~
    EXIT
END

// Ogre Magi slaughter ----- 5 -----
IF ~~ THEN BEGIN RepreJob5
    SAY ~Disgusting race, these Ogres are... the less there are, the better off our world is.~
    IF ~~ THEN DO ~AddExperienceParty(5000)~ REPLY ~I take this will secure Temur's vote.~ GOTO YesItWill
END

IF ~~ THEN BEGIN YesItWill
    SAY ~Yes, it will. Speak to Iachino when you have done more work.~
    IF ~~ THEN DO
        %SetGlobal("rqGDRepreJob5","GLOBAL",2)
        IncrementGlobal("rqGDVotes","GLOBAL",1)
        EraseJournalEntry(~Duke of Baldur's Gate: Temur of Droliegen

        Looks like another burgher needs my help. This time, Ogre Magi are to be returned to the ground. The Ogre Magi are supposed to terrorize the farmlands northeast of Baldur's Gate. Iachino in the Elfsong Tavern knows about this task, and I am to speak to him when I wish to complete my task.~)%
        SOLVED_JOURNAL ~Duke of Baldur's Gate: Temur of Droliegen vote gained

        Liberating occupied farmlands from Ogre Mages is quest worthy of hero tales. I should commission bard to write song about me.~
    EXIT
END

// Wyvern Head --------- 9 ---------
IF ~~ THEN BEGIN RepreJob9
    SAY ~Fearsome beast, this wyvern is. One does have to wonder if its head could be made into some magical item. Iachino needs to put his head into a secure container. Speak to Iachino if you want to complete another quest.~
    IF ~~ THEN DO
        %IncrementGlobal("rqGDVotes","GLOBAL",1)
        TakePartyItem("misc52")
        SetGlobal("rqGDRepreJob9","GLOBAL",2)
        EraseJournalEntry(~Duke of Baldur's Gate: Nestor

        Kill Wyvern for a vote that is new to me. Either way, I am going to get the Wyvern's head and bring it to Iachino.~)%
    EXIT
END

// Done with all small quests
IF ~Global("rqGDGrandDukeQuest","GLOBAL",1) Global("rqGDVotes","GLOBAL",10)~ THEN BEGIN DoneAllQuestsStage1
    SAY ~You have gained all votes from our supporters i think is time for you to speak to Krivy. For our and your security Krivy is waiting for you outside.~
    IF ~~ THEN GOTO KrivyIsNotHere
END

IF ~~ THEN BEGIN KrivyIsNotHere
    SAY ~Oh, and lest I forget... Please take this as a gesture from our supporters.~
    IF ~Alignment(Player1,MASK_EVIL)~ THEN DO ~GiveItem("book05",Player1)~ GOTO KrivyIsNotHereE
    IF ~Alignment(Player1,MASK_GOOD)~ THEN DO ~GiveItem("rqbrac04",Player1)~ GOTO KrivyIsNotHereG
    IF ~Alignment(Player1,MASK_GENEUTRAL)~ THEN DO ~GiveItem("rqbelt04",Player1)~ GOTO KrivyIsNotHereN
END

IF ~~ THEN BEGIN KrivyIsNotHereE
    SAY ~Bloody Lerov left without a word; he should have been carrying a message for Krivy.~
    IF ~~ THEN DO
        %EscapeAreaObject("Exit7800")%
        UNSOLVED_JOURNAL ~Duke of Baldur's Gate:

        I wanted to speak to Krivy, so Iachino set out to arrange our parlay. In the meantime, I should speak to a certain man who waits for me outside of Elfsong.~
    EXIT
END

IF ~~ THEN BEGIN KrivyIsNotHereG
    SAY ~Old reliable Iachino is already on it.~
    IF ~~ THEN DO
        %EscapeAreaObject("Exit7800")%
        UNSOLVED_JOURNAL ~Duke of Baldur's Gate:

        I wanted to speak to Krivy, so Iachino set out to arrange our parlay. In the meantime, I should speak to a certain man who waits for me outside of Elfsong.~
    EXIT
END

IF ~~ THEN BEGIN KrivyIsNotHereN
    SAY ~Old reliable Iachino is already on it.~
    IF ~~ THEN DO
        %EscapeAreaObject("Exit7800")%
        UNSOLVED_JOURNAL ~Duke of Baldur's Gate:

        I wanted to speak to Krivy, so Iachino set out to arrange our parlay. In the meantime, I should speak to a certain man who waits for me outside of Elfsong.~
    EXIT
END




