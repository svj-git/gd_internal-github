// Gvalas

BEGIN ~rqrepr4~

IF ~Global("rqGDGrandDukeQuest","GLOBAL",1)~ THEN BEGIN Repre4Intro
    SAY ~<LADYLORD> <CHARNAME>, my name is Gvalas. It is a pleasure to meet you in the flesh, though I have wished that our first meeting was not colored by my selfishness.~
    IF ~Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What exactly do you need in exchange for your support?~ GOTO Repre4EvilWants
    IF ~!Alignment(Player1,MASK_EVIL)~ THEN REPLY ~What exactly do you need in exchange for your support?~ GOTO Repre4GoodNeutWants
END

IF ~~ THEN BEGIN Repre4EvilWants
    SAY ~I want you to murder someone. I know your kind, and I think you might enjoy such task.~
    IF ~~ THEN REPLY ~I might, I might not. What do you stand to gain from this murder?~ GOTO Repre4PossiblyAgreed
    IF ~~ THEN REPLY ~My blood craves such things. Consider it done.~ GOTO Repre4AgreedButDetails
END

IF ~~ THEN BEGIN Repre4GoodNeutWants
    SAY ~I want you to exact justice on Gro'Thuk, a vile bandit who murdered my son Firthof. Will you do this for me?~
    IF ~~ THEN REPLY ~Why did you not contact the authorities?~ GOTO Repre4Authoritities
END

IF ~~ THEN BEGIN Repre4Authoritities
    SAY ~I did, but the Fist failed to apprehend him. I informed the Bounty Officer in the Flaming Fist citadel, but they failed to capture Gro'Thuk again! Please exact revenge for my child.~
    IF ~~ THEN REPLY ~Sounds reasonable. I will avenge your child.~ GOTO Repre4AgreedButDetails
    IF ~~ THEN REPLY ~I will not do a clear-cut assassination. You should contact the authorities. Farewell.~ GOTO Repre4Rejection
END

IF ~~ THEN BEGIN Repre4PossiblyAgreed
    SAY ~I wish to see your heritage used for good. Avenge my son Firthof, and I will support you when it counts.~
    IF ~~ THEN REPLY ~A pretty easy task for your vote. Is there anything else you are not telling me?~ GOTO Repre4AgreedButDetails
    IF ~~ THEN REPLY ~I don't think I am interested in your problems. Farewell.~ GOTO Repre4Rejection
END

IF ~~ THEN BEGIN Repre4AgreedButDetails
    SAY ~Brilliant, but you must understand that I or you should not draw any attention to ourselves. Therefore, I wish to make it look like an accident.~
    IF ~~ THEN REPLY ~Whatever. I will do it for your vote.~ GOTO Repre4AgreementFinal
    IF ~~ THEN REPLY ~Like an accident? Sounds more like you are trying to use me as a disposable assassin!~ GOTO Believe4WhatYouWill
    IF ~~ THEN REPLY ~Assassinations are not worth my time. Farewell.~ GOTO Repre4Rejection
END

IF ~~ THEN BEGIN Believe4WhatYouWill
    SAY ~Gro'Thuk is criminal. You can verify this fact with the Bounty Officer. Are you willing to help a desperate father achieve his revenge or not?~
    IF ~~ THEN REPLY ~Alright, I will do it in exchange for your support.~ GOTO Repre4AgreementFinal
    IF ~~ THEN REPLY ~So, is this revenge for a wrongful death caused by Gro'Thuk?~ GOTO DeathGroThuk
    IF ~~ THEN REPLY ~No, I will not! You are on your own!~ GOTO Repre4Rejection
END

IF ~~ THEN BEGIN DeathGroThuk
    SAY ~Yes! I long for his death! So for my support, I want his head. No other options from me.~
    IF ~~ THEN REPLY ~If that is what you want, I will do it.~ GOTO Repre4AgreementFinal
    IF ~~ THEN REPLY ~I don't think this unlawful murder is appropriate here. I will not do this for you.~ GOTO Repre4Rejection
END

IF ~~ THEN BEGIN Repre4Rejection
    SAY ~Well, you won't be getting my vote!~
    IF ~~ THEN DO
        %IncrementGlobal("rqGDVotes","GLOBAL",-1)
        AddExperienceParty(500)
        EscapeArea()%
        SOLVED_JOURNAL ~Duke of Baldur's Gate: Gvalas vote lost

        Gvalas wanted me to enact revenge on his son, but I rejected him.~
    EXIT
END

IF ~~ THEN BEGIN Repre4AgreementFinal
    SAY ~Wonderful. The last time someone saw him was in the Lower Lantern, though he might just be lying on the ground somewhere drunk in the South City dock area. Do not try to seek me out. Report your success to Iachino.~
    IF ~~ THEN DO
        %SetGlobal("rqGDRepreJob4","GLOBAL",1)
        AddExperienceParty(500)
        EscapeArea()%
        UNSOLVED_JOURNAL ~Duke of Baldur's Gate: Gvalas

        The father of the murdered child wants to exact his revenge on certain Gro'Thuk. If I am not convinced by the father's pleas, I could confirm Gro'Thuk's guilt with the Bounty Officer at the Flaming Fist Citadel. I do not need to find Gvalas to report my success. Iachino is the person to speak to if I want to receive my vote. Iachino can be found in the Elfsong Tavern in Baldur's Gate.~
    EXIT
END

// Gro'Thuk
BEGIN ~rqgroth~

IF ~Global("rqGDRepreJob4","GLOBAL",1)~ THEN BEGIN GrothukSleeps
    SAY ~*You see the half-orc Gro'Thuk; he is standing, yet you can hear his loud snoring. This baffles you for a while, but but then you realize he must be sleeping while standing!* *On closer inspection, you notice that part of his breastplate and his helmet have lodged into the wall, thus providing him the support to actually sleep standing up.*~
    IF ~CheckStatGT(LastTalkedToBy,15,STR)~ THEN REPLY ~*It would require some strength, but I could just push him into the water. Passed out in his armor, he would drown for certain.*~ GOTO DrowningSucceeds
    IF ~CheckStatLT(LastTalkedToBy,15,STR)~ THEN REPLY ~*It would require some strength, but I could just push him into the water. Passed out in his armor, he would drown for certain.*~ GOTO DrowningFails
    IF ~~ THEN REPLY ~Wake him up.~ DO ~SetGlobal("rqGDTalkedToGroThuk","GLOBAL",1)~ GOTO BeyondStupfied
    IF ~~ THEN REPLY ~Leave the half-breed alone.~ EXIT
END

IF ~~ THEN BEGIN DrowningSucceeds
    SAY ~*Surprised and stupefied from booze, and thus unable to act, the half-orc sinks to the bottom.*~
    IF ~~ THEN DO
            ~PlaySound("rqsink")
            ApplySpellRES("rqinvis","rqgroth")
            DestroySelf()
            SetGlobal("rqGDGrothukDead","GLOBAL",1)~
        EXIT
END

IF ~~ THEN BEGIN DrowningFails
    SAY ~*Your lack of strength shows, and your labor is rewarded with failure.* You! I am going to eat your eyes for this!~
    IF ~~ THEN DO ~Enemy()~ EXIT
END

IF ~~ THEN BEGIN BeyondStupfied
    SAY ~*Beyond stupefied, the half-orc wakes after several minutes.* You, what youse' wantin' with me?~
    IF ~~ THEN REPLY ~I want to know who killed Gvalas's son!~ GOTO GvalasIKnowNot
    IF ~Race(LastTalkedToBy,ELF) Global("rqGDKnowGroThuk","GLOBAL",1)~ THEN REPLY ~Stop playing dumb, Gro'Thuk. I know you can speak properly.~ GOTO IKnowSmartElf
    IF ~Race(LastTalkedToBy,HALF_ELF) Global("rqGDKnowGroThuk","GLOBAL",1)~ THEN REPLY ~Stop playing dumb, Gro'Thuk. I know you can speak properly.~ GOTO IKnowSmartElf
    IF ~Race(LastTalkedToBy,DWARF) Global("rqGDKnowGroThuk","GLOBAL",1)~ THEN REPLY ~Stop playing dumb, Gro'Thuk. I know you can speak properly.~ GOTO IKnowSmartDwarf
    IF ~Race(LastTalkedToBy,HALFLING) Global("rqGDKnowGroThuk","GLOBAL",1)~ THEN REPLY ~Stop playing dumb, Gro'Thuk. I know you can speak properly.~ GOTO IKnowSmartHalflingGnome
    IF ~Race(LastTalkedToBy,GNOME) Global("rqGDKnowGroThuk","GLOBAL",1)~ THEN REPLY ~Stop playing dumb, Gro'Thuk. I know you can speak properly.~ GOTO IKnowSmartHalflingGnome
    IF ~Race(LastTalkedToBy,HUMAN) Global("rqGDKnowGroThuk","GLOBAL",1)~ THEN REPLY ~Stop playing dumb, Gro'Thuk. I know you can speak properly.~ GOTO IKnowSmartHuman
    IF ~Race(LastTalkedToBy,HALFORC) Global("rqGDKnowGroThuk","GLOBAL",1)~ THEN REPLY ~Stop playing dumb, Gro'Thuk. I know you can speak properly.~ GOTO IKnowSmartHalfOrc
END

IF ~~ THEN BEGIN IKnowSmartElf
    SAY ~I do not know anyone with that name! Now piss off, or I will chop off your ears and devour them with Garum.~
    IF ~~ THEN REPLY ~I shall enjoy killing you, elf murderer!~ GOTO Battle
    IF ~~ THEN REPLY ~If you will pardon me, I shall retreat to a safe distance.~ GOTO Retreat
END

IF ~~ THEN BEGIN IKnowSmartDwarf
    SAY ~I have heard that dwarven liver with onions and garlic is good, so shove off before I want to confirm.~
    IF ~~ THEN REPLY ~I will not let myself be intimidated by a long-legged half-breed.~ GOTO Battle
    IF ~~ THEN REPLY ~Nay, I do not wish to find out either. I shall leave.~ GOTO Retreat
END

IF ~~ THEN BEGIN IKnowSmartHalflingGnome
    SAY ~I know the bone marrow of small races is delicious, but I do feel generous, so get going or I will be hungry!~
    IF ~~ THEN REPLY ~Tall races are truly disgusting. Die, you fool!~ GOTO Battle
    IF ~~ THEN REPLY ~I shall take a few steps backward.~ GOTO Retreat
END

IF ~~ THEN BEGIN IKnowSmartHuman
    SAY ~Human brains are quite good with bread when fresh out of the pot. Startled, you didn't I? Now get out of my face, or I will smash it in!~
    IF ~~ THEN REPLY ~Disgusting half-breed! I shall take a small step toward getting rid of your foulness in Faerûn right now!~ GOTO Battle
    IF ~~ THEN REPLY ~I am smart enough not to mess with an angry angry, cannibalistic half-orc.~ GOTO Retreat
END

IF ~~ THEN BEGIN IKnowSmartHalfOrc
    SAY ~Your ugly face has spoiled my day. Go and find death from someone else!~
    IF ~~ THEN REPLY ~SameSame skin color we may be, but it will not help you now!~ GOTO Battle
    IF ~~ THEN REPLY ~I think I forgot something somewhere, but I will return!~ GOTO Retreat
END

IF ~~ THEN BEGIN Retreat
    SAY ~Hah! Pathetic, but you are smarter than you look, not trying to pick a fight with me.~
    IF ~~ THEN DO ~EscapeArea() SetGlobal("rqGDGrothukEscape","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN Battle
    SAY ~Stupid! Now I shall feast on your hearts!~
    IF ~~ THEN DO ~Enemy()~ EXIT
END

IF ~~ THEN BEGIN GvalasIKnowNot
    SAY ~*Yawns* I no know stuff. Just leave me alone. I wanna sleep now.~
    IF ~~ THEN REPLY ~For the second time, have you or have you not murdered Gvalas's son Firthof?~ GOTO ForTheLastTime
END

IF ~~ THEN BEGIN ForTheLastTime
    SAY ~Uh, like, Gvalas or Firthof... I dunno, man. I don't think I know anyone with those names or somethin'.~
    IF ~~ THEN REPLY ~Why don't you just admit it?~ GOTO GoAway
    IF ~~ THEN REPLY ~Do you really not know any of these names?~ GOTO NoKnowNames
    IF ~~ THEN REPLY ~Maybe we should just come back later.~ GOTO Retreat
END

IF ~~ THEN BEGIN GoAway
    SAY ~Go away, I talk later, okay?~
    IF ~~ THEN REPLY ~No, you shall speak of this matter right now!~ GOTO Battle
    IF ~~ THEN REPLY ~Fine, do not go anywhere. I will be back.~ GOTO WentAwayStupidGroThuk
END

IF ~~ THEN BEGIN WentAwayStupidGroThuk
    SAY ~Okay, I stay here, like, forever or somethin'.~
    IF ~~ THEN DO ~EscapeArea() SetGlobal("rqGDGrothukEscape","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN NoKnowNames
    SAY ~Yes, I no know. Come later?~
    IF ~~ THEN REPLY ~Fine, but have some honor and stay where you are.~ GOTO WentAwayStupidGroThuk
    IF ~~ THEN REPLY ~I have just had enough of this. I shall kill you and be done with it!~ GOTO Battle
    IF ~~ THEN REPLY ~You are clearly evil. No one shall mourn your passing!~ GOTO Battle
END
