// Good path
BEGIN ~rqtrest~

IF ~Global("rqGDGoodPathStep3","GLOBAL",1)~ THEN BEGIN TrestIntro
    SAY ~Greetings citizen, what can Flaming Fist do for you?~
    IF ~~ THEN REPLY ~I want to find the man. He introduced himself as Krivy.~ GOTO Trest2
END

IF ~~ THEN BEGIN Trest2
    SAY ~Now, that is a very strange thing for you to want. Why, I would do that for you.~
    IF ~~ THEN REPLY ~(Lie) Duke Belt sent me. I am supposed to apprehend him for interrogation.~ GOTO DoNotMakeMeLaugh
    IF ~~ THEN REPLY ~I have a journal which mentions you.~ GOTO Interrogation
    IF ~CheckStatGT(LastTalkedToBy,11,WIS)~ THEN REPLY ~How did you know that Nemean, a quite experienced assassin, was in the city?~ GOTO NemeanAssassin
    IF ~~ THEN REPLY ~I just killed an assassin who had a journal in which your name is mentioned.~ GOTO Interrogation
END

IF ~~ THEN BEGIN NemeanAssassin
    SAY ~Huh? Ah, one of the guards recognized Nemean, so I have sent Fist after him to at least figure out what he's up to.~
    IF ~~ THEN REPLY ~Why don't I believe you?~ GOTO ThreatenTrest
END

IF ~~ THEN BEGIN DoNotMakeMeLaugh
    SAY ~Ha! You are in a position to dictate to Flaming Fist about Bhaalspawn, though if we find Krivy, you would be alerted via our messenger.~
    IF ~~ THEN REPLY ~How did you know that I am a progeny of Bhaal?~ GOTO NameOfCharname
END

IF ~~ THEN BEGIN Interrogation
    SAY ~I see. I do not know the whereabouts of this Krivy. If Fist finds him, we shall send a messenger to summon you here. The Fist will find him; do not worry.~
    IF ~~ THEN REPLY ~I will not suffer lies from you!~ GOTO ThreatenTrest
    IF ~~ THEN REPLY ~Fine, then you do that, but if you don't, Duke Belt will be most displeased.~ GOTO FistIsOnIT
    IF ~~ THEN REPLY ~If he shows up, then you do that.~ GOTO FistIsOnIT
END

IF ~~ THEN BEGIN ThreatenTrest
    SAY ~Whoa... there we are on the same side, you and I. We both serve the law here, so please calm down... <CHARNAME>.~
    IF ~~ THEN REPLY ~Funny, I do not remember telling you my name.~ GOTO NameOfCharname
END

IF ~~ THEN BEGIN NameOfCharname
    SAY ~Every Flaming Fist member knows you, <CHARNAME>. Please calm down; you seem to suspect treachery everywhere.~
    IF ~~ THEN REPLY ~Maybe I do, Trest. Farewell.~ GOTO WantedKrivy
    IF ~~ THEN REPLY ~I'll have my eye on you, Trest.~ GOTO WantedKrivy
END

IF ~~ THEN BEGIN FistIsOnIT
    SAY ~I shall inform Fist members of your search. We shall find him soon. Did you want something else from Fist?~
    IF ~~ THEN REPLY ~No, nothing. Farewell.~ DO
        ~SetGlobal("rqGDGoodPathStep3","GLOBAL",2)
        SetGlobal("rqGDGoodPathStep4","GLOBAL",1)~
    EXIT
END

IF ~~ THEN BEGIN WantedKrivy
    SAY ~If that is all you wished of me, I will be going to set up a hunt for this Krivy.~
    IF ~~ THEN DO
        ~SetGlobal("rqGDGoodPathStep3","GLOBAL",2)
        SetGlobal("rqGDGoodPathStep4","GLOBAL",1)
        EscapeArea()~
    EXIT
END

// Neutral path
IF ~Global("rqGDNeutralPathStep5","GLOBAL",3)~ THEN BEGIN ReleasePrisoners
    SAY ~Ah, so <CHARNAME> finally deigns to visit us. I have a task for you which, if accomplished, will determine whether you will live or not.~
    IF ~~ THEN REPLY ~What? I will not do anything for Flaming Fist, bozo. Do your worst!~ EXTERN ~rqbofist~ NotAuthorized
    IF ~~ THEN REPLY ~Why would Flaming Fist send me anywhere unless it is a death mission?~ EXTERN ~rqbofist~ NotAuthorized
    IF ~~ THEN REPLY ~Just tell me what you want.~ EXTERN ~rqbofist~ NotAuthorized
END

// GraelQuiet
IF ~~ THEN BEGIN Grael11
    SAY ~Be quiet, Grael! I am in command here. Now back to you, <CHARNAME>.~
    IF ~~ THEN GOTO BeQuietBounty
END

IF ~~ THEN BEGIN BeQuietBounty
    SAY ~We don't have to be enemies. All I want from you is to get rid of Alatos, and then you are free to go.~
    IF ~~ THEN REPLY ~I do not think I will do anything for you.~ GOTO RefusalTrest
    IF ~~ THEN REPLY ~Ha! Don't make me laugh, Flaming Fist pansy.~ GOTO RefusalTrest
    IF ~~ THEN REPLY ~Alatos? Who are you talking about?~ GOTO AlatosWho
    IF ~~ THEN REPLY ~And what would be my reward for doing so?~ GOTO RewardTrest
END

IF ~~ THEN BEGIN RefusalTrest
    SAY ~Have it your way, <CHARNAME>. For your crimes, you are to be expelled immediately from the city. Take <HIMHER> away!~
    IF ~~ THEN DO ~SetGlobal("rqGDZZEnding","GLOBAL",1)~ EXTERN ~rqenfist~ Alarm
END

IF ~~ THEN BEGIN AlatosWho
    SAY ~*Sigh* I do not know whether you are truthful or not. Regardless, you will go to East Baldur's Gate, just behind the building Keexie Tavern. There, you will find Alatos or be deported from the city immediately.~
    IF ~~ THEN REPLY ~If you put it that way, I'd rather kill him than be evicted.~ GOTO AcceptedTrest
    IF ~~ THEN REPLY ~Ah, yes. That Alatos. Well, I better get going to put his name in the dead book.~ GOTO AcceptedTrest
    IF ~~ THEN REPLY ~Why do you want him dead?~ GOTO ThereIsNoNeedToExplain
END

IF ~~ THEN BEGIN ThereIsNoNeedToExplain
    SAY ~There is no need for me to explain. You have two options: kill or leave.~
    IF ~~ THEN REPLY ~You have my word, Alatos and cronies will be dead very soon.~ GOTO AcceptedTrest
    IF ~~ THEN REPLY ~Find another lackey. I'd rather leave.~ GOTO RefusalTrest
END

IF ~~ THEN BEGIN RewardTrest
    SAY ~None. Duke Belt wants you out of the city, and this is the only way you can repair your standings. That said, thieves should be rich, and I am confident you will find something to loot in their lair.~
    IF ~~ THEN REPLY ~Better them than me. They will not survive my assault.~ GOTO AcceptedTrest
    IF ~~ THEN REPLY ~I have had enough of this city. I shall leave.~ GOTO RefusalTrest
END

IF ~~ THEN BEGIN AcceptedTrest
    SAY ~You have chosen a path through which both you and I will profit.~
    IF ~~ THEN DO
            ~SetGlobal("rqGDNeutralPathStep5","GLOBAL",4)
            SetGlobal("rqGDNeutralPathStep6","GLOBAL",1)
            SetGlobal("Password","GLOBAL",1)
            SetGlobal("rqGDThiefReinforce","GLOBAL",1)
            SetGlobal("BG_AttackedThieves","GLOBAL",1)
            EscapeArea()~
            UNSOLVED_JOURNAL ~Duke of Baldur's Gate:

            I do not like to be used like a pawn. Yet I know that killing Alatos in the Eastern district will clear out a lot of fog.~
        EXIT
END

IF ~!Global("rqGDEvilPathStep2","GLOBAL",1) !Global("rqGDGoodPathStep3","GLOBAL",1) !Global("rqGDEvilPathStep2","GLOBAL",2) !Global("rqGDEvilPathStep2","GLOBAL",3)~ THEN BEGIN NothingIWant
    SAY ~Is there something you wanted, citizen?~
    IF ~Global("rqGDGrandDukeQuest","GLOBAL",1)~ THEN REPLY ~No, no, nothing I can think of.~ EXIT
END

// Trest Evil route
IF ~Global("rqGDEvilPathStep2","GLOBAL",1) ReputationLT(LastTalkedToBy,3) AreaCheck("AR8000")~ THEN BEGIN LowReputation
    SAY ~Flaming Fist, given your reputation, has reinforced their citadel. Therefore, if you wish this operation to succeed, you need to increase your reputation.~
    IF ~~ THEN EXIT
END

IF ~Global("rqGDEvilPathStep2","GLOBAL",1) ReputationGT(LastTalkedToBy,3) AreaCheck("AR8000")~ THEN BEGIN TrestEvilIntro
    SAY ~Great, you are here. I was just about to send a messenger to Krivy.~
    IF ~~ THEN REPLY ~Well, I am here. Why don't you explain what exactly you are planning here?~ GOTO StormTheCitadel
    IF ~~ THEN REPLY ~Why are we attacking the Flaming Fist Citadel?~ GOTO StormTheCitadel
END

IF ~~ THEN BEGIN StormTheCitadel
    SAY ~In short, we are to storm the citadel, kill everyone inside, plant evidence blaming the Thieves Guild, and escape.~
    IF ~~ THEN REPLY ~That is way too terse. Why don't you tell us how exactly we are to accomplish this?~ GOTO CrateOfDeath
END

IF ~~ THEN BEGIN CrateOfDeath
    SAY ~I have a crate here in which we have captured known low-ranking goons of Alatos. Move the crate inside and kill them inside. The corpses of these known members of Alatos' guild will help me steer the investigation where I want it to go. One last thing: kill the current commander, Kerboven.~
    IF ~~ THEN REPLY ~What about commoners seeing me entering and leaving the citadel?~ GOTO CommonerSee
END

IF ~~ THEN BEGIN CommonerSee
    SAY ~I will announce that I have sent you to the citadel to prevent it from being taken over by Alatos.~
    IF ~~ THEN REPLY ~So, that means you will be helping out through this?~ GOTO GuardingExit
    IF ~~ THEN REPLY ~What will you be doing while we slaughter your former comrades?~ GOTO GuardingExit
END

IF ~~ THEN BEGIN GuardingExit
    SAY ~Guarding the exit. If any Flaming Fist member escapes, our plan will be ruined.~
    IF ~~ THEN REPLY ~Your plan is sound. We shall execute your operation.~ GOTO Agreement
    IF ~~ THEN REPLY ~If your plan fails, I shall hold you accountable.~ GOTO Agreement
END

IF ~~ THEN BEGIN Agreement
    SAY ~Let our actions write history.~
    IF ~~ THEN DO
            %SetGlobal("rqGDEvilPathStep2","GLOBAL",2)
            GiveItemCreate("rqcrat01",LastTalkedToBy,1,0,0)
            GiveItemCreate("rqpotn61",LastTalkedToBy,1,0,0)
            %
            UNSOLVED_JOURNAL ~Duke of Baldur's Gate:

            I am to assault the Flaming Fist citadel, which seems a daunting task, yet I am confident I will succeed. My mission in the citadel has three goals: Kill Kerboven, kill all Flaming Fists on the first and second floors, and leave the corpses of Alatos's men, which I am carrying inside a crate given by Trest.~
    EXIT
END

// Fist Citadel progress
IF ~Global("rqGDEvilPathStep2","GLOBAL",2)~ THEN BEGIN TrestEvilIntro
    SAY ~Is it done? Is the citadel devoid of Flaming Fist? There should be ten men here, and six on the first floor. One Flaming Fist who works for us I have ordered to guard the cellar; please spare him.~
    IF ~Global("rqGDEvilFiCitadelRogues","GLOBAL",1)~ THEN REPLY ~I have killed thieves on the first floor to blame Alatos on the first floor.~ GOTO ThievesDead
    IF ~Global("rqGDEvilCitadelF1","GLOBAL",0) Dead("rqfistd9") Dead("rqfiste0") Dead("rqfiste1") Dead("rqfiste2") Dead("rqfiste3") Dead("rqfisth4") Dead("rqfisth5") Dead("rqfisth6") Dead("rqfisti7") Dead("rqfisti8") Dead("rqbofist")~ THEN REPLY ~The Fist on the first floor has been eliminated.~ GOTO FirstFloor
    IF ~Global("rqGDEvilCitadelF2","GLOBAL",0) Dead("rqfistf1") Dead("rqfistf2") Dead("rqfistf3") Dead("rqfistk1") Dead("rqfistk2") Dead("rqfistk3") Dead("rqkerb") ~ THEN REPLY ~I have killed Kerboven and his bodyguards.~ GOTO SecondFloor
    IF ~~ THEN REPLY ~No, I have not.~ GOTO Going
    IF ~Dead("rqkerb") Dead("rqfistd9") Dead("rqfiste0") Dead("rqfiste1") Dead("rqfiste2") Dead("rqfiste3") Dead("rqfisth4") Dead("rqfisth5") Dead("rqfisth6") Dead("rqfisti7") Dead("rqfisti8") Dead("rqbofist") Dead("rqfistf1") Dead("rqfistf2") Dead("rqfistf3") Dead("rqfistk1") Dead("rqfistk2") Dead("rqfistk3") Global("rqGDEvilCitadelThieves","GLOBAL",1)~ THEN REPLY ~Yes, we have killed all of them.~ GOTO Finnito
END

IF ~~ THEN BEGIN FirstFloor
    SAY ~Good, now speak to me if you finish another part of your task.~
    IF ~~ THEN DO ~SetGlobal("rqGDEvilCitadelF1","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN SecondFloor
    SAY ~I am impressed; now speak to me again if you have finished another part.~
    IF ~~ THEN DO ~SetGlobal("rqGDEvilCitadelF2","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN ThievesDead
    SAY ~This is a requirement for me to blame Alatos. Speak to me again when you are done more.~
    IF ~~ THEN DO ~SetGlobal("rqGDEvilCitadelThieves","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN Going
    SAY ~Then why are you wasting time speaking to me?~
    IF ~~ THEN EXIT
END

IF ~Global("rqGDEvilFiCitadel","GLOBAL",3)~ THEN BEGIN Finnito
    SAY ~Brilliant. The operation is complete. We now have the Flaming Fist Citadel under our control, but do not think you will be able to go on a rampage. We only control the citadel; not the entire Fist. Though you get arrested, I will let you go.~
    =
    ~Go to Blade and Stars and report our success to Krivy.~
    IF ~ReputationLT(LastTalkedToBy,6)~ THEN DO
        %ReputationSet(6)
        SetGlobal("rqGDEvilPathStep3","GLOBAL",1)
        SetGlobal("rqGDEvilPathStep2","GLOBAL",3)
        EraseJournalEntry(~Duke of Baldur's Gate:

            I am to assault the Flaming Fist citadel, which seems a daunting task, yet I am confident I will succeed. My mission in the citadel has three goals: Kill Kerboven, kill all Flaming Fists on the first and second floors, and leave the corpses of Alatos's men, which I am carrying inside a crate given by Trest.~)%

        UNSOLVED_JOURNAL ~Duke of Baldur's Gate:

        Flaming Fist Citadel is under our control. It's a pity I cannot just do whatever evil deed I want without the Fist still interfering. Success is success; I need to speak to Krivy in Blade and Stars about further actions.~
    EXIT
    IF ~ReputationGT(LastTalkedToBy,5)~ THEN DO
        %SetGlobal("rqGDEvilPathStep3","GLOBAL",1)
        SetGlobal("rqGDEvilPathStep2","GLOBAL",3)
        EraseJournalEntry(~Duke of Baldur's Gate:

            I am to assault the Flaming Fist citadel, which seems a daunting task, yet I am confident I will succeed. My mission in the citadel has three goals: Kill Kerboven, kill all Flaming Fists on the first and second floors, and leave the corpses of Alatos's men, which I am carrying inside a crate given by Trest.~)%
        UNSOLVED_JOURNAL ~Duke of Baldur's Gate:

        Flaming Fist Citadel is under our control. It's a pity I cannot just do whatever evil deed I want without the Fist still interfering. Success is success; I need to speak to Krivy in Blade and Stars about further actions.~
    EXIT
END
