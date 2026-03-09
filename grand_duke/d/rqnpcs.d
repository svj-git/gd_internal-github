// Rhiviq
BEGIN ~rqrhiv~

IF ~Global("rqGDRhiviqKnows","GLOBAL",0)~ THEN BEGIN Presence
    SAY ~Be welcomed in my presence, <MANWOMAN> with destiny.~
    IF ~Kit(Myself,MAGESCHOOL_DIVINER)~ THEN REPLY ~Who are you?~ GOTO WhoAmIRhiviqDIV
    IF ~Kit(Myself,MAGESCHOOL_INVOKER)~ THEN REPLY ~Who are you?~ GOTO WhoAmIRhiviqINV
    IF ~Kit(Myself,MAGESCHOOL_ENCHANTER)~ THEN REPLY ~Who are you?~ GOTO WhoAmIRhiviqENC
    IF ~Kit(Myself,MAGESCHOOL_NECROMANCER)~ THEN REPLY ~Who are you?~ GOTO WhoAmIRhiviqNEC
END

IF ~~ THEN BEGIN WhoAmIRhiviqDIV
    SAY ~Ah yes, a more formal introduction is in order. I am Rhiviq of House Teladyne, formerly apprentice to mage Helres, and I am a Diviner currently in search of revenge.~
    IF ~~ THEN REPLY ~Revenge you say? Well, if it won't interfere with my mission, I could use a mage in my party.~ GOTO JoiningForces
    IF ~~ THEN REPLY ~Well then, good luck on your search.~ GOTO JoiningForcesPay
    IF ~~ THEN REPLY ~Who are you trying to get revenge against?~ GOTO Retribution2
    IF ~~ THEN REPLY ~If you are what you say, you could tell me about the Iron Crisis.~ GOTO IronCrisis
END

IF ~~ THEN BEGIN WhoAmIRhiviqINV
    SAY ~Ah yes, a more formal introduction is in order. I am Rhiviq of House Teladyne, formerly apprentice to mage Helres, and I am an Invoker currently in search of revenge.~
    IF ~~ THEN REPLY ~Revenge you say? Well, if it won't interfere with my mission, I could use a mage in my party.~ GOTO JoiningForces
    IF ~~ THEN REPLY ~Well then, good luck on your search.~ GOTO JoiningForcesPay
    IF ~~ THEN REPLY ~Who are you trying to get revenge against?~ GOTO Retribution2
    IF ~~ THEN REPLY ~If you are what you say, you could tell me about the Iron Crisis.~ GOTO IronCrisis
END

IF ~~ THEN BEGIN WhoAmIRhiviqENC
    SAY ~Ah yes, a more formal introduction is in order. I am Rhiviq of House Teladyne, formerly apprentice to mage Helres, and I am an Enchanter currently in search of revenge.~
    IF ~~ THEN REPLY ~Revenge you say? Well, if it won't interfere with my mission, I could use a mage in my party.~ GOTO JoiningForces
    IF ~~ THEN REPLY ~Well then, good luck on your search.~ GOTO JoiningForcesPay
    IF ~~ THEN REPLY ~Who are you trying to get revenge against?~ GOTO Retribution2
    IF ~~ THEN REPLY ~If you are what you say, you could tell me about the Iron Crisis.~ GOTO IronCrisis
END

IF ~~ THEN BEGIN WhoAmIRhiviqNEC
    SAY ~Ah yes, a more formal introduction is in order. I am Rhiviq of House Teladyne, formerly apprentice to mage Helres, and I am a Necromancer currently in search of revenge.~
    IF ~~ THEN REPLY ~Revenge you say? Well, if it won't interfere with my mission, I could use a mage in my party.~ GOTO JoiningForces
    IF ~~ THEN REPLY ~Well then, good luck on your search.~ GOTO JoiningForcesPay
    IF ~~ THEN REPLY ~Who are you trying to get revenge against?~ GOTO Retribution2
    IF ~~ THEN REPLY ~If you are what you say, you could tell me about the Iron Crisis.~ GOTO IronCrisis
END

IF ~~ THEN BEGIN JoiningForces
    SAY ~Yes! I knew it! You may be young in age, but you show wisdom beyond your years. However, you cannot act on my behalf, as the road to Baldur's Gate is closed. There is no way into the city right now.~
    IF ~~ THEN DO
        %SetGlobal("rqRhiviqJoined","LOCALS",1)
        SetGlobal("rqGDRhiviqRevenge","GLOBAL",1)
        JoinParty()%
        UNSOLVED_JOURNAL ~Rhiviq's Revenge

        I have agreed to exact revenge on behalf of Mage Rhiviq. Rhiviq has indicated that the enemy, whom he has refused to reveal, is supposed to be located in the city of Baldur's Gate.~
    EXIT
END

IF ~~ THEN BEGIN JoiningForcesPay
    SAY ~I can pay you 200 gold pieces upfront for your assistance with my trouble.~
    IF ~~ THEN REPLY ~Now that I think about it, I could use one more mage.~ GOTO JoinPartyPay
    IF ~~ THEN REPLY ~You mentioned some revenge or something?~ GOTO Details
    IF ~~ THEN REPLY ~No, I am not interested in more companions. Farewell.~ GOTO Refusal
END

IF ~~ THEN BEGIN Retribution2
    SAY ~*Rhiviq's face darkens and words come quickly and furiously.* Foul murderers of the most depraved sort!~
    IF ~~ THEN REPLY ~Yes, but how do we find them?~ GOTO FindThem
    IF ~~ THEN REPLY ~If what you say is true, why not just report it to the Flaming Fist and let them handle these supposed criminals?~ GOTO ReportToFist
    IF ~~ THEN REPLY ~Why don't you tell me about the details of their crimes?~ GOTO Crimes
END

IF ~~ THEN BEGIN Crimes
    SAY ~They are murderers; what else do you need to know?~
    IF ~~ THEN REPLY ~I am not a Paladin; I want to work for gold.~ GOTO JoinPartyPay
    IF ~~ THEN REPLY ~Hmm, join me then, but if I find out that you have deceived me, we will have more than a few words.~ GOTO JoinParty
    IF ~~ THEN REPLY ~No, I have not been convinced by your words.~ DO ~SetGlobal("rqGDRhiviqKnows","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN FindThem
    SAY ~If I knew that, I would devise a plan to kill them myself. But so far, I have only divined that by linking my fate with yours, I could find these murderers. So,, are you interested in lending my magical talents to your cause?~
    IF ~~ THEN REPLY ~Yes, I am. Welcome to the party.~ GOTO JoinParty
    IF ~~ THEN REPLY ~No, I am not interested.~ GOTO JoiningForcesPay
    IF ~~ THEN REPLY ~Sounds like mercenary work; why don't you pay me?~ GOTO JoiningForcesPay
END

IF ~~ THEN BEGIN Details
    SAY ~My divination shows a city, and since I have been to Beregost and found nothing, my prey must be in Baldur's Gate. So, if we join forces, we will have to visit Baldur's Gate, and from there my talent will guide the way.~
    IF ~~ THEN REPLY ~Fine, I think you will prove your value.~ GOTO JoinParty
    IF ~~ THEN REPLY ~No, I do not want to travel with the likes of you.~ GOTO Refusal
END

IF ~~ THEN BEGIN ReportToFist
    SAY ~No, I cannot do that. This is personal.~
    IF ~~ THEN REPLY ~Personal it is. I will let you into the party, but you'd better serve me well.~ GOTO JoinParty
    IF ~~ THEN REPLY ~No, I do not think I should be traveling with a man that is so secretive.~ GOTO JoiningForcesPay
END

IF ~~ THEN BEGIN IronCrisis
    SAY ~On the surface, it sounds like preparation for invasion, which would point to Amn. Rumours of Zhentish involvement do make sense if Amn had hired the Zhentarim to weaken Baldur's Gate, but if there is no connection, someone or something wants everyone to believe the aforementioned is true.~
    IF ~Kit(Myself,MAGESCHOOL_DIVINER)~ THEN REPLY ~How do you know all that?~ GOTO Diviner
    IF ~Kit(Myself,MAGESCHOOL_INVOKER)~ THEN REPLY ~How do you know all that?~ GOTO NotDiviner
    IF ~Kit(Myself,MAGESCHOOL_ENCHANTER)~ THEN REPLY ~How do you know all that?~ GOTO NotDiviner
    IF ~Kit(Myself,MAGESCHOOL_NECROMANCER)~ THEN REPLY ~How do you know all that?~ GOTO NotDiviner
END

IF ~~ THEN BEGIN Diviner
    SAY ~I do speak to couriers and travelers who pass through, and I am a mage, a Diviner. To be more specific, a Diviner is a mage who specializes in Divination magic.~
    IF ~~ THEN REPLY ~Can you divine something about me?~ GOTO CharFate
    IF ~~ THEN REPLY ~I do have need for a mage; why don't you join my party?~ GOTO JoinParty
END

IF ~~ THEN BEGIN NotDiviner
    SAY ~I do speak to couriers and travelers who pass through, and I have access to divination magic, but there are only so many things that can be seen from here.~
    IF ~~ THEN REPLY ~Can you divine something about me?~ GOTO CharFate
    IF ~~ THEN REPLY ~I do have need for a mage; why don't you join my party?~ GOTO JoinParty
END

IF ~~ THEN BEGIN CharFate
    SAY ~Your fate? It doesn't work like that. When I am divining, I surround myself with items which will help me think about the subject I am divining, and sometimes I get experiential glimpses of the future or present.~
    IF ~~ THEN REPLY ~Having your skills at my disposal could prove useful.~ GOTO JoinParty
    IF ~~ THEN REPLY ~I think I have heard enough. Farewell.~ GOTO JoiningForcesPay
END

IF ~~ THEN BEGIN JoinPartyPay
    SAY ~Many great deeds will come about from our travels. Just to reiterate, we somehow need to figure out how to get to Baldur's Gate to find my enemies.~
    IF ~~ THEN DO
        %SetGlobal("rqRhiviqJoined","LOCALS",1)
        SetGlobal("rqGDRhiviqRevenge","GLOBAL",1)
        GiveGoldForce(200)
        JoinParty()%
        UNSOLVED_JOURNAL ~Rhiviq's Revenge

        I have agreed to exact revenge on behalf of Mage Rhiviq. Rhiviq has indicated that the enemy, whom he has refused to reveal, is supposed to be located in the city of Baldur's Gate.~
    EXIT
END

IF ~~ THEN BEGIN JoinParty
    SAY ~Many great deeds will come about from our travels. Just to reiterate, we somehow need to figure out how to get to Baldur's Gate to find my enemies.~
    IF ~~ THEN DO
        %SetGlobal("rqRhiviqJoined","LOCALS",1)
        SetGlobal("rqGDRhiviqRevenge","GLOBAL",1)
        JoinParty()%
        UNSOLVED_JOURNAL ~Rhiviq's Revenge

        I have agreed to exact revenge on behalf of Mage Rhiviq. Rhiviq has indicated that the enemy, whom he has refused to reveal, is supposed to be located in the city of Baldur's Gate.~
    EXIT
END

IF ~~ THEN BEGIN Refusal
    SAY ~This did not turn out as I foresaw, but if in the future your foresight aligns with mine, I will be here.~
    IF ~~ THEN DO %SetGlobal("rqGDRhiviqKnows","GLOBAL",1)% EXIT
END

IF ~Global("rqGDRhiviqKnows","GLOBAL",1)~ THEN BEGIN GoAtItAgain
    SAY ~I knew you would return. Will you listen to my proposal?~
    IF ~~ THEN REPLY ~What do you want from me again?~ GOTO Retortion
    IF ~~ THEN REPLY ~No, this was a mistake. Farewell.~ EXIT
END

IF ~~ THEN BEGIN Retortion
    SAY ~I want to murder the people who were responsible for my enslavement.~
    IF ~~ THEN REPLY ~At our first meeting, you claimed that your aim was personal.~ GOTO AtFirstRejection
    IF ~~ THEN REPLY ~This sounds more like a mercenary job; why don't you pay me?~ GOTO JoiningForcesPay
END

IF ~~ THEN BEGIN AtFirstRejection
    SAY ~After your refusal, I have changed my mind. Perhaps if I was more clear about my aim, you would not have rejected me before. So, have you changed your mind?~
    IF ~~ THEN REPLY ~Yes, I have. Join my party.~ GOTO JoinParty
    IF ~~ THEN REPLY ~No, you are untrustworthy. Farewell.~ EXIT
END

BEGIN ~rqrhivP~

IF ~Global("rqRhiviqJoined","LOCALS",1)~ THEN BEGIN KickOutRhiviq
    SAY ~Are we to part ways? Damn, I have not foreseen this.~
    IF ~~ THEN REPLY ~Simple mistake; return back.~
        DO ~JoinParty()~
        EXIT
    IF ~!AreaCheck("AR6801")~ THEN REPLY ~Nope, I do not desire your company anymore; you should leave.~
        DO
            ~SetGlobal("rqRhiviqJoined","LOCALS",0)
            EscapeAreaMove("AR6801",658,1016,4)~
        EXIT
    IF ~AreaCheck("AR6801")~ THEN REPLY ~Nope, I do not desire your company anymore; leave.~
        DO
            ~SetGlobal("rqRhiviqJoined","LOCALS",0)
            MoveToPoint([658.1016])~
        EXIT
    IF ~~ THEN REPLY ~I want you to wait for me here, Rhiviq.~ GOTO WaitHereRhiviq
END

IF ~~ THEN BEGIN WaitHereRhiviq
    SAY ~I will wait for you here, but remember our destinies have already intertwined; thus, untying them could only harm us.~
    IF ~~ THEN DO ~SetGlobal("rqRhiviqJoined","LOCALS",0)~ EXIT
END

IF ~Global("rqRhiviqJoined","LOCALS",0)~ THEN BEGIN RhiviqRejoiningDialogue
    SAY ~Welcome. Shall I rejoin?~
    IF ~~ THEN REPLY ~Rejoin me.~ GOTO RhiviqRejoins
    IF ~~ THEN REPLY ~This has been a mistake.~ EXIT
END

IF ~~ THEN BEGIN RhiviqRejoins
    SAY ~Great, standing here idle was making my limbs numb.~
    IF ~~ THEN DO
        ~SetGlobal("rqRhiviqJoined","LOCALS",1)
        JoinParty()~
    EXIT
END

BEGIN ~rqrhivJ~

IF ~Global("rqGDRhiviqRevenge","GLOBAL",1)~ THEN BEGIN BGCity
    SAY ~The whole city looks disturbingly familiar... as if I... was... here before... yet I never have... Yes, his hands lock the front door. No, stop! Wait.... You are not here to listen to my ramblings. The people who sold me into slavery are north... northwest, I think...~
    IF ~~ THEN DO
        %SetGlobal("rqGDRhiviqRevenge","GLOBAL",2)
        JoinParty()%
        UNSOLVED_JOURNAL ~Rhiviq's Revenge

        After arriving in Baldur's Gate, Rhiviq told me that the people who enslaved him are in one of the houses with locked door in northwestern part of the city.~
    EXIT
END

IF ~Global("rqGDRhiviqRevenge","GLOBAL",2)~ THEN BEGIN GettingCloser
    SAY ~They must be here! The house to the west near the wall has a locked front door.~
    IF ~~ THEN DO ~SetGlobal("rqGDRhiviqRevenge","GLOBAL",3)~ EXIT
END

// Death of Foster Parents
IF ~Global("rqGDRhiviqRevenge","GLOBAL",3) AreaCheck("AR7255")~ THEN BEGIN FinalRevenge
    SAY ~Finally, I have found you, *Mother* and *Father*.~
    IF ~~ THEN EXTERN ~rqmalik~ NotParents
END

IF ~~ THEN BEGIN FosterParents
    SAY ~*Foster* parents, then.~
    IF ~~ THEN EXTERN ~rqmalik~ RhiviqTrueMotive
END

IF ~~ THEN BEGIN Torment
    SAY ~I have not come to torment you, *Father*. I have come to kill you!~
    IF ~~ THEN EXTERN ~rqmalik~ RhiviqIntention
END

IF ~~ THEN BEGIN KillYou1
    SAY ~Too late now; only your deaths can be fitting retribution for you selling me into slavery and devouring my brother!~
    IF ~~ THEN EXTERN ~rqaisha~ AishaYell
END

// After Killing his foster parents
IF ~Global("rqGDRhiviqRevenge","GLOBAL",4) Dead("rqaisha") Dead("rqmalik") CombatCounter(0)~ THEN BEGIN DeadParents
    SAY ~I feel renewed, whole! It is as the priestess promised me. I am now a new man.~
    IF ~~ THEN REPLY ~Who is this priestess you speak about?~ GOTO Priestess
    IF ~~ THEN REPLY ~They sure deserved that. Do you feel better, Rhiviq?~ GOTO FeelBetter
    IF ~~ THEN REPLY ~Did you say they have eaten your brother?~ GOTO DevouredBrother
    IF ~~ THEN REPLY ~Who am I to judge you, though you did just kill your foster parents.~ GOTO KilledParents
    IF ~~ THEN REPLY ~I am quite disturbed disturbed by all this; you should just leave, Rhiviq.~ GOTO DisturbedLeave
END

IF ~~ THEN BEGIN Priestess
    SAY ~Under no circumstance am I free to divulge that. Shall we continue our travels?~
    IF ~~ THEN GOTO Headache
END

IF ~~ THEN BEGIN FeelBetter
    SAY ~Yes, I do.~
    IF ~~ THEN GOTO Headache
END

IF ~~ THEN BEGIN KilledParents
    SAY ~Who are you to judge indeed? Why don't we get out and kill someone and just forget about it?~
    IF ~~ THEN GOTO Headache
END

IF ~~ THEN BEGIN SeemedWealthy
    SAY ~They seemed wealthy enough; why would they sell you into slavery?~
    IF ~~ THEN GOTO WhySlavery
END

IF ~~ THEN BEGIN DevouredBrother
    SAY ~Yes, they have! You know what their defense was?! My brother was sickly and it was an emergency!~
    IF ~~ THEN REPLY ~What kind of an emergency causes one to devour an elf?~ GOTO LongorShortForkWhenDiningOnElf
    IF ~~ THEN REPLY ~That is some sick behavior from these people.~ GOTO SickPeople
    IF ~~ THEN REPLY ~I am disturbed by all these events, Rhiviq; leave my party.~ GOTO DisturbedLeave
END

IF ~~ THEN BEGIN LongorShortForkWhenDiningOnElf
    SAY ~They got themselves trapped in the city during a siege!~
    IF ~~ THEN REPLY ~That is some nasty childhood story; let's get a move on.~ GOTO Headache
    IF ~~ THEN REPLY ~Why did they sell you into slavery?~ GOTO WhySlavery
    IF ~~ THEN REPLY ~I may not be the most moral <PRO_MANWOMAN>, yet I do not condone your behavior here; please leave right now.~ GOTO DisturbedLeave
END

IF ~~ THEN BEGIN SickPeople
    SAY ~It is; it warms my heart that such people will be devoured by worms very soon.~
    IF ~~ THEN REPLY ~Instead of reflecting on the mortality of depraved souls, we should be moving.~ GOTO Headache
    IF ~~ THEN REPLY ~Wait, I would like to know why Malik and Aisha had sold you into slavery?~ GOTO WhySlavery
    IF ~~ THEN REPLY ~You should leave right now, Rhiviq.~ GOTO DisturbedLeave
END

IF ~~ THEN BEGIN DisturbedLeave
    SAY ~I will. Farewell.~
    IF ~~ THEN DO
        ~SetGlobal("rqRhiviqJoined","LOCALS",0)
        LeaveParty()
        EscapeArea()~
    EXIT
END

IF ~~ THEN BEGIN WhySlavery
    SAY ~It is a long story, but I can explain. They used my talents to gain wealth, but they got too greedy and they were stuck in town during a siege. During that time, one of their mercantile partners stole quite a lot from them. When the siege ended, they required a loan, so they sold me off as a slave. I have no wish to speak of such a dead topic; that is my past.~
    IF ~~ THEN GOTO Headache
END

IF ~~ THEN BEGIN Headache
    SAY ~Still, I constantly feel some sort of... pain, which is slowly getting stronger. *Rhiviq's throat constricts.* And I do not know the cause. Yet, I feel that relief is somehow nearby. Let's get a move on; I know we will blunder into a solution soon enough.~
    IF ~~ THEN DO
        %SetGlobal("rqGDRhiviqRevenge","GLOBAL",5)
        EraseJournalEntry(~Rhiviq's Revenge

        I have agreed to exact revenge on behalf of Mage Rhiviq. Rhiviq has indicated that the enemy, whom he has refused to reveal, is supposed to be located in the city of Baldur's Gate.~)
        EraseJournalEntry(~Rhiviq's Revenge

        After arriving in Baldur's Gate, Rhiviq told me that the people who enslaved him are in one of the houses with locked door in northwestern part of the city.~)%
        SOLVED_JOURNAL ~Rhiviq's Revenge

        I expected Rhiviq to murder someone who wronged him, though I could have predicted it would be his foster parents. His elation after the fact disturbed me. Still, I regard him as a useful addition to my party, so he stays for now, at least.~
    EXIT
END

IF ~Global("rqGDRhiviqHeadache","GLOBAL",2)~ THEN BEGIN HeadacheCured
    SAY ~Frozen Island Inn will cure all your pain. It seems that visiting the island has cured my pain; it was all as the Goddess predicted!~
    IF ~~ THEN REPLY ~Which goddess?~ GOTO RefusalGoddess
    IF ~~ THEN REPLY ~Yes, yes; let's get a move on, shall we?~ GOTO MoveOnRhiviq
    IF ~~ THEN REPLY ~Does that mean I will have to help kill any more of your relatives?~ GOTO KillRelatives
END

IF ~~ THEN BEGIN RefusalGoddess
    SAY ~I do not think this is part of myself that I wish to share with you.~
    IF ~~ THEN DO ~ReallyForceSpell("rqrhiv",HELL_GAIN_WIS) SetGlobal("rqGDRhiviqHeadache","GLOBAL",2)~ EXIT // SPIN762.SPL (Wisdom Increase)
END

IF ~~ THEN BEGIN KillRelatives
    SAY ~*Rhiviq opens his mouth but no voice comes out* *Clears throat* No, I mean no, you will not need to kill anyone on my behalf.~
    IF ~~ THEN DO ~ReallyForceSpell("rqrhiv",HELL_GAIN_WIS) SetGlobal("rqGDRhiviqHeadache","GLOBAL",2)~ EXIT // SPIN762.SPL (Wisdom Increase)
END

IF ~~ THEN BEGIN MoveOnRhiviq
    SAY ~For once, I would like to thank you for your brusque manner.~
    IF ~~ THEN DO ~ReallyForceSpell("rqrhiv",HELL_GAIN_WIS) SetGlobal("rqGDRhiviqHeadache","GLOBAL",2)~ EXIT // SPIN762.SPL (Wisdom Increase)
END

//
IF ~~ THEN BEGIN YesFinally
    SAY ~Yes! It is my wish to leave.~
    IF ~~ THEN EXTERN ~rqzelm~ YouSeeZelmira
END

IF ~~ THEN BEGIN KnowZelmira
    SAY ~Of course I know her; I was her protege.~
    IF ~~ THEN EXTERN ~rqzelm~ NeutralZel
END

// Zelmira
BEGIN ~rqzelm~

IF ~AreaCheck("AR7208")~ THEN BEGIN IntroducedZelm
    SAY ~Greetings, <CHARNAME>. Allow me to introduce myself; I am Zelmira. Rhiviq has told me much about you.~
    IF ~~ THEN REPLY ~Why don't you tell me what you want?~ GOTO NeutralZel
    IF ~~ THEN REPLY ~It is a pleasure to meet you, Zelmira.~ GOTO GoodOnZel
    IF ~~ THEN REPLY ~If Rhiviq is some kind of spy, this meeting will end in blood.~ GOTO ThreatsZel
    IF ~~ THEN REPLY ~Rhiviq, do you know this woman?~ EXTERN ~rqrhivJ~ KnowZelmira
    IF ~~ THEN REPLY ~This might end badly for both of you.~ GOTO ThreatsZel
END

IF ~~ THEN BEGIN ThreatsZel
    SAY ~I am not here to fight you, <CHARNAME>. I am here to reclaim Rhiviq, Shar's devoted champion.~
    IF ~~ THEN REPLY ~Shouldn't this be a question for Rhiviq?~ EXTERN ~rqrhivJ~ YesFinally
    IF ~~ THEN REPLY ~Let's discuss how I might profit from giving my companion to you.~ GOTO ProfitRhiviq
    IF ~~ THEN REPLY ~I don't think so. Now scram!~ GOTO NotGivingUpRhiviq
END

IF ~~ THEN BEGIN NeutralZel
    SAY ~Acting on my goddess's will, I am here to reclaim Rhiviq, Shar's champion. Our trade can be mutually beneficial if concluded peacefully. Shar will bless you with a mystical rope in exchange.~
    IF ~~ THEN REPLY ~I assume Rhiviq will agree, yes or no?~ EXTERN ~rqrhivJ~ YesFinally
    IF ~~ THEN REPLY ~No, I am not foolish enough to give up my companion to some priestess!~ GOTO NotGivingUpRhiviq
    IF ~~ THEN REPLY ~Speak of this mystical rope you claim to offer.~ GOTO ProfitRhiviq
END

IF ~~ THEN BEGIN GoodOnZel
    SAY ~Pleasantries... I am genuinely surprised. Shar has instructed me to return her champion, Rhiviq, to her dark embrace.~
    IF ~~ THEN REPLY ~Rhiviq has served me faithfully. Why would would I do that?~ GOTO ZelmiraExplain
    IF ~~ THEN REPLY ~I believe this should be Rhiviq's decision.~ EXTERN ~rqrhivJ~ YesFinally
    IF ~~ THEN REPLY ~What would be my incentive to release Rhiviq to you?~ GOTO ProfitRhiviq
    IF ~~ THEN REPLY ~I will not give Rhiviq to an evil goddess!~ GOTO NotGivingUpRhiviq
END

IF ~~ THEN BEGIN ZelmiraExplain
    SAY ~Because it is the will of Shar. We can end our exchange with you being blessed by Shar's shadowy succor, or we can draw steel. As for myself, I prefer the first option. We could make a trade and exchange Rhiviq for...~
    IF ~~ THEN GOTO ProfitRhiviq
END

IF ~~ THEN BEGIN NotGivingUpRhiviq
    SAY ~Worthless fool! Rhiviq, act now!!~
    IF ~~ THEN
        DO ~ForceSpell(Myself,DRYAD_TELEPORT)
            ActionOverride("rqrhiv",LeaveParty())
            ActionOverride("rqrhiv",EscapeArea())
            ActionOverride("rqzelg1",Enemy())
            ActionOverride("rqzelg2",Enemy())
            ActionOverride("rqzelg3",Enemy())
            ActionOverride("rqzelg4",Enemy())~
        EXIT
END

// Ending
IF ~Global("rqGDZZEnding","GLOBAL",2)~ THEN BEGIN ZelmiraFreesRhiviq
    SAY ~Rhiviq, you are coming with me. You there, take that elven mage with you!~
    IF ~InMyArea("rqthi8d1")~ THEN DO
            ~ActionOverride("rqrhiv",LeaveParty())
            ActionOverride("rqrhiv",EscapeArea())
            EscapeArea()
            ActionOverride("rqrhiv",EscapeArea())~ EXTERN ~rqspes~ ReignZelmira
    IF ~InMyArea("rqenfist")~ THEN DO
            ~ActionOverride("rqrhiv",LeaveParty())
            ActionOverride("rqrhiv",EscapeArea())
            EscapeArea()~ EXTERN ~rqenfist~ Alarm
END

IF ~~ THEN BEGIN ProfitRhiviq
    SAY ~A powerful magic item. Some might even attack you just to possess such a powerful object.~
    IF ~~ THEN REPLY ~Yes, but what is it?~ GOTO WhatIsTheItem
    IF ~~ THEN REPLY ~I agree, but this bauble better be worth it.~ GOTO RhiviqTransactionDone
    IF ~~ THEN REPLY ~I'd rather have a companion, which seems more valuable to me.~ GOTO HaveCompanion
END

IF ~~ THEN BEGIN HaveCompanion
    SAY ~Is that your final word?~
    IF ~~ THEN REPLY ~You shall not take Rhiviq from me!~ GOTO NotGivingUpRhiviq
    IF ~~ THEN REPLY ~What does Rhiviq desire?~ EXTERN ~rqrhivJ~ YesFinally
END

IF ~~ THEN BEGIN WhatIsTheItem
    SAY ~It veils you in good fortune and protects you as a suit of plate armor.~
    IF ~~ THEN REPLY ~I accept your terms, priestess.~ GOTO RhiviqTransactionDone
    IF ~~ THEN REPLY ~No, I will not have you suggest giving my companion to an evil goddess!~ GOTO NotGivingUpRhiviq
END

IF ~~ THEN BEGIN YouSeeZelmira
    SAY ~Nightsingers have guided us here, and now Shar wants Rhiviq back in her embrace. Will you agree to our terms, Rhiviq, in exchange for our potent item?~
    IF ~~ THEN REPLY ~I agree, as it is Rhiviq's wish.~ GOTO RhiviqTransactionDone
    IF ~~ THEN REPLY ~I do not think that the priestess of Shar can dictate terms to me!~ GOTO NotGivingUpRhiviq
END

IF ~~ THEN BEGIN RhiviqTransactionDone
    SAY ~The trade is done. I will leave quickly because I know you and your kind, <CHARNAME>.~
    IF ~~ THEN
        DO ~GiveItem("rqbelt05", Player1)
            ActionOverride("rqrhiv",DropInventory())
            EscapeArea()
            ActionOverride("rqrhiv",EscapeArea())
            ActionOverride("rqzelg1",EscapeArea())
            ActionOverride("rqzelg2",EscapeArea())
            ActionOverride("rqzelg3",EscapeArea())
            ActionOverride("rqzelg4",EscapeArea())~
        EXIT
END

// Rhiviq's Parents
BEGIN ~rqmalik~

IF ~~ THEN BEGIN NotParents
    SAY ~We are *NOT* your parents, Rhiviq.~
    IF ~~ THEN EXTERN ~rqrhivJ~ FosterParents
END

IF ~~ THEN BEGIN RhiviqTrueMotive
    SAY ~Why have you come to torment us?~
    IF ~~ THEN EXTERN ~rqrhivJ~ Torment
END

IF ~~ THEN BEGIN RhiviqIntention
    SAY ~We have apologized to you a thousand times. We have offered you gold, power, blessings, favors; even churches have offered to mediate. You need not do this!~
    IF ~~ THEN EXTERN ~rqrhivJ~ KillYou1
END

BEGIN ~rqaisha~

IF ~~ THEN BEGIN AishaYell
    SAY ~Nooo! Lathander help us!!~
    IF ~~ THEN DO
        ~SetGlobal("rqGDRhiviqRevenge","GLOBAL",4)
        ActionOverride("rqaisha",Enemy())
        ActionOverride("rqmalik",Enemy())
        ActionOverride("rqfig9a1",Enemy())
        ActionOverride("rqthi8b1",Enemy())~
    EXIT
END

// Brokkr
BEGIN ~rqbro~

IF ~Global("rqGDBrokkrKnows","GLOBAL",0) AreaCheck("AR3709")~ THEN BEGIN BrokkrIntro
    SAY ~Brokkr be me name, what ye be wantin' from ol' me?~
    IF ~~ THEN REPLY ~Who are you?~ GOTO BrokkrWho
    IF ~~ THEN REPLY ~What are you doing here?~ GOTO BrokkrIsMe
END

IF ~~ THEN BEGIN BrokkrIsMe
    SAY ~What be ye doin' here? I be lookin' fer a job, so I can storm back and take me axe from that mangy Chieftain of Gnoll Stronghold.~
    IF ~~ THEN REPLY ~Perhaps we could help each other. What exactly are you trying to reclaim?~ GOTO GoalsAlign
    IF ~~ THEN REPLY ~Talking to you further holds no interest. Farewell.~ GOTO RefusalBrokkr
END

IF ~~ THEN BEGIN BrokkrWho
    SAY ~Aye, I be known as Brokkr, and I tell ye, there's no need for more words than that. Off ye go, find a maid or somethin' to gab with.~
    IF ~~ THEN REPLY ~Perhaps you could tell me what you are doing here?~ GOTO BrokkrIsMe
    IF ~~ THEN REPLY ~Have it your way, surly dwarf.~ GOTO RefusalBrokkr
END

IF ~~ THEN BEGIN GoalsAlign
    SAY ~*Brokkr sizes you up.* Aye, ye speak o' that now, but I've me doubts about yer mettle. Will ye stand firm, or will ye scurry like frightened rats when gnolls be clawing at yer helmets?~
    IF ~Inparty("Edwin")~ THEN REPLY ~So you know where the Gnoll fortress is? We need to go there to kill a witch.~ GOTO GnollFortress
    IF ~Inparty("Minsc")~ THEN REPLY ~Perhaps we could join forces, as we need to rescue a certain witch from the clutches of the Gnolls.~ GOTO GnollFortress
    IF ~~ THEN REPLY ~If there is treasure to be gained, I am definitely interested.~ GOTO GnollFortress
    IF ~~ THEN REPLY ~Fighting gnolls is not in my interest. Fight your own battles.~ GOTO RefusalBrokkr
END

IF ~~ THEN BEGIN RefusalBrokkr
    SAY ~Move aside, then! I be searchin' for a certain one, and ye be right in me sight, blockin' me eyes.~
    IF ~~ THEN DO ~SetGlobal("rqGDBrokkrKnows","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN GnollFortress
    SAY ~Ye do? Why, ye should've spoken o' it sooner! Damn these empty words and no treasures gained. I'm ready, lads! Let's be off!~
    IF ~~ THEN REPLY ~We still have other things to do before we can assault the Gnoll Stronghold.~ GOTO DelayAssault
    IF ~~ THEN REPLY ~What treasures are you speaking about?~ GOTO NoTreasures
END

IF ~~ THEN BEGIN NoTreasures
    SAY ~Aye, there be treasure, no doubt, but me heart's set on reclaiming me axe from filthy gnoll scum!~
    IF ~~ THEN REPLY ~I caution wisdom. Assaulting Gnolls in their fortress is going to be dangerous; therefore, we should not hurry in our assault. You should know that more than I should.~ GOTO DelayAssault
    IF ~~ THEN REPLY ~Right, let us be off.~ GOTO BrokkrJoins
END

IF ~~ THEN BEGIN DelayAssault
    SAY ~If we slay 'em later, it bears no weight upon my beard, but we must not dither in our decision. My heart yearns for the crimson of gnoll blood, and I shall not wait forever to taste it.~
    IF ~~ THEN REPLY ~Welcome to the party.~ GOTO BrokkrJoins
    IF ~~ THEN REPLY ~On the other hand, I do not have time for this. Farewell.~ GOTO RefusalBrokkr
END

IF ~~ THEN BEGIN BrokkrJoins
    SAY ~Aye, then! We shan't wait for those sneaky gnolls to come to our doorstep. Nay, we'll march straight into their Stronghold, strike first, strike hard!~
    IF ~~ THEN DO
        %SetGlobal("rqGDBrokkrJoined","LOCALS",1)
        SetGlobal("rqGDBrokkrKnows","GLOBAL",1)
        SetGlobal("rqGDBrokkrTreasure","GLOBAL",1)
        RevealAreaOnMap("AR4100")
        JoinParty()%
        UNSOLVED_JOURNAL ~Brokkr's Treasure

        Dwarf Brokkr had his axe stolen by gnolls located in Gnoll Stronghold, and I have agreed to recover it.~
    EXIT
END

IF ~Global("rqGDBrokkrKnows","GLOBAL",1) AreaCheck("AR3709")~ THEN BEGIN BrokkrRejoiningDialogue
    SAY ~Ye again blockin' me sight, eh? I ain't joinin' back unless ye part with gold. Give me three hundred coins upfront, or I stay where I be!~
    IF ~~ THEN REPLY ~This has been a mistake.~ EXIT
    IF ~PartyGoldGT(300)~ THEN REPLY ~I'll pay. Rejoin me.~ GOTO BrokkrRejoins
    IF ~PartyGoldLT(300)~ THEN REPLY ~That is too expensive for my taste. Farewell.~ GOTO BrokkrNoGold
END

IF ~~ THEN BEGIN BrokkrRejoins
    SAY ~Bah! This worthless lounging was makin' me itchy.~
    IF ~~ THEN DO
        ~SetGlobal("rqGDBrokkrJoined","LOCALS",1)
        DestroyGold(300)
        JoinParty()~
    EXIT
END

IF ~~ THEN BEGIN BrokkrNoGold
    SAY ~Hah! Why in the blazing hells did ye come crawlin' here, ya broke-ass goblin-licker? Ain't got a single gold coin to buy a rat's arse, let alone hire a proper dwarf!~
    IF ~~ THEN EXIT
END

// BG2 Join dialog did not meet in Nashkel
IF ~Global("rqGDBrokkrKnows","GLOBAL",0)
    AreaCheck("AR0704")~ THEN BEGIN BG2IntroBrokkr
    SAY ~Yer may not know me face, but heed me words, worm. I bring a warning fair by my measure, which ain't much. There be men lurkin' in the graveyards. They thirst fer yer blood...~
    IF ~~ THEN REPLY ~How do you know that?~ GOTO KnowThatCultists
    IF ~~ THEN REPLY ~Why are they after me?~ GOTO WhyAreThereAfterMe
    IF ~~ THEN REPLY ~Thanks for the warning, but I do not have time to speak with you. Farewell.~
        DO ~SetGlobal("rqGDBrokkrKnows","GLOBAL",2)~ EXIT
END

IF ~~ THEN BEGIN KnowThatCultists
    SAY ~Was diggin' in the Graveyards, mindin' me own. Then I seen 'em. Skulkin' shadows. Didn't go back. Not ever. Reckon they're still there... waitin' fer you.~
    IF ~~ THEN REPLY ~What motivated them to go after me?~ GOTO WhyAreThereAfterMe
    IF ~~ THEN REPLY ~So what do you want from me?~ GOTO SmellsProfit
END

IF ~~ THEN BEGIN WhyAreThereAfterMe
    SAY ~Bah! They think other gods be naught but demons... how's a sane dwarf to understand such madness? Peer into a fool's skull, and ye'll catch the rot yerself!~
    IF ~~ THEN REPLY ~How come you know them?~ GOTO KnowThatCultists
    IF ~~ THEN REPLY ~What could dwarf like yourself want from me?~ GOTO SmellsProfit
END

IF ~~ THEN BEGIN SmellsProfit
    SAY ~Ah, ye've got the fire. I like that. I'd be wantin' to join yer ragtag band, for I reckon there's gold to be found in sharin' company with a hardy soul like yerself.~
    IF ~~ THEN REPLY ~Honesty? I like that. Welcome to my group.~ GOTO BrokkrJoinsBG2
    IF ~~ THEN REPLY ~I do not trust your selfish reasons, dwarf. I am leaving. Farewell.~
        DO ~SetGlobal("rqGDBrokkrKnows","GLOBAL",2)~ EXIT
    IF ~~ THEN REPLY ~One more question. Are you being pursued, and you are trying to find refuge in my group?~ GOTO RefugeGroup
END

IF ~~ THEN BEGIN RefugeGroup
    SAY ~Ha! So ye think yer clever, do ye? Well, I ain't impressed unless ye count them Yah-woh cultists chasin' ye through the graveyard. That's a right fitting spot fer their ilk, I'd say. As fer yer question, no, I don't know any scum worth cuttin' off my ear.~
    IF ~~ THEN REPLY ~Perhaps you are telling the truth. Join me.~ GOTO BrokkrJoinsBG2
    IF ~~ THEN REPLY ~I have better things to do right now, so no is my answer. Farewell.~
        DO ~SetGlobal("rqGDBrokkrKnows","GLOBAL",2)~ EXIT
END

// Knows Charname from Nashkel
IF ~Global("rqGDBrokkrKnows","GLOBAL",1)
    AreaCheck("AR0704")~ THEN BEGIN BG2IntroBrokkr
    SAY ~Hah! If it ain't the soft-face from Nashkel. Listen close, rock-knocker: there's zealots with cups out, thirstin' for the red in yer veins. Watch yer back.~
    IF ~~ THEN REPLY ~You came down here from Nashkel to warn me about this?~ GOTO KnowThatCultists
    IF ~~ THEN REPLY ~Why are they after me?~ GOTO WhyAreThereAfterMe
END

IF ~~ THEN BEGIN BrokkrJoinsBG2
    SAY ~Hah! So the stone's finally worn a groove in yer thick skull, has it? 'Bout time. Enough chatter.~
        IF ~~ THEN DO
        %AddXPObject("rqbro",180000)
        SetGlobal("rqGDBrokkrJoined","LOCALS",1)
        SetGlobal("rqGDBrokkrKnows","GLOBAL",2)
        JoinParty()%
    EXIT
END

// Tegwyn
BEGIN ~rqtegwyn~

IF ~NumTimesTalkedTo(0) InParty("rqbro")~ THEN BEGIN TegwynIntro
    SAY ~Kind sir, you are known to our house from Waterdeep. Would you be helpful with the investigation in our hunt for the most foul criminal?~
    IF ~~ THEN EXTERN ~rqbroJ~ DonnaeKnow
END

IF ~~ THEN BEGIN WrongDwarf
    SAY ~I do not know which house exactly. They told me you were an old friend of their house who got lost near Waterdeep. They gave me a description which matches.~
    IF ~~ THEN EXTERN ~rqbroJ~ NotMyStuff
END

IF ~~ THEN BEGIN AskCharname
    SAY ~Understood. *Boy turns to you* Please, kind sir, are you willing to help uncover the murderer?~
    IF ~~ THEN REPLY ~Who is this house you have spoken about?~ GOTO FurtherAnswers
    IF ~~ THEN REPLY ~I might help, but you need to tell me more about your investigation.~ GOTO FurtherAnswers
    IF ~~ THEN REPLY ~What reward are you offering?~ GOTO FurtherAnswers
    IF ~~ THEN REPLY ~No, I have better things to do.~ GOTO RejectedTegwyn
END

IF ~~ THEN BEGIN FurtherAnswers
    SAY ~Please go to Council of Six building and speak to Jergun Ermingsen.~
    IF ~~ THEN DO ~SetGlobal("rqGDBG2BrokMurderers","GLOBAL",1)
        EscapeArea()~
        UNSOLVED_JOURNAL ~Brokkr's murder plot

        I would have never thought that a cold man like Brokkr would help solve a murder case in Water Waterdeep. Either way, if I am inclined to gain further insight into this mystery, I should talk to Jergun Ermingsen in the Council of Six Building. I doubt that questioning the dwarf about this would result in revealing any interesting details.~
        EXIT
END

IF ~~ THEN BEGIN RejectedTegwyn
    SAY ~If you change your mind, speak to Jergun Ermingsen in the Government District.~
    IF ~~ THEN DO ~SetGlobal("rqGDBG2BrokMurderers","GLOBAL",1)
        EscapeArea()~
        UNSOLVED_JOURNAL ~Brokkr's murder plot

        I would have never thought that a cold man like Brokkr would help solve a murder case in Water Waterdeep. Either way, if I am inclined to gain further insight into this mystery, I should talk to Jergun Ermingsen in the Council of Six Building. I doubt that questioning the dwarf about this would result in revealing any interesting details.~
        EXIT
END

// Joses
BEGIN ~rqjoses~

IF ~~ THEN BEGIN NameOfWitness
    SAY ~His name is Ilmen.~
    IF ~~ THEN EXTERN ~rqjergun~ IlmenReturn
END

IF ~Global("rqGDBG2BrokMurderers","GLOBAL",1)~ THEN BEGIN NothingToTalk
    SAY ~Perhaps you should talk to my lieutenant Jergun.~
    IF ~~ THEN EXIT
END

// In Council of Six building
IF ~~ THEN BEGIN JergunRuns
    SAY ~The fool left so quickly that he even forgot to tell you that two more dead peasants were found in the Docks district and another location.~
    IF ~~ THEN REPLY ~Right, we will meet you in Docks district.~ GOTO DocksFirst
END

IF ~~ THEN BEGIN DocksFirst
    SAY ~I will wait for you in the southeast corner of the Docks district.~
    IF ~~ THEN DO
            %SetGlobal("rqGDBG2BrokMurderers","GLOBAL",2)
            EscapeAreaMove("AR0300",4406,2197,SEE)%
            UNSOLVED_JOURNAL ~Brokkr's murder plot

            I have agreed to investigate a series of murders for Jergun from the city guard. The murderer is targeting peasants. Murderer is or are of small stature and physically weak. Murderer leaves behind disfigured corpses. Some, not all, have been found with eyes removed and blood drained. There are no witnesses. Joses is my aide in the investigation. I am to continue the investigation southeast of the Docks district.~
        EXIT
END

// Docks Joses
IF ~Global("rqGDBG2BrokMurderers","GLOBAL",2)~ THEN BEGIN DocksIntro
    SAY ~Here we are. The victim was found right near this house. Can you smell that?~
    IF ~Global("rqGDBG2Sulfur","GLOBAL",1)~ THEN REPLY ~What is that smell?..~ GOTO SulfurSmell2
    IF ~~ THEN REPLY ~Why did you have me come here? There's nothing here. No corpse, no witnesses to speak to! Why are you wasting my time with just a smell?~ GOTO SmellWasting
END

IF ~~ THEN BEGIN SulfurSmell2
    SAY ~Yes, the same sulfur you asked about, Jergun.~
    IF ~~ THEN REPLY ~So, you think that the killer will have some item on him that smells of sulfur?~ GOTO Possibly
END

IF ~~ THEN BEGIN SmellWasting
    SAY ~Because this is the only clue we have.~
    IF ~~ THEN REPLY ~Jergun talked about other clues, such as the killer's small stature and weak strength.~ GOTO WhatAboutOtherProofs
    IF ~~ THEN REPLY ~How about the plucked eyeballs?~ GOTO WhatAboutOtherProofs
    IF ~~ THEN REPLY ~So, we have no other clues to find here.~ GOTO FineSoWhat
    IF ~~ THEN REPLY ~Why have you removed the corpse? I wanted to examine it.~ GOTO WhatOfTheCorpse
END

IF ~~ THEN BEGIN WhatAboutOtherProofs
    SAY ~I can confirm missing eyes and multiple imprecise slash wounds. Yes, you remember well, but it is not helpful to us, as we have no witnesses or a description. I do not want to imprison anyone innocent.~
    IF ~~ THEN REPLY ~A valid concern, but I need to examine the corpse to confirm.~ GOTO WhatOfTheCorpse
END

IF ~~ THEN BEGIN WhatOfTheCorpse
    SAY ~We had to destroy it because citizens complained about it.~
    IF ~~ THEN REPLY ~You are not helping with the investigation. I need to see the corpse.~ GOTO JosesDefendsHimself
END

IF ~~  THEN BEGIN JosesDefendsHimself
    SAY ~Well,, I had to make a decision: either suffer a reprimand or remove the corpse.~
    IF ~~ THEN REPLY ~So, let me understand: Jergun talks me into accepting an investigation, yet I am being snubbed by someone from the city administration who cannot wait until I show up and examine the remains.~ GOTO Possibly
END

IF ~~ THEN BEGIN Possibly
    SAY ~Yes! But...~
    IF ~~ THEN GOTO FineSoWhat
END

IF ~~ THEN BEGIN ExplainJoses
    SAY ~While there is no corpse here, you can certainly smell sulfur, which Jergun has mentioned.~
    IF ~~ THEN REPLY ~Yes, I do. So, the killer should have something that smells of sulfur?~ GOTO Possibly
    IF ~~ THEN REPLY ~So, where are the remains of the victim?~ GOTO WhatOfTheCorpse
END

IF ~~ THEN BEGIN FineSoWhat
    SAY ~We should meet at the second location, as there is nothing more we can do here.~
    IF ~~ THEN REPLY ~Okay, but make sure I can be of some help there.~ GOTO MeetCopperCoronet
    IF ~~ THEN REPLY ~This better not be a waste of time like the smell tests here.~ GOTO MeetCopperCoronet
END

IF ~~ THEN BEGIN MeetCopperCoronet
    SAY ~We shall meet north of the Copper Coronet.~
    IF ~~ THEN DO
            %SetGlobal("rqGDBG2BrokMurderers","GLOBAL",3)
            EscapeAreaMove("AR0400",2073,605,SSW)%
            UNSOLVED_JOURNAL ~Brokkr's murder plot

            I need to think twice before I accept work from any authority. Do they expect me to follow a smell throughout Athkatla? Am I a bloodhound? Despite Jergun asking me to investigate these murders, it seems someone is trying to impede my investigation. I should trust no one. Another murder has supposedly occurred north of the Copper Coronet. Joses will be waiting for me there, hopefully with more actionable proof than just a sulfurous smell.~
        EXIT
END
// Slums
IF ~Global("rqGDBG2BrokMurderers","GLOBAL",3)~ THEN BEGIN SlumsIntro
    SAY ~You have arrived. I wish we could have known each other in better circumstances, but here we are.~
    IF ~~ THEN REPLY ~I see no corpse; you better have a good reason to have me travel here.~ GOTO SulfurAgain
    IF ~~ THEN REPLY ~Murder with no corpse; this better be good.~ GOTO SulfurAgain
    IF ~~ THEN REPLY ~Alright, explain what we are here for.~ GOTO SulfurAgain
END

IF ~~ THEN BEGIN SulfurAgain
    SAY ~The sulfur stench persists even after we removed the body. Isn't that something? But this time, we actually have a witness.~
    IF ~~ THEN REPLY ~You do?~ GOTO WitnessAbiyah
END

IF ~~ THEN BEGIN WitnessAbiyah
    SAY ~Yes, you should speak to him here. We did not have time for more formal procedures. We need to move quickly to capture the murderer.~
    IF ~~ THEN REPLY ~You, halfling, I want to talk to you.~ EXTERN ~rqabiyah~ AbiyahIntro
    IF ~~ THEN REPLY ~What have you seen, citizen?~ EXTERN ~rqabiyah~ AbiyahIntro
    IF ~~ THEN REPLY ~I wish to introduce myself. I am <CHARNAME>. How are you doing at the time of <DAYNIGHTALL>?~ EXTERN ~rqabiyah~ AbiyahIntro
END

// From Abiyah
IF ~~ THEN BEGIN ProofInSewers
    SAY ~Lesme, teleport us to the closest sewer, but leave the halfling here.~
    IF ~~ THEN EXTERN ~rqlesme~ TeleportUs
END

// In Sewers
IF ~~ THEN BEGIN AntonSmell
    SAY ~I can smell a sulfurous stench. He must be around here somewhere! We must kill him immediately!~
    IF ~~ THEN EXTERN ~rqanton~ DieAntonDie
END

IF ~~ THEN BEGIN StayYourHand
    SAY ~Aha, so you reeking of sulfur and hiding yourself has nothing to do with what you are doing here?~
    IF ~~ THEN EXTERN ~rqanton~ SuspicionAnton
END

IF ~~ THEN BEGIN SpeakToCharname
    SAY ~<CHARNAME>, please be on our side. We must slay this murderer. This place reeks of his sulfurous stench. We have a witness who has seen his latest murder!~
    IF ~~ THEN REPLY ~Though Joses might be lying, that does not mean you are any better!~ EXTERN ~rqanton~ AntonTask
    IF ~Class(Player1,PALADIN_ALL)~ THEN REPLY ~I can feel your evil presence. Reveal yourself so it might be ended.~ EXTERN ~rqanton~ BattleAnton
    IF ~~ THEN REPLY ~Still, it does not explain imprecise cuts made by a small and weak person.~ GOTO WitnessAccident
    IF ~~ THEN REPLY ~How come supposed murderer knows your witness by name?~ GOTO WitnessAccident
    IF ~CheckStatGT(Player1,11,WIS)~ THEN REPLY ~Tough luck with the Cowled Wizard transporting your *witness* here; your charade is over now, Joses.~ GOTO WitnessAccident
END

IF ~~ THEN BEGIN WitnessAccident
    SAY ~You are misled, <CHARNAME>. We hunt this lycanthrope for our own common good.~
    IF ~~ THEN EXTERN ~rqanton~ EnslavingLycan
END

IF ~~ THEN BEGIN PackMember
    SAY ~He is searching for a cure for his wounded member of his werewolf pack.~
    IF ~~ THEN REPLY ~Is that true?~ EXTERN ~rqanton~ CureForPackMember
END

IF ~~ THEN BEGIN JosesPrivateArmy
    SAY ~So, what? Are they better off roaming and slaughtering innocents? With us, they will have some purpose, though types like Anton do not seem to understand this.~
    IF ~~ THEN REPLY ~You are just trying to enslave lycanthropes for your own gain?~ GOTO TiredOfThis
    IF ~~ THEN REPLY ~A lycanthrope roaming through sewers is like a snake cuddling up to a newborn; nothing good can come of it.~ EXTERN ~rqanton~ BattleAnton
END

IF ~~ THEN BEGIN TiredOfThis
    SAY ~I am tired of this sewer debate. We shall kill both beast and you, <CHARNAME>!~
    IF ~~ THEN DO
            ~ReallyForceSpellRES("rqgwehr3","rqanton")
            ReallyForceSpellRES("rqgwehr2","rqjoses")
            ActionOverride("rqantonn",Attack("rqjoses2"))
            Enemy()
            ActionOverride("rqabiyah",Enemy())~
        EXIT
END

IF ~Dead("rqanton2")~ THEN BEGIN DeadAnton
    SAY ~We thank you for assisting in this battle, but we wanted him alive so we could capture him. No matter, there will be another opportunity soon.~
    IF ~~ THEN DO
            %SetGlobal("rqGDBG2BrokMurderers","GLOBAL",6)
            AddExperienceParty(18000)
            EscapeArea()
            ActionOverride("rqabiyah",EscapeArea())%
        EXIT
END

// Anton
BEGIN ~rqanton~

IF ~!Dead("rqjoses") !Dead("rqabiyah") Global("rqGDBG2BrokMurderers","GLOBAL",4)~ THEN BEGIN AntonIntro
    SAY ~Halt! You there, identify yourself. I will happily kill you and devour your liver.!~
    IF ~~ THEN REPLY ~Who is talking?~ GOTO NonsenseAnton
    IF ~~ THEN REPLY ~We are after murderer, and you just might be our culprit.~ GOTO WrongPlaceCharname
    IF ~~ THEN REPLY ~I will do some questioning here, unseen entity!~ GOTO NonsenseAnton
END

IF ~~ THEN BEGIN WrongPlaceCharname
    SAY ~Ha! You have wandered in wrong place, <PRO_RACE>. For second time leave or I shall put you down like other monsters living here.~
    IF ~~ THEN EXTERN ~rqjoses~ AntonSmell
END

IF ~~ THEN BEGIN NonsenseAnton
    SAY ~I am hungry and you are delaying me with nonsense, <PRO_RACE>!~
    IF ~~ THEN EXTERN ~rqjoses~ AntonSmell
END

IF ~~ THEN BEGIN DieAntonDie
    SAY ~Stay your hand, <PRO_RACE>. Seeing a half-man over there, it dawned on me you are being misled here.~
    IF ~~ THEN EXTERN ~rqjoses~ StayYourHand
END

IF ~~ THEN BEGIN SuspicionAnton
    SAY ~It was foolish of you to bring Abiyah here. I know what you are about now, and you will not succeed in framing my pack for your kills, Abiyah!~
    IF ~~ THEN EXTERN ~rqabiyah~ IAmAfraid
END

IF ~~ THEN BEGIN BattleAnton
    SAY ~*Rrraarrrgg*!~
    IF ~~ THEN DO
            ~SetGlobal("rqGDBG2BrokMurderers","GLOBAL",5)
            ReallyForceSpellRES("rqgwehr1","rqanton")
            Enemy()~
        EXIT
END

IF ~~ THEN BEGIN AntonTask
    SAY ~Your words are meaningless to me, as I have a task here. Will you let me gather fungus for my ailing, wounded family member?~
    IF ~~ THEN EXTERN ~rqjoses~ PackMember
END

IF ~~ THEN BEGIN EnslavingLycan
    SAY ~Yes, enslaving lycanthropes for your own private army!~
    IF ~~ THEN REPLY ~Are his words true, Joses?~ EXTERN ~rqjoses~ JosesPrivateArmy
END

IF ~~ THEN BEGIN CureForPackMember
    SAY ~Yes, I am what you would call a wild druid or a shaman for my pack.~
    IF ~~ THEN REPLY ~Tell me, were you planning or have you killed while on your quest for a cure?~ GOTO IHaveAndSoDidJoses
    IF ~~ THEN REPLY ~You are a beast, and in city sewers, that is enough reason to kill you.~ GOTO BattleAnton
END

IF ~~ THEN BEGIN IHaveAndSoDidJoses
    SAY ~I have, and so did Joses.~
    IF ~~ THEN EXTERN ~rqjoses~ TiredOfThis
END

// Dead Joses and Abiyah
BEGIN ~rqantonn~

IF ~Dead("rqjoses2") Dead("rqabiyah") Global("rqGDBG2BrokMurderers","GLOBAL",4)~ THEN BEGIN NobleThing
    SAY ~*Clears Throat* I thank... you... Few... have... sided... with... me... Gratitude.~
    IF ~~ THEN DO
            %SetGlobal("rqGDBG2BrokMurderers","GLOBAL",6)
            AddExperienceParty(18000)
            EscapeArea()%
            /*
            SOLVED_JOURNAL ~Brokkr's murder plot

            I have let the werewolf go; at least he did not try to mislead me with lies. I even question whether there were any murders or not, though I had not trusted anyone in this affair. I will not return to the Council of Six to check if Jergun is there, which I highly doubt, as I suspect he was part of the deception.~ */
        EXIT
END

// Lesmé Cowled Wizard
BEGIN ~rqlesme~

IF ~~ THEN BEGIN TeleportUs
    SAY ~You are lucky that I know these sewers. Wait one moment; I will teleport you in a few seconds.~
    IF ~~ THEN DO
        ~SetGlobal("rqGDBG2BrokMurderers","GLOBAL",4)
        SetInterrupt(FALSE)
        ClearActions(Player1)
        ClearActions(Player2)
        ClearActions(Player3)
        ClearActions(Player4)
        ClearActions(Player5)
        ClearActions(Player6)
        CreateVisualEffectObject("SPDIMNDR",Player1)
        CreateVisualEffectObject("SPDIMNDR",Player2)
        CreateVisualEffectObject("SPDIMNDR",Player3)
        CreateVisualEffectObject("SPDIMNDR",Player4)
        CreateVisualEffectObject("SPDIMNDR",Player5)
        CreateVisualEffectObject("SPDIMNDR",Player6)
        CreateVisualEffectObject("SPDIMNDR","rqabiyah")
        CreateVisualEffectObject("SPDIMNDR","rqjoses")
        ActionOverride(Player1,LeaveAreaLUAPanic("AR0404","",[464.1045],E))
        ActionOverride(Player1,LeaveAreaLUA("AR0404","",[464.1045],E))
        ActionOverride(Player2,LeaveAreaLUA("AR0404","",[404.941],E))
        ActionOverride(Player3,LeaveAreaLUA("AR0404","",[348.924],E))
        ActionOverride(Player4,LeaveAreaLUA("AR0404","",[445.849],E))
        ActionOverride(Player5,LeaveAreaLUA("AR0404","",[665.963],E))
        ActionOverride(Player6,LeaveAreaLUA("AR0404","",[218.917],E))
        ActionOverride("rqjoses",DestroySelf())
        ActionOverride("rqabiyah",DestroySelf())
        SetInterrupt(TRUE)
        EscapeArea()~
    EXIT
END

BEGIN ~rqabiyah~

IF ~~ THEN BEGIN AbiyahIntro
    SAY ~Hmph. They sure let anyone into the guard these days... adventurers even.~
    =
    ~So, I was doing a courier duty for Corgeig, and near this beached ship, I suddenly noticed a wolf turning into a man and then back into a wolf. I tried to run but tripped. Luckily, I tripped into some discarded bags, and my misfortune of seeing this werewolf transforming was rewarded by these these filthy bags, covering me almost completely with a perfect vantage point, staring directly at the werewolf. Alerted but since I did not move and I was covered in filthy bags, he could not smell me either. Too scared to move, I just observed him for a while, then saw another man closing in on the werewolf's position. It was terrible. I tell you, terrible. We are living in a cruel, cruel age. *Shakes his head*.~
    IF ~~ THEN REPLY ~Have you taken a look at the corpse?~ GOTO NoOfCourseNot
    IF ~~ THEN REPLY ~Did you smell sulfur?~ GOTO SulfurOnceMore
    IF ~~ THEN REPLY ~Could you describe this man if you saw him again?~ GOTO DescribeYes
    IF ~~ THEN REPLY ~In which direction did the werewolf leave?~ GOTO LeftToWhere
END

IF ~~ THEN BEGIN SulfurOnceMore
    SAY ~Yes! I got a whiff of sulfurous stench. It almost made me vomit.~
    IF ~~ THEN REPLY ~I have more questions.~ GOTO RepeatedQuestionsAbiah
END

IF ~~ THEN BEGIN NoOfCourseNot
    SAY ~No, of course not, nor do I want to.~
    IF ~~ THEN REPLY ~I have more questions.~ GOTO RepeatedQuestionsAbiah
END

IF ~~ THEN BEGIN DescribeYes
    SAY ~Yes! I will never forget his horrid face.~
    IF ~~ THEN REPLY ~I have more questions.~ GOTO RepeatedQuestionsAbiah
END

IF ~~ THEN BEGIN LeftToWhere
    SAY ~I think he left towards the sewers.~
    IF ~~ THEN REPLY ~I have a different question.~ GOTO RepeatedQuestionsAbiah
    IF ~~ THEN REPLY ~How would you know that?~ GOTO RetreatToSewers
END

IF ~~ THEN BEGIN RetreatToSewers
    SAY ~I heard him saying: 'Must... retreat... to the sewers.'~
    IF ~~ THEN EXTERN ~rqjoses~ ProofInSewers
END

IF ~~ THEN BEGIN RepeatedQuestionsAbiah
    SAY ~More questions? I just want to go home.~
    IF ~~ THEN REPLY ~Have you taken a look at the corpse?~ GOTO NoOfCourseNot
    IF ~~ THEN REPLY ~Did you smell sulfur?~ GOTO SulfurOnceMore
    IF ~~ THEN REPLY ~Could you describe this man if you saw him again?~ GOTO DescribeYes
    IF ~~ THEN REPLY ~In which direction did the werewolf leave?~ GOTO LeftToWhere
END

// In Sewers
IF ~~ THEN BEGIN IAmAfraid
    SAY ~I am afraid, Joses.~
    IF ~~ THEN EXTERN ~rqjoses~ SpeakToCharname
END

// Jergun
BEGIN ~rqjergun~

IF ~Global("rqGDBG2BrokMurderers","GLOBAL",1)  !Global("rqGDBG2BrokSpokenToJergun","GLOBAL",1)~ THEN BEGIN JergunIntro
    SAY ~Joses has been telling me that this affair is cursed by the gods, but with your arrival, Brokkr, hopefully our luck will change. Greetings, I am Jergun.~
    IF ~~ THEN EXTERN ~rqbroJ~ NoNotMeBrokkr
END

IF ~Global("rqGDBG2BrokMurderers","GLOBAL",1) Global("rqGDBG2BrokSpokenToJergun","GLOBAL",1)~ THEN BEGIN Reconsidered
    SAY ~Please, good <MANWOMAN>. We need help. If you know anyone who could help help us, send them my way.~
    IF ~~ THEN REPLY ~I have reconsidered and decided to accept your offer.~ GOTO WhatItWouldBe
    IF ~~ THEN REPLY ~Apologies, this was a mistake.~ EXIT
END

IF ~~ THEN BEGIN WhatItWouldBe
    SAY ~Good, because we need help.~
    IF ~~ THEN REPLY ~What is the reward for helping the city watch?~ GOTO Reward
    IF ~~ THEN REPLY ~Your little courier mentioned that some House has requested aid from Brokkr. You should tell us more about this mysterious House.~ GOTO HouseBrokkr
    IF ~~ THEN REPLY ~So, what do you want from me?~ GOTO EnoughTalk
    IF ~~ THEN REPLY ~I do not want to involve myself with your affairs; I will not help you.~ GOTO Nope
END

IF ~~ THEN BEGIN TalkToJergunThen
    SAY ~We need help; either way, I won't look down on an adventurer. Perhaps <HESHE> might have the prerequisite skills to solve our predicament?~
    IF ~~ THEN REPLY ~What is the reward for helping the city watch?~ GOTO Reward
    IF ~~ THEN REPLY ~Your little courier mentioned that some House has requested aid from Brokkr. You should tell us more about this mysterious House.~ GOTO HouseBrokkr
    IF ~~ THEN REPLY ~So, what do you want from me?~ GOTO EnoughTalk
    IF ~~ THEN REPLY ~I do not want to involve myself with your affairs; I will not help you.~ GOTO Nope
END

IF ~~ THEN BEGIN Reward
    SAY ~Well... I can pay you in gold, though I think a better reward would be for you to put in a good word for your efforts, which would certainly boost the reputation of your party.~
    IF ~~ THEN REPLY ~How much gold are we talking about?~ GOTO RewardSpecific
END

IF ~~ THEN BEGIN RewardSpecific
    SAY ~200 gold pieces are all yours if you help us capture the killer. Also, any loot you might acquire will be considered confiscated for the use of the Athkatlan City Watch, which I will graciously give to you.~
    IF ~~ THEN REPLY ~I am sure you could do better than that.~ GOTO BetterReward
    IF ~~ THEN REPLY ~Bah, I have no interest in this. I am leaving!~ GOTO Nope
END

IF ~~ THEN BEGIN HouseBrokkr
    SAY ~I have no idea what you are talking about. We have requested help from a few adventurers, but none have come forward to assist me. I know that Brokkr gained some fame for himself by working for the Waterdeep City Watch.~
    IF ~~ THEN REPLY ~Then I would like to know what reward you are offering.~ GOTO RewardSpecific
END

IF ~~ THEN BEGIN Nope
    SAY ~Blast it, now I have to stay here!~
    IF ~~ THEN DO ~SetGlobal("rqGDBG2BrokSpokenToJergun","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN BetterReward
    SAY ~Ha! I work for the city watch, not for some well-off mercenary company.~
    IF ~~ THEN REPLY ~Well then, we have nothing more to say to each other, do we?~ GOTO Nope
    IF ~~ THEN REPLY ~200 gold is enough if there is a possibility of loot.~ GOTO TymoraSmiles
    IF ~~ THEN REPLY ~That's it, guard. I will not listen to your nonsense any longer!~ GOTO Nope
    IF ~~ THEN REPLY ~How about you tell me about your little courier? Which house was he talking about?~ GOTO HouseBrokkr
END

IF ~~ THEN BEGIN TymoraSmiles
    SAY ~Tymora smiles upon me. There almost always is Tymora's smile on me! Let me describe the incidents.~
    IF ~~ THEN GOTO EnoughTalk
END

IF ~~ THEN BEGIN EnoughTalk
    SAY ~Well, I am going to describe the three murders we have so far and two probable cases. The first murder happened near the Slums district. There were no eyewitnesses, but several witnesses noted a strong sulfurous odor near the male body. I asked Joses to find more, but it turned out to be a dead end. The victim was cut from behind with a large blade. Get this: the cuts were very imprecise and at strange angles; it looked like the user has some sort of physical defect or is very small and lacks strength.~
    IF ~~ THEN GOTO NextMurders
END

IF ~~ THEN BEGIN NextMurders
    SAY ~The second and third murders are similar, but this time a peasant woman was cut from the back with a large blade, again with badly aligned cuts. This is what links all three murders: the same same killing method.~
    IF ~~ THEN REPLY ~Sounds like a very weak case with no clues.~ GOTO WeakCase
    IF ~~ THEN REPLY ~Did the killer do anything to the corpses?~ GOTO StateOfCorpses
    IF ~~ THEN REPLY ~Were there any eyewitnesses this time?~ GOTO Eyewitnesses
    IF ~~ THEN REPLY ~If the culprit is small and lacks strength, why does he use large blades for his murders?~ GOTO SmallStrength
    IF ~~ THEN REPLY ~What about the sulfurous stench?~ DO ~IncrementGlobal("rqGDBG2Sulfur","GLOBAL",1)~ GOTO Sulfur1
END

IF ~~ THEN BEGIN RepeatedQuestion
    SAY ~Well, then, the sooner we finish here, the sooner I can be off.~
    IF ~~ THEN REPLY ~Sounds like a very weak case with no clues.~ GOTO WeakCase
    IF ~~ THEN REPLY ~Did the killer do anything to the corpses?~ GOTO StateOfCorpses
    IF ~~ THEN REPLY ~Were there any eyewitnesses this time?~ GOTO Eyewitnesses
    IF ~~ THEN REPLY ~If the culprit is small and lacks strength, why does he use large blades for his murders?~ GOTO SmallStrength
    IF ~~ THEN REPLY ~What about the sulfurous stench?~ DO ~IncrementGlobal("rqGDBG2Sulfur","GLOBAL",1)~ GOTO Sulfur1
    IF ~~ THEN REPLY ~I've heard enough; I want to see the other victims.~ GOTO HeardEnough1
END

IF ~~ THEN BEGIN Eyewitnesses
    SAY ~None ever came forward; we only know who discovered the body.~
    IF ~~ THEN REPLY ~And who was that?~ GOTO NotKnowDetails
END

IF ~~ THEN BEGIN NotKnowDetails
    SAY ~I do not know this detail; ask Joses.~
    IF ~~ THEN EXTERN ~rqjoses~ NameOfWitness
END

IF ~~ THEN BEGIN IlmenReturn
    SAY ~Ilmen, yes. Why did I forget that? Is there something else you wanted to ask?~
    IF ~~ THEN REPLY ~Yes, I have more questions.~ GOTO RepeatedQuestion
    IF ~~ THEN REPLY ~Nope, no more questions.~ GOTO HeardEnough1
END

IF ~~ THEN BEGIN StateOfCorpses
    SAY ~They had their eyes plucked out and blood drained.~
    IF ~~ THEN REPLY ~Are you saying that the first male peasant has nothing done to him?~ GOTO StateOfCorpses2
END

IF ~~ THEN BEGIN StateOfCorpses2
    SAY ~The left eye has been damaged, but it was still in its socket, and blood was not drained from the victim.~
    IF ~~ THEN REPLY ~Perhaps the murder was just interrupted. Have you considered that?~ GOTO YesRight
    IF ~~ THEN REPLY ~No questions, Jergun.~ GOTO HeardEnough1
END

IF ~~ THEN BEGIN YesRight
    SAY ~And that's why I want your help. Do you have more questions?~
    IF ~~ THEN REPLY ~Yes, more questions.~ GOTO RepeatedQuestion
    IF ~~ THEN REPLY ~I've heard enough.~ GOTO HeardEnough1
END

IF ~~ THEN BEGIN WeakCase
    SAY ~Yeah, it is. I need to move to Riatavin as soon as possible.~
    IF ~~ THEN REPLY ~I have more questions.~ GOTO RepeatedQuestion
END

IF ~~ THEN BEGIN Sulfur1
    SAY ~Now that I think about it, yes, there was some sulfurous smell... but it was faint. Joses has been inquiring around, but nothing significant came of it.~
    IF ~~ THEN REPLY ~Another question, Jergun.~ GOTO RepeatedQuestion
    IF ~~ THEN REPLY ~I am taking your burden, Jergun.~ GOTO HeardEnough1
END

IF ~~ THEN BEGIN SmallStrength
    SAY ~I have already talked to more beggars,, children, crippled low-lives, and scum than you have in your entire life, and I am still no closer to finding the culprit.~
    IF ~~ THEN REPLY ~More questions, Jergun.~ GOTO RepeatedQuestion
    IF ~~ THEN REPLY ~You have convinced me; I am taking this quest of yours.~ GOTO HeardEnough1
END

IF ~~ THEN BEGIN HeardEnough1
    SAY ~As soon as I saw Brokkr, I knew this investigation would be in good hands. Farewell. Oh, and Joses will be my replacement from now on. Again, farewell.~
    IF ~~ THEN DO
            ~SetGlobal("rqGDBG2BrokMurderers","GLOBAL",2)
            EscapeArea()~ EXTERN ~rqjoses~ JergunRuns
END

BEGIN ~rqbroJ~

// Reaction to Jergun
IF ~~ THEN BEGIN NoNotMeBrokkr
    SAY ~Bah! This ain't got nothin' to do with me, ya long-legged blowhard. If <CHARNAME> wants to drag himself into this foolish murder hunt, that's entirely his own damn business.~
    IF ~~ THEN EXTERN ~rqjergun~ TalkToJergunThen
END
// Reaction to Finishing the Quest

IF ~Global("rqGDBG2BrokMurderers","GLOBAL",6)~ THEN BEGIN Jergun
    SAY ~Aye, them treacherous scum used that cursed Jergun to shackle me into snatchin' up this lycanthrope, no doubt fer their own damned warband. No corpses lie 'round, so they're likely cleanin' up their tracks. Now they've burnt Jergun to ash, I doubt they'll bother me again, ha!~
    IF ~~ THEN DO %SetGlobal("rqGDBG2BrokMurderers","GLOBAL",7)
            AddexperienceParty(19800)
    EraseJournalEntry(~Brokkr's murder plot

            I need to think twice before I accept work from any authority. Do they expect me to follow a smell throughout Athkatla? Am I a bloodhound? Despite Jergun asking me to investigate these murders, it seems someone is trying to impede my investigation. I should trust no one. Another murder has supposedly occurred north of the Copper Coronet. Joses will be waiting for me there, hopefully with more actionable proof than just a sulfurous smell.~)
            EraseJournalEntry(~Brokkr's murder plot

            I have agreed to investigate a series of murders for Jergun from the city guard. The murderer is targeting peasants. Murderer is or are of small stature and physically weak. Murderer leaves behind disfigured corpses. Some, not all, have been found with eyes removed and blood drained. There are no witnesses. Joses is my aide in the investigation. I am to continue the investigation southeast of the Docks district.~)
            EraseJournalEntry(~Brokkr's murder plot

        I would have never thought that a cold man like Brokkr would help solve a murder case in Water Waterdeep. Either way, if I am inclined to gain further insight into this mystery, I should talk to Jergun Ermingsen in the Council of Six Building. I doubt that questioning the dwarf about this would result in revealing any interesting details.~)%
        SOLVED_JOURNAL ~Brokkr's murder plot finished

        This whole thing was a setup! Treacherous Abiyah and Joses have tried to use me to capture wewerwolf for their army. While shapeshifer Anton was roaming the sewers hunting for for cures though I have no doubt that he would kill anyone if opportunity occured.~
    EXIT
END

IF ~~ THEN BEGIN DonnaeKnow
    SAY ~Eh, what's yer name, little runt? Which house sent ya down 'ere?~
    IF ~~ THEN EXTERN ~rqtegwyn~ WrongDwarf
END

IF ~~ THEN BEGIN NotMyStuff
    SAY ~Listen up, ye little whelp with no kin. My loyalty's not with yer damned friends' house. Tell 'em that, and if ye want yer blasted job, it depends on <CHARNAME>, not me.~
    IF ~~ THEN EXTERN ~rqtegwyn~ AskCharname
END

// Gnoll Stronghold
IF ~Global("rqGDBrokkrTreasure","GLOBAL",1)~ THEN BEGIN GnollStronghold
    SAY ~Aye, this be the spot! We'll carve every last gnoll and scour their stinkin' hides for every piece of gold and treasure they might be havin'.~
    IF ~~ THEN DO ~SetGlobal("rqGDBrokkrTreasure","GLOBAL",2)~ EXIT
END

// Have axe
IF ~Global("rqGDBrokkrTreasure","GLOBAL",2)~ THEN BEGIN HaveAxe
    SAY ~At last, me axe is sheathed 'round me belt!~
    IF ~~ THEN DO
        %SetGlobal("rqGDBrokkrTreasure","GLOBAL",3)
        EraseJournalEntry(~Brokkr's Treasure

        Dwarf Brokkr had his axe stolen by gnolls located in Gnoll Stronghold, and I have agreed to recover it.~)%
        SOLVED_JOURNAL ~Brokkr's Treasure

        I have recovered Brokkkr's axe from the clutches of gnolls in their very own stronghold.~
    EXIT
END

// Baldur's Gate training manual quest
IF ~Global("rqGDBrokkrTreasure","GLOBAL",3)~ THEN BEGIN KorolnorManualIntro
    SAY ~Aye, I remember somethin' 'bout this blasted city. There be dwarven militia training manual. That unworthy pointyear Progunnos holds it now, but I won't stand for that scum heap layin' claim to our dwarven relic.~
    IF ~~ THEN REPLY ~So what do you want from me?~ GOTO KorolnorCharname
END

IF ~~ THEN BEGIN KorolnorCharname
    SAY ~We gotta track down this Progunnos and put an end to his miserable existence. But before we send him to the afterlife, we should torture him till he screams every last bit o' how that cursed manual fell into his grubby paws.~
       IF ~~ THEN REPLY ~Is that manual really that valuable?~ GOTO KorolnorManual
END

IF ~~ THEN BEGIN KorolnorManual
    SAY ~Ah, ye ears clogged with wax, eh? Bah! The manual be a treasure worth its weight in mithril, though as finders, we've got the right to squeeze every drop of its worth. I've got a stubborn dwarven merchant waitin' with a bag heavy as a stone hoard, ready to pay a mighty steep price.~
    IF ~~ THEN REPLY ~Sounds great. How do we find this Progunnos?~ GOTO ProgunnosFind
    IF ~~ THEN REPLY ~We do not have time for this, Brokkr.~ GOTO KorolnorRefusal
END

IF ~~ THEN BEGIN KorolnorRefusal
    SAY ~Oy, yer skull's as empty as a sack o' stones, ye blithering fool! I'm sharin' a gold-makin' scheme simple as crushin' a goblin's skull—yer just gotta do a little killin'. And what do ye say to me, eh?~
    IF ~~ THEN REPLY ~On the other hand, I'd rather be rich, not poor.~ GOTO ProgunnosFind
    IF ~~ THEN REPLY ~I've had enough of your attitude. Find that bloody manual yourself!~ GOTO KorolnorRefusal2
END

IF ~~ THEN BEGIN ProgunnosFind
    SAY ~Well now, looks like yer noggin ain't as empty as I thought. If we gotta find that cursed Progunnos, there's only one way: Talk to me mate Torl Bonechewer. If he can't track the bastard down, then no one in this blasted city can.~
    IF ~~ THEN REPLY ~If that manual is valuable as you say, I shall join you in recovering it.~ GOTO KorolnorAgreed
    IF ~~ THEN REPLY ~No, your antics are annoying. Go find your manual on your own!~ GOTO KorolnorRefusal2
END

IF ~~ THEN BEGIN KorolnorRefusal2
    SAY ~Bah, ye fools! I laid a simple path to gold before ye, and ye spat on it! I won't be servin' a bunch o' dim-witted varmints like ye!~
    IF ~~ THEN DO
        %SetGlobal("rqGDBrokkrJoined","LOCALS",0)
        SetGlobal("rqGDBrokkrTreasure","GLOBAL",10)
        LeaveParty()
        EscapeArea()%
    EXIT
END
// Brokkr's Treasure Ch II Agreed 211
IF ~~ THEN BEGIN KorolnorAgreed
    SAY ~Har...har...har... Yer skull ain't empty! We best scurry and talk with Torl in the Blushing Mermaid Inn.~
    IF ~~ THEN DO
        %SetGlobal("rqGDBrokkrTreasure","GLOBAL",4)%
        UNSOLVED_JOURNAL ~Brokkr's Treasure Chapter II

        Dwarf Brokkr asked me to acquire dwarven militia training manual. Whatever that is, it must be quite valuable to dwarves. Only lead Brokkr has is that a man named Torl is in the Blushing Mermaid.~
    EXIT
END
// Brokkr Torl Exchange
IF ~~ THEN BEGIN BrokkrTorl1
    SAY ~That's why I be here—gonna pry that blasted Dwarven manual outta Progunnos' cold, dead hands!~
    IF ~~ THEN EXTERN ~rqtorl~ TorlNoKnowProgunnos
END

IF ~~ THEN BEGIN BrokkrNoHonor
    SAY ~Yer father had no honor, Torl. Now spill it—where's Progunnos? Or I'll carve more pain into ya than that bloody barrel ride ever brought ya!~
    IF ~~ THEN EXTERN ~rqtorl~ TorlPlaysDumb
END

IF ~~ THEN BEGIN BrokkrShakesUpTorl
    SAY ~*Brokkr reaches for his weapon*~
    IF ~~ THEN EXTERN ~rqtorl~ TorlAdmitsPlayingDumb
END
// 212
IF ~~ THEN BEGIN BrokkrReward
    SAY ~As reward, Torl, I shan't nail ya shut in a barrel like last time.~
    IF ~~ THEN DO
        %SetGlobal("rqGDBrokkrTreasure","GLOBAL",5)
        ActionOverride("rqtorl",EscapeArea())%
        UNSOLVED_JOURNAL ~Brokkr's Treasure Chapter II

        I have tracked down Torl, who was supposed to know where Progunnos is, and it looks like he went to the Friendly Arm Inn to sell the manual.~
    EXIT
END

IF ~~ THEN BEGIN BrokkrKillNemaricus
    SAY ~Slay the merchant, but leave th' elf alive!~
    IF ~~ THEN DO
        ~ActionOverride("rqnemar",Enemy())
        ActionOverride("rqfig9a1",Enemy())
        ActionOverride("rqfig9b1",Enemy())
        ActionOverride("rqthi8a1",Enemy())
        ActionOverride("rqthi8b1",Enemy())~
    EXTERN ~rqnemar~ NemaricusInterrupted
END

IF ~~ THEN BEGIN BrokkrNotSoMuch
    SAY ~You ain't got no friends, Progunnos. Spill it—how in the Nine Hells did that Dwarven manual end up in yer filthy hands?~
    IF ~~ THEN EXTERN ~rqprog~ ProgunnosCont
END

IF ~~ THEN BEGIN BrokkrLetMeGo
    SAY ~If ye make this simple enough, maybe I'll consider it, ye blaggard.~
    IF ~~ THEN EXTERN ~rqprog~ ProgunnosSpillsTheBeans
END

IF ~~ THEN BEGIN BrokkrFinishesTheRest
    SAY ~Hah! So ye kept yer trap shut 'cause it was dwarven relic, aye? Thought ye could sell it quick, did ye? But ye were daft enough to try sell it to dwarven merchant who knows me. Now ye've got a problem, ye vulture.~
    IF ~~ THEN EXTERN ~rqprog~ ProgunnosRuns
END
// Progunnos Dead 213
IF ~Global("rqGDBrokkrTreasure","GLOBAL",7) Dead("rqprog")~ THEN BEGIN BookIsOurs
    SAY ~*Throws rock at Progunnos corpse* Listen here, Progunnos. If ye were a better thief, ye'd still be breathin' today. But now, we're gettin' drunk and stuffed with grub, all on yer work. You good-fer-nothing rat! Alright, listen up, ye scallawags. All we gotta do now is go see me buddy Azrammar in Sorcerous Sundries. He's got a king's ransom waitin' for us if we bring him that blasted manual.~
    IF ~~ THEN DO
        %SetGlobal("rqGDBrokkrTreasure","GLOBAL",8)%
        UNSOLVED_JOURNAL ~Brokkr's Treasure Chapter II

        Progunnos is dead and the dwarven manual is in my possession. When I have finished reading it, I should go to Baldur's Gate and return the manual to the dwarf Azrammar in Sorcerous Sundries for a big reward.~
    EXIT
END
// Progunnos Escaped
IF ~Global("rqGDBrokkrTreasure","GLOBAL",7) !Dead("rqprog")~ THEN BEGIN BookIsNotOurs
    SAY ~Blast it all! That cursed Progunnos got away, he did! Now we'll never lay hands on that damn manual—curse his hide!~
    =
    ~Torl's scarpered into the blasted hills, an' we'll ne'er lay eyes on that sneak again! He's gone fer good, mark my words!~
    IF ~~ THEN DO
        %SetGlobal("rqGDBrokkrTreasure","GLOBAL",10)
        EraseJournalEntry(~Brokkr's Treasure Chapter II

        Dwarf Brokkr asked me to acquire dwarven militia training manual. Whatever that is, it must be quite valuable to dwarves. Only lead Brokkr has is that a man named Torl is in the Blushing Mermaid.~)

        EraseJournalEntry(~Brokkr's Treasure Chapter II

        I have tracked down Torl, who was supposed to know where Progunnos is, and it looks like he went to the Friendly Arm Inn to sell the manual.~)

        EraseJournalEntry(~Brokkr's Treasure Chapter II

        Progunnos is dead and the dwarven manual is in my possession. When I have finished reading it, I should go to Baldur's Gate and return the manual to the dwarf Azrammar in Sorcerous Sundries for a big reward.~)%
        SOLVED_JOURNAL ~Brokkr's Treasure Chapter II failure

        I have failed to kill Torl before he could escape, and thus I am unable to return the training manual.~
    EXIT
END

IF ~~ THEN BEGIN BrokkrRelic
    SAY ~Bah! Fine, ye be talkin' to me heart, Azrammar. The relic's safe in yer grimy mitts now. But ye best not linger! Off with ye to Mithral Hall with yer good news, or face me wrath!~
    IF ~~ THEN EXTERN ~rqazram~ Azrammar02
END

// Brokkr treasure Ch3
IF ~OR (2)
        Global("Hurganquest","GLOBAL",1)
        Global("TalkToHurgan","GLOBAL",1)
    Global("rqGDBrokkrTreasure2","GLOBAL",0)~ THEN BEGIN BrokkrTreasure
    SAY ~Ah, so I lay eyes on him, and what do I remember? This sorry excuse for dwarf he's forgotten me, but I have not. Say, <CHARNAME>, ye ready fer some serious shovelin'? Diggin' up a treasure trove, aye! Har! Har!~
    IF ~~ THEN REPLY ~I might if it will be worth my time, Brokkr.~ GOTO MightWorth
    IF ~~ THEN REPLY ~About who are you talking?~ GOTO WhoYouBeTalking
    IF ~~ THEN REPLY ~Why would I care for more treasure? I am rich enough now.~ GOTO NotWorth1
    IF ~~ THEN REPLY ~If it doesn't interfere time-wise, why not?~ GOTO MightWorth
END

IF ~~ THEN BEGIN WhoYouBeTalking
    SAY ~Hurgan Dullblade! Ye forgot to burrow out the wax in yer ears, or what?~
    IF ~~ THEN REPLY ~For now, I say yes, though you need to tell me where it is.~ GOTO MightWorth
    IF ~~ THEN REPLY ~No, I don't want any distractions right now. Go and search for your treasure yourself!~ GOTO RefusalHurganTreasure
END

IF ~~ THEN BEGIN MightWorth
    SAY ~Bah! I know the place, ye dobber. Show me ya ain't as daft as a broken pick. As fer gettin' rich, we'll be leechin' Hurgan dry what's not yer likin'?~
    IF ~~ THEN REPLY ~Fine, how do we split the treasure?~ GOTO TreasureSlit
END

IF ~~ THEN BEGIN NotWorth1
    SAY ~What in the fiery depths do I hear?! What goblin-spawned fool's drivel is coming outta yer skull, <CHARNAME>?~
    IF ~~ THEN REPLY ~Perhaps you are right, my Dwarven friend. I could use some extra gold.~ GOTO TreasureSlit
    IF ~~ THEN REPLY ~I am not interested in your feeble schemes. Get someone else to dig out your trinkets!~ GOTO RefusalHurganTreasure
END

IF ~~ THEN BEGIN TreasureSlit
    SAY ~Listen up, <CHARNAME>! Ye talk to my greedy heart, do ye? Well, there's gold and magic piled high afore ye. Think I'm gettin' better part of the bargain, do ye? Ha! Let me tell ye this it's only good good for me, or maybe Hurgan the fool. No, not her… no one else!~
    IF ~~ THEN REPLY ~So where is the treasure, Brokkr?~ GOTO WhereBeTreasure
END

IF ~~ THEN BEGIN WhereBeTreasure
    SAY ~Listen ye, <CHARNAME>, I ain't got a goat's head for a brain. We's headin' to that tree blighted place called Peldvale. Once we be there, I'll show ye the way if ye can keep up, that is.~
    IF ~~ THEN REPLY ~Well, go there, Brokkr.~ GOTO AgreedToTreasureHunt
    IF ~~ THEN REPLY ~You should pitch your tall tales to someone else, Dwarf.~ GOTO RefusalHurganTreasure
END

IF ~~ THEN BEGIN AgreedToTreasureHunt
    SAY ~No mushies sproutin' from me noggin! Let's skedaddle to Peldvale, afore yer stomach worms grow restless. I've got me eye on that cursed magic trinket, and I'll be damned if I wait any longer!~
    IF ~~ THEN DO %SetGlobal("rqGDBrokkrTreasure2","GLOBAL",1)%
        UNSOLVED_JOURNAL ~Brokkr's Treasure Hurgan's Cache

        A new treasure hunt. I'm beginning to think this dwarf has a nose for treasure, though I'm unsure what kind of magic item he's after. Either way, I should travel to Peldvale to investigate this mystery.~
    EXIT
END

IF ~~ THEN BEGIN RefusalHurganTreasure
    SAY ~No more, I say! I'll not be listenin' to yer blatherin' mole squeakin'. I be headin' off fer some treasure huntin'.~
    IF ~~ THEN DO
        %SetGlobal("rqGDBrokkrJoined","LOCALS",0)
        SetGlobal("rqGDBrokkrTreasure2","GLOBAL",10)
        LeaveParty()
        EscapeArea()%
    EXIT
END

IF ~~ THEN BEGIN FoundOldLove
    SAY ~Heh, what's this now? Talkin' 'bout morality, ye thievin'' harlot!~
    IF ~~ THEN EXTERN ~rqruth~ Unsubstantiated
END

IF ~~ THEN BEGIN NotAngry
    SAY ~Ah, yer sweet tongue drips with venom, poisonin' every word. Have ye? Grylys' brother spilled all, he did. Yet, I bear no wrath.~
    IF ~~ THEN EXTERN ~rqruth~ YerNot
END

IF ~~ THEN BEGIN Overjoyed
    SAY ~Nay I be too dammed pleased to afterlife ye poultry cock rider!~
    IF ~~ THEN EXTERN ~rqruth~ BringItOn
END

//  In Peldvale
IF ~Global("rqGDBrokkrTreasure2","GLOBAL",1)~ THEN BEGIN PeldvaleIntro
    SAY ~Bah! A cursed patch o' thorns an' shadows, this place. Aye, I ken these waters from the east those lakes be familiar. We march eastward, aye, until we find the edge o' the woods. No turnin' back now!~
    IF  ~~ THEN DO ~SetGlobal("rqGDBrokkrTreasure2","GLOBAL",2)~ EXIT
END

//  In Peldvale
IF ~Global("rqGDBrokkrTreasure2","GLOBAL",2) Dead("rqruth")~ THEN BEGIN PeldvaleIntro
    SAY ~Eardrum breacher's dead. I figgered she was gone, but now she's truly dead, fer sure. Wanted to piss on her corpse, but reckon I'd rather skulk away. Best to leave her fer the beastly forest filth to feast on. Before we march out, ye better root through her carcass. She damn well knew knew where Hurgan's hidden hoard lies, aye.~
    IF  ~~ THEN
        DO %SetGlobal("rqGDBrokkrTreasure2","GLOBAL",3)
            EraseJournalEntry(~Brokkr's Treasure Hurgan's Cache

        A new treasure hunt. I'm beginning to think this dwarf has a nose for treasure, though I'm unsure what kind of magic item he's after. Either way, I should travel to Peldvale to investigate this mystery.~)%
            SOLVED_JOURNAL ~Brokkr's Treasure Hurgan's Cache found

            Looks like Brokk's former lover wanted to get the same treasure I did and sprung an ambush for me. What surprised me was how somber Brokk was after her death; regardless, I should check her corpse for any treasure.~
        EXIT
END

// Baldur's Gate II quests

IF ~Dead("rqiacob") // Iacob
    Dead("rqavaram") // Avaram
    Dead("rqmicha") // Michaël
    Dead("rqiosias") // Iosias
    Dead("rqgedeon") // Gedeon
    Dead("rqdaniel") // Daniell
    Dead("rqelias") // Eliasson
    AreaCheck("AR0800") // Graveyard
    Global("rqGDBrokkrKnows","GLOBAL",2)~
    THEN BEGIN BG2IntroBrokkr
    SAY ~Bah! It's no surprise these bloodthirsty fools met their end. These scum have slurped down goblets of child's blood, and what else could I expect from such a mad, rabid pack?~
    IF ~~ THEN EXIT
END

// Graveyard ambush reaction
IF ~Dead("rqiacob") // Iacob
    Dead("rqavaram") // Avaram
    Dead("rqmicha") // Michaël
    Dead("rqiosias") // Iosias
    Dead("rqgedeon") // Gedeon
    Dead("rqdaniel") // Daniell
    Dead("rqelias") // Eliasson
    AreaCheck("AR0800") // Graveyard
    Global("rqGDBrokkrKnows","GLOBAL",1)~
    THEN BEGIN BG2IntroBrokkr
    SAY ~Aye, I be recognizin' these fools. I worked fer 'em fer a good stretch. They were into some dark, nasty stuff sacrifices, drainin' the blood of a youngster, ya ken. Had to split, 'cause this kind o' cult pulls a crowd from the city guard and brings every watchman down on ye.~
    IF ~~ THEN REPLY ~Why do you think they after us?~ GOTO WhyAfterUs
    IF ~~ THEN REPLY ~Blood you say? Perhaps then they were after me because of my heritage?~ GOTO HeritageOfBhaal
END

IF ~~ THEN BEGIN WhyAfterUs
    SAY ~Aye, ye deaf as a stone, or somethin'! I told ye plain: we're into drinkin' blood fer eternal youth, or some cultist's nonsense. Likely them blasted folk reckon the blood o' yer kin would grant 'em sumthin' mighty or better. I ken not the mind o' madness, an' I don't want to tangle with it neither.~
    IF ~~ THEN REPLY ~How did they found us?~ GOTO FoundUs
    IF ~~ THEN REPLY ~You were saying that you worked for them in which city exactly?~ GOTO CityWhich
END

IF ~~ THEN BEGIN HeritageOfBhaal
    SAY ~Aye, ye stubborn fool, yer skull ain't there merely fer wearin' a helm.~
    IF ~~ THEN REPLY ~Knowing how could they found me would help me immensely Brokkr.~ GOTO WhyAfterUs
    IF ~~ THEN REPLY ~And these cultists were based in which city?~ GOTO CityWhich
END

IF ~~ THEN BEGIN CityWhich
    SAY ~They've got a holdfast in Waterdeep, aye, though they're small as a gobbet o' rock. They can haul their lair anywhere they please, on a whim.~
    IF ~~ THEN REPLY ~How many cultists did you saw when you were working for them?~ GOTO HowManyMore
END

IF ~~ THEN BEGIN HowManyMore
    SAY ~Seven they were, undead crowdin' and them hired guards in tow. By my guess , I reckon we carved the blasted cult clean from the rock. Those hired lads and their pitiful acolytes won't muster an attack from Waterdeep, not if they could even lay eyes on ye here. I don't think ye have aught left to fear from them.~
    IF ~~ THEN REPLY ~If that's not true, I will be holding you accountable, dwarf.~ GOTO NopeNothingBrokkr
    IF ~~ THEN REPLY ~I do hope you are correct, Brokkr.~ GOTO NopeNothingBrokkr
END

IF ~~ THEN BEGIN FoundUs
    SAY ~Ye could wring th' same answer from a rock, ya stubborn lump. I've got nae idea, <CHARNAME>.~
    IF ~~ THEN GOTO NopeNothingBrokkr
END

IF ~~ THEN BEGIN NopeNothingBrokkr
    SAY ~Bah! All that talk we spake can go to the shadows. If they dare sulk up here, ye stood taller than a mountain and ye'll tear them to pieces, what with ye already gut-slit their chiefs. We know ye're more than enough.~
    IF ~~ THEN EXIT
END

// Brokkr drow reaction
IF ~~ THEN BEGIN BrokkrSecret
    SAY ~Blast it all! Looks like me old patrons be crawl'n back from the depths, demandin' their dues. I hate this worse than a cave full of goblins. Gimme a favor here, <CHARNAME>.~
    IF ~~ THEN REPLY ~You have fought for me well enough, Brokkr, but first I need to know who we are up against.~ GOTO WhoAreWeUpAgainst
    IF ~~ THEN REPLY ~What do I get out of it?~ GOTO  WhyShouldI
    IF ~~ THEN REPLY ~I might have agreed if I knew who these patrons of yours are.~ GOTO WhoAreWeUpAgainst
    IF ~~ THEN REPLY ~Why should I dwarf?~ GOTO WhyShouldI
END

IF ~~ THEN BEGIN  WhyShouldI
    SAY ~Listen up, if you're thinkin' of travelin' with me, ye best heed my words. These old patrons of mine, they ain't the kind to forget easily. If we ignore 'em, they might ambush us when we least expect it migth be at a bad time, mind ye. An ambush outta the blue, uncalled for, could spell trouble for both of us. Be wise and tread carefully in this.~
    IF ~~ THEN REPLY ~Fine but I still need to know who are we up against.~ GOTO WhoAreWeUpAgainst
    IF ~~ THEN REPLY ~And why would I aid you if you would just bring ambushes against me?~ GOTO DontNeedYourHelp
END

IF ~~ THEN BEGIN  DontNeedYourHelp
    SAY ~Bah! Ye needn't bother, lad. I ain't no simple goblin! I can carry me own damn burdens, <CHARNAME>!~
    IF ~~ THEN REPLY ~I would like to know how these patrons of yours knew about you.~ GOTO WhoAreWeUpAgainst
    IF ~~ THEN REPLY ~You do that. Now get out of my party, Brokkr.~ GOTO FineIDidntLikeYouAnyway
END

IF ~~ THEN BEGIN  WhoAreWeUpAgainst
    SAY ~Bah! I hate t' say it, but I was raised by those dark elves the drow, the cursed spawn of the Underdark. They've been my masters since I was a wee one. Trained me as their arts of subterfuge, and I did as I was told what else could I do? I broke free from their grip some time ago, but not so long ago that some drow might might've seen my face during our recent trip through the depths with ye.~
    IF ~~ THEN REPLY ~What did you do for drow?~ GOTO NothingIWantToShare
    IF ~~ THEN REPLY ~You have fought for me, so I will help you.~ GOTO AcceptedQuest1
    IF ~~ THEN REPLY ~No, I don't have time for this.~ GOTO RejectedQuest1
    IF ~~ THEN REPLY ~I will do this as a favor, but don't push it too far.~ GOTO AcceptedQuest1
END

IF ~~ THEN BEGIN  FineIDidntLikeYouAnyway
    SAY ~Hah! Fine ye, dirtbag!~
    IF ~~ THEN DO
        ~SetGlobal("rqGDBrokkrJoined","LOCALS",0)
        LeaveParty()
        EscapeArea()~
    EXIT
END

IF ~~ THEN BEGIN  NothingIWantToShare
    SAY ~Hah! Nothing I care to share with ye, and it'd do ye no good even if I did.~
    IF ~~ THEN REPLY ~Have it your way then. I will meet with these drow. I am intrigued what they could want from you.~ GOTO AcceptedQuest1
    IF ~~ THEN REPLY ~I can't have a party member who has a secret alliance with drow, even if a former one.~ GOTO FineIDidntLikeYouAnyway
END

IF ~~ THEN BEGIN AcceptedQuest1
    SAY ~Listen here, ye scrawny fool: tell 'em I'll get there, and I'll do it the hard way if I must.~
    IF ~~ THEN EXTERN ~rqcourbr~ DrowWillBeHappy
END

IF ~~ THEN BEGIN RejectedQuest1
    SAY ~If they dare attack me, I'll think up such hellish tortures they'll be beggin' for a quick end, aye!~
    IF ~~ THEN EXTERN ~rqcourbr~ DispleasedDrow
END


// Drow in tethyr forest
IF ~~ THEN BEGIN SpareMeOfThisCrap
    SAY ~Bah! Quit yer infernal tongue, spider-legged Malzoth! Speak Common, I know ye can do it so do it, or else!~
    IF ~~ THEN EXTERN ~rqdwiz01~ HereIThought
END

IF ~~ THEN BEGIN JustSpitItOut
    SAY ~Bah, spit it out, Malzoth! What is it ya want, eh?~
    IF ~~ THEN EXTERN ~rqdwiz01~ GistOfIt
END

IF ~~ THEN BEGIN KnowWhatYerDoing
    SAY ~Bah! I hope ye knows what ye do, ye fool. Malzoth's as sly as a fox, he is. If hell's got no more demands from me, I'll be happier than a drunken oaf in his ale.~
    IF ~~ THEN
            UNSOLVED_JOURNAL ~Brokkr's family: Spy in Suldanesselar accepted

            I have met the drow *foster father* of Brokkr, and no love has been lost between the two. Though I have accepted his request to map Suldanesselar's defences.~
        EXIT
END

IF ~~ THEN BEGIN DeminDeadSuldanesselar
    SAY ~Bah! I hope ye knows what ye do, ye fool. Malzoth's as sly as a fox, he is. If hell's got no more demands from me, I'll be happier than a drunken oaf in his ale.~
    IF ~~ THEN
            UNSOLVED_JOURNAL ~Brokkr's family: Spy in Suldanesselara and kill Demin

            I have met the drow *foster father* of Brokkr, and no love has been lost between the two. Though I have accepted his request to map Suldanesselar's defences and to assassinate Priestess Demin.~
        EXIT
END

IF ~~ THEN BEGIN RejectedMalzoth
    SAY ~Hah! Good. Refusin' him was wise. I'd not waste a single thread o' my beard on that cursed drow scum.~
    IF ~~ THEN DO
        %EraseJournalEntry(~Brokkr's family: Accepted the invitation to to parlay with Drow

        Looks like my companion Brokkr have been brought up by the drow and he admitted that he worked for them though he claimed he does no longer serves them. The drow contacted him again I think it would better to speak to drow to ascertain their goals with Brokkr. We are supposed to meet in Forest of Tethyr.~)%
            SOLVED_JOURNAL ~Brokkr's family: Spy in Suldanesselar rejected

            I have met the drow *foster father* of Brokkkr, and no love has been lost between the two. I will certainly not betray elves when they are in their greatest need, so I have rejected Malzoth's proposal.~
        EXIT
END

// InParty Prattle
CHAIN IF ~InParty("Korgan")
        See("Korgan")
        !StateCheck("Korgan",STATE_SLEEPING)
        Global("rqGDKorganPrattle","LOCALS",0)~ THEN BKORGAN brokkorgan
    ~Brokkr, ye might be me long-lost brother. The way ye cut up our last foe and brutal as th' hammers!~
DO ~SetGlobal("rqGDKorganPrattle","LOCALS",1)~
== rqbroJ ~Nay, I favor fightin' from distance, strikes from the shadows. And ye're not my brother, Bloodaxe.~
== BKORGAN ~Har! Ye reckon ye be Brokkr's boy, eh? I meant no offense, unless ye be wantin' a lick o' trouble. Ye ditch-sniffin', sniffin' scoundrel!~
== rqbroJ ~Hush yer yap, ye snivelin' runt, or lash that axe o' yours at me, Bluntaxe!~
== BKORGAN ~Aye, that be the fire I expected, har har har!~
EXIT

CHAIN IF ~InParty("Edwin")
        See("Edwin")
        !StateCheck("Edwin",STATE_SLEEPING)
        Global("rqGDEdwinPrattle","LOCALS",0)~ THEN BEDWIN brokedwin
    ~What kind of father names his son Brokkr? Isn't that an odd name for dwarf from Waterdeep?~
DO ~SetGlobal("rqGDEdwinPrattle","LOCALS",1)~
== rqbroJ ~I was born in Adbar, ye spellwanker. Say one more word 'bout me da and I'll gut ye in yer sleep.~
== BEDWIN ~(Striking an intelligent conversation with short-legged simians is harder than I thought.) I'd like to see you try, you feckless shrub dwarf! More likely a vertically challenged dwarf like you will have trouble scaling stairs, I would think.~
== rqbroJ ~Ye can fiddle with yer word-gnarlin' all ye want, I ain't interested. Or bring it on if ye wanna see more red than the dye in yer cloak. Step closer and regret it.~
== BEDWIN ~(Looks like the mind of this beardgunk can only comprehend and utter threats. Perhaps I could use it to my advantage later...) Dwarf, if I wanted, I could torch you in an instant!~
== rqbroJ ~Listen up, ye treacherous soft-skin: I ken these threats, and from yer grimace I'd wager ye'd strike with surprise on yer side, so spare me yer bluster, ye blowhard.~
== BEDWIN ~(Damn! Vermin-brain is more intelligent than I had thought.)~
EXIT

CHAIN IF ~InParty("Viconia")
        See("Viconia")
        !StateCheck("Viconia",STATE_SLEEPING)
        Global("rqGDViconiaPrattle","LOCALS",0)~ THEN BVICONI brokkviconia
    ~Tell me, Brokkr, were you raised on the surface? Your sight seems unaccustomed to this accursed light, as mine is.~
DO ~SetGlobal("rqGDViconiaPrattle","LOCALS",1)~
== rqbroJ ~Why in the fires of the deep should I waste words with ye?~
== BVICONI ~Your squinting has led me to believe you might not be dwarf from Adbar.~
== rqbroJ ~I'd sooner have me teeth tore out 'n laid on the anvil than jaw with a black elf about me kin. But I might humor yer questions if ye pay me for every blasted word that spars from me gob, ye venomous tongue-priestess.~
EXIT

CHAIN IF ~InParty("Keldorn")
        See("Keldorn")
        !StateCheck("Keldorn",STATE_SLEEPING)
        Global("rqGDKeldornPrattle","LOCALS",0)~ THEN BKELDOR brokkeldorn
    ~What kind of evil deity guides one with such a blighted soul as is yours, dwarf Brokkr?~
DO ~SetGlobal("rqGDKeldornPrattle","LOCALS",1)~
== rqbroJ ~If ye must know, Abbathor's on me tongue, but I've got a few Moradin teachin's gnawing in me guts.~
== BKELDOR ~Is the greed all-important, or do you follow Abbathor because you have spurned Moradin?~
== rqbroJ ~Hark, paladin. Cut the bletherin', or ye'll hear naught but me gruff growl. If ye spare me yer ramblin', I'll not be throwin' vile threats yer way. Now be a good paladin and put that tongue to some use that actually matters.~
EXIT

CHAIN IF ~InParty("Valygar")
        See("Valygar")
        !StateCheck("Valygar",STATE_SLEEPING)
        Global("rqGDValygarPrattle","LOCALS",0)~ THEN BVALYGA brokvalygar
    ~You seem to really loathe nature, Brokkr. I have noticed your posture when in the forest.~
DO ~SetGlobal("rqGDValygarPrattle","LOCALS",1)~
== rqbroJ ~Aye, I do. I hate trees, the forest fiends, wolves, mice, spiders, and all the vile nasties crawling in that greenish hell ye call a forest. But most of all, I hate them over-inquisitive rangers who have naught better to do than waste their watchin' talents on nonsense.~
== BVALYGA ~I see. I will not bother you further, Brokkr.~
EXIT

CHAIN IF ~InParty("Anomen")
        See("Anomen")
        !StateCheck("Anomen",STATE_SLEEPING)
        Global("rqGDAnomenPrattle","LOCALS",0)~ THEN BANOMEN brokanomen
    ~Dwarf, I have this small chink in my armor. Would you be so gentlemanly and use your blacksmith's talents to repair it?~
DO ~SetGlobal("rqGDAnomenPrattle","LOCALS",1)~
== rqbroJ ~Loosen that gorget o' yers, ye stubborn runt, and it won't draw blood the way it does now, ye long-beard.~
== BANOMEN ~I would have done that, but when our foes notice, they might try to strike through that gap.~
== rqbroJ ~If it ends yer damned yammerin', I'm all for it. Let 'em blow clean through yer neck. It's been ages since I heard blood gurglin' from a neck wound.~
== BANOMEN ~You little dwarf runt, I should have run you through for this insult!~
== rqbroJ ~Hardly any humor, none at all. Typical long climb up means the uptake's slower; aye, it takes longer to bite.~
EXIT

CHAIN IF ~InParty("Cernd")
        See("Cernd")
        !StateCheck("Cernd",STATE_SLEEPING)
        !AreaType(FOREST)
        !AreaCheck("AR1900")  // Druid Grove
        Global("rqGDCerndPrattle","LOCALS",0)~ THEN BCERND brokcernd
    ~You should not have squashed that spider; it is a very important component to the balance of nature that we all enjoy, Brokkr.~
DO ~SetGlobal("rqGDCerndPrattle","LOCALS",1)~
== rqbroJ ~Mark me words, ye spineless, spider-harpin' yapper: if we ever tread into another forest, I'll tear down more beasts than ye can count, and it'll be on account o' ye for raggin' on my spider-killin' nonsense.~
== BCERND ~*Sigh* Why do I get tested so much, Forest Father?~
EXIT

CHAIN IF ~InParty("Aerie")
        See("Aerie")
        !StateCheck("Aerie",STATE_SLEEPING)
        Global("rqGDAeriePrattle","LOCALS",0)~ THEN BAERIE brokaerie
    ~Did… did anyone… uh… tell you that your nose is… is quite similar to… to a gnome's nose? Uncle Quayle… does… does have… a lot of… funny jokes about gnomes and… and noses... *giggle*~
DO ~SetGlobal("rqGDAeriePrattle","LOCALS",1)~
== rqbroJ ~Listen up, ya pitiful fool: keep yer yap off me nose, or I'll teach ye a thing yer Uncle never taught ye. Ye featherless birdbrain!~
== BAERIE ~Eek!~
DO ~RunAwayFrom("rqbro",25)~
EXIT

CHAIN IF ~InParty("HaerDalis")
        See("HaerDalis")
        !StateCheck("HaerDalis",STATE_SLEEPING)
        Global("rqGDHaerDalisPrattle","LOCALS",0)~ THEN BHAERDA brokhaerdalis
    ~Tis too much I do not know you, my hound. Tell us a little about yourself. Perhaps a grand tale about fearless warrior Brokkr capturing treasure.~
DO ~SetGlobal("rqGDHaerDalisPrattle","LOCALS",1)~
== rqbroJ ~Now there be a theme I could carve into stone and and gnaw on, Bard.~
== rqbroJ ~Aye, half a human lifetime ago I was still starin' down the pitch of the Underdark, tryin' to scrape by and maybe lay me hands on a wee bundle of riches. Then I met a patrol of three full-blooded drow warriors. One rides a lizard, another clads himself in steel and a good, mean blade, and a wee, scrawny drow with a hand crossbow snug as a tick.~
== rqbroJ ~Me first two swings of the throwin' axe missed like a cave without a spark, but the last one found its mark on the scrawny runt's head before he even knew what hit. The lizard-rider had to clamber down and came at me first with his glaive, and the swordsman tried a few darts from my right side, them little bolts harmlessly clinking off me armor.~
== rqbroJ ~Then their scheme unfurled, aye: Glaive-arm tried to hook my arm, and the swordsman aimed a stab at the back of my neck from the side. The Glaive-drow's never tussled with a Dwarf before, no doubt. But I wasn't waitin' to be pulled by his glaive; I charged in and drove me dagger up under his groin armor.~
== rqbroJ ~Aye, hear me, grunt. It was only me and that swordsman, seein' if I'd charge in. He tried to hold me at bay with quick thrusts of his blade. Wantin' this over quick, I wrenched his edge free to cut my own hand deep, then hauled his blade toward him. He didn't want to be disarmed, so he pulled a dagger from his belt. Closer we came, he tried to stab at my forearm but missed. I feinted at his leg, then drove a strike at his forearm that grazed the air, just a graze. He tried to peel off me helm, but I shoved him back, the wall givin' him a hard kiss. There, we had a brief look in each other's eyes. Struggling, I found my chance and drove through the back of his neck, firing into the spine and ending the fool.~
== rqbroJ ~The scrawny crossbowman lay there, unconscious, sleepin' through a fight. I mocked in me head. I stomp over, straddlin' him, and drive a killin' blow clean through his eye socket.~
== rqbroJ ~To this day, I wonder how I, with me blasted left mitt, could barge through the wreck and snagag me loot after that sorry clash. Me hand hammered me proper for weeks after, yet once the dust settled, I felt naught but the void until I spied the blood and knew the tale was true...~
== rqbroJ ~By me beard, I'll be dunked in darkness; the scrawny runt had a pouch packed with gems. Likely filched from dwarven mineshafts not far from here.~
== BHAERDA ~That is quite a story, my war hound.~
== rqbroJ ~I ain't finished. Six drow ears had fetched me a blasted wee heap of gold, ye blasted bard.~
== BHAERDA ~Impressive. Now, where did I put my writing implements?~
== rqbroJ ~Aye, ye wanna pry loose the color of them drow innards, do ye?~
== rqbroJ ~Bah! Foolish bard, and yer writin' tools gone as if snagged by tunnel-wights. Har har har.~
EXIT

CHAIN IF ~InParty("Jaheira")
        See("Jaheira")
        !StateCheck("Jaheira",STATE_SLEEPING)
        AreaType(FOREST)
        AreaCheck("AR1900")  // Druid Grove
        Global("rqGDJaheiraPrattle","LOCALS",0)~ THEN rqbroJ brokjaheira
    ~Hear me, ye bestial wench, cease that scowl, or ye'll feel a strike ye've ne'er seen comin' from the hammer-hand o' an old dwarf.~
DO ~SetGlobal("rqGDJaheiraPrattle","LOCALS",1)~
== BJAHEIR ~Perhaps you should not be so constantly agitated, small-statured one. There is no telling what kind of just retribution the forest might deliver when you least expect it.~
== rqbroJ ~And ye mean t' have a paw in this, do ye? I'm not blind to yer dark intent, mark me words.~
EXIT

CHAIN IF ~InParty("Jan")
        See("Jan")
        !StateCheck("Jan",STATE_SLEEPING)
        Global("rqGDJansenPrattle","LOCALS",0)~ THEN BJAN brokjansen
    ~Borkie, you remind me a lot of a long-forgotten cousin of grand-grandfather Harrul. He was a nasty character, had axes with dried blood above his windows or so I thought at first. But then I investigated and found out the axes were actually stained from dried turnip soup, so I started to fear for my cousin's health. Confusing blood and turnip soup is quite a mistake, don't you think, Borkie?~
DO ~SetGlobal("rqGDJansenPrattle","LOCALS",1)~
== rqbroJ ~What's the gist of this tale buried in a goblin's word-salad, ye stubborn lot? Spit it out or face me pick.~
== BJAN ~Ah, but which one? Though, this reminds me of a story about my uncle. He was devoured by a flesh-eating Treant; after the Treant ejected him via its roots, he was never the same. He often refused to walk near trees and was deathly afraid of hummus. He never did any gardening, either. Once, I brought a pot full of nuts, and he ran for the hills as if a griffon was after him.~
== rqbroJ ~Gnome, yer head's more tangled than the intestine soup I boiled once, and that's sayin' somethin' from dwarf o' me age.~
== BJAN ~Of course, in hills there were trees and lots of them, so he ran back as fast as he could. Got a few more bumps from his sprint, which caused him to threaten everybody in his family. Sometimes we would even threaten his own shadow—that's how much he was gone. A sad story, it is.~
== rqbroJ ~Ha! Harken, ye wee Gnome. I've got a wicked notion: cram a few gears inside ye, so I'm woke at every morn by yer clatter and that blasted blather of yours.~
== BJAN ~That would be not very comfortable, Mister Dwarf. I will take my leave of you.~
EXIT

CHAIN IF ~InParty("Mazzy")
        See("Mazzy")
        !StateCheck("Mazzy",STATE_SLEEPING)
        Global("rqGDMazzyPrattle","LOCALS",0)~ THEN BMAZZY brokmazzy
    ~The way you do battle with our enemies unnerves me, Brokkr. Be more careful when you move in to melee.~
DO ~SetGlobal("rqGDMazzyPrattle","LOCALS",1)~
== rqbroJ ~A wench tryin' to teach me, dwarf, about fightin' is like shovin' a stone to lay eggs.~
== BMAZZY ~Your hatred consumes you, Brokkr, and I want no part of it unless <CHARNAME> decides to eject you from the party....~
== rqbroJ ~And what then? Mighty noble of ye to jab a blade in me just 'cause I ain't in <CHARNAME>'s company. Bah! Now scram off to the kitchens or somethin' useless like that.~
== BMAZZY ~You would do well to steer clear of me, you insufferable oaf!~
== rqbroJ ~Not unless ye do the same, ye cauldron failadin.~
EXIT

CHAIN IF ~InParty("Nalia")
        See("Nalia")
        !StateCheck("Nalia",STATE_SLEEPING)
        Global("rqGDNaliaPrattle","LOCALS",0)~ THEN rqbroJ broknalia
    ~Name-Female, ye fool of a lass, yer devotion to the pauper folk might be yer undoing.~
DO ~SetGlobal("rqGDNaliaPrattle","LOCALS",1)~
== rqbroJ ~Your concerns are heard but not appreciated, Brokkr.~
== rqbroJ ~Aye, I've laid eyes on one such as you, ye nobleman arete. He'd drink with paupers, aye, against his own kin, burin' dirt into his name and into the name o' his clan. And when the day comes, the common folk he pals around with—they've had a guest from a far village called Kejour. Kejour, seein' the nobleman scamperin' in his sleep and starvin' for gold, carves his throat, and the deed's done. Ye who consort with wolves, take heed: a wolf'll bite ye if there's gain in it for the vermin.~
== BNALIA ~So, the moral of your story is that I should be more careful when dealing with common folk—that's everything? We should be going now.~
== rqbroJ ~Ye don't ken it, ye pitiful runt: pauper folk have naught to lose, and they fight as if they've got naught to lose... for a blasted reason.~
== BNALIA ~I need not explain myself to you any further, Brokkr.~
EXIT

CHAIN IF ~InParty("Yoshimo")
        See("Yoshimo")
        !StateCheck("Yoshimo",STATE_SLEEPING)
        Global("rqGDYoshimoPrattle","LOCALS",0)~ THEN BYOSHIM brokyoshimo
    ~So, fellow master of roguish arts, could you teach this guild brother from Kara-Tur some new tricks?~
DO ~SetGlobal("rqGDYoshimoPrattle","LOCALS",1)~
== rqbroJ ~I've nae interest in yer cheerful blather and yer fancy talk o' exhaust-warmth. Move along, ye soft-tongued wretch.~
== BYOSHIM ~Ah, so your thieving art tricks are so cunning that you are afraid to tell potential competitors?~
== rqbroJ ~Nay, I've no interest in dabbling with yer honeyed breath and its foul throat-smoke.~
EXIT


// Ruth
BEGIN ~rqruth~

IF ~Global("rqGDBrokkrTreasure2","GLOBAL",2)~ THEN BEGIN RuthIntro
    SAY ~Ain't changed, loved one. *Sighs* Well now, you've got Brokkr. Nothin's changed since Korolonor. You oughta have had some sense, some morality. Shoulda.~
    IF ~~ THEN EXTERN ~rqbroJ~ FoundOldLove
END

IF ~~ THEN BEGIN Unsubstantiated
    SAY ~Whispers and wicked tales be spreadin' about little me, but I swear on my father's beard, they be nothing but falsehoods. You've let that treacherous Grylys sway your mind, turnin' truth into riddles. Be cautious, for not all that you hear is set in stone.~
    IF ~~ THEN EXTERN ~rqbroJ~ NotAngry
END

IF ~~ THEN BEGIN YerNot
    SAY ~Ye don't say? Truly?~
    IF ~~ THEN EXTERN ~rqbroJ~ Overjoyed
END

IF ~~ THEN BEGIN BringItOn
    SAY ~Have at it, ye cockless sodomite!~
        IF ~~ THEN DO ~Enemy()
            ActionOverride("rqlevg1",Enemy())
            ActionOverride("rqlevg2",Enemy())
            ActionOverride("rqlevg3",Enemy())
            ActionOverride("rqlevg4",Enemy())
            ActionOverride("rqlevg5",Enemy())
            ActionOverride("rqlevg6",Enemy())
            ActionOverride("rqlev7cl",Enemy())~
        EXIT
END

// Leaving and parting over
BEGIN ~rqbroP~
// Shadows of Amn Leaving dialog
IF ~Global("rqGDBrokkrJoined","LOCALS",1) Global("rqGDBrokkrKnows","GLOBAL",2)~ THEN BEGIN KickOutBrokkr
    SAY ~So, ye be tossin' me out, eh? What's this, eh?~
    IF ~~ THEN REPLY ~It was a mistake, get back in the party.~
        DO ~JoinParty()~
        EXIT
    IF ~!AreaCheck("AR0704")~ THEN REPLY ~That's right, I don't want you in the party.~
        DO
            ~SetGlobal("rqGDBrokkrJoined","LOCALS",0)
            EscapeAreaMove("AR0704",566,302,4)~
        EXIT
    IF ~AreaCheck("AR0704")~ THEN REPLY ~That's right, I don't want you in the party.~
        DO
            ~SetGlobal("rqGDBrokkrJoined","LOCALS",0)
            MoveToPoint([566.302])~
        EXIT
    IF ~~ THEN REPLY ~Actually, I want you to wait for me here.~ GOTO StayHere
END

IF ~~ THEN BEGIN StayHere
    SAY ~Arrgh! I might linger here, but don't expect me to stay like some blasted rotten log, aye!~
        IF ~~  THEN DO ~SetGlobal("rqGDBrokkrJoined","LOCALS",0)~ EXIT
END

IF ~Global("rqGDBrokkrKnows","GLOBAL",2) Global("rqGDBrokkrJoined","LOCALS",0)~ THEN BEGIN BG2Intro
    SAY ~Whaddya want from me, eh? Yer brains addled by rear gas? Make up yer wobblin' mind or beat some sense into yer quarrelin' rabble! I ain't got all century!~
    IF ~~ THEN REPLY ~I have need of your talents, Brokkr. Join me.~ GOTO BrokkrJoinsBG2
    IF ~~ THEN REPLY ~Mistake on my part. I actually do not want anything from you. Farewell.~ EXIT
END

IF ~~ THEN BEGIN BrokkrJoinsBG2
    SAY ~Finally, ye see me true worth. Yer skull ain't just a pile o' dung, ya know.~
    IF ~~ THEN DO
        %SetGlobal("rqGDBrokkrJoined","LOCALS",1)
        JoinParty()%
    EXIT
END

// Brokkr BG1
IF ~Global("rqGDBrokkrJoined","LOCALS",1) Global("rqGDBrokkrKnows","GLOBAL",1)~ THEN BEGIN KickOutBrokkrBG1
    SAY ~So, ye be tossin' me out, eh? What's this, eh?~
    IF ~~ THEN REPLY ~It was a mistake, get back in the party.~
        DO ~JoinParty()~
        EXIT
    IF ~!AreaCheck("AR3709")~ THEN REPLY ~That's right, I don't want you in the party.~
        DO
            ~SetGlobal("rqGDBrokkrJoined","LOCALS",0)
            EscapeAreaMove("AR3709",592,389,4)~
        EXIT
    IF ~AreaCheck("AR3709")~ THEN REPLY ~That's right, I don't want you in the party.~
        DO
            ~SetGlobal("rqGDBrokkrJoined","LOCALS",0)
            MoveToPoint([592.389])~
        EXIT
    IF ~~ THEN REPLY ~Actually, I want you to wait for me here.~ GOTO StayHereBG1
END

IF ~~ THEN BEGIN StayHereBG1
    SAY ~Arrgh! I might linger here, but don't expect me to stay like some blasted rotten log, aye!~
        IF ~~  THEN DO ~SetGlobal("rqGDBrokkrJoined","LOCALS",0)~ EXIT
END

IF ~Global("rqGDBrokkrJoined","LOCALS",0) Global("rqGDBrokkrKnows","GLOBAL",1)~ THEN BEGIN BrokkrRejoinBG1
    SAY ~Bah! I've been skulkin' 'ere like a festering rot on a goblin's bedroll. Let me back in yer bunch, 'cause standin' 'round like a fool's dull as choppin' stone with a broken pick.~
    IF ~~ THEN REPLY ~Rejoin me, Brokkr, for I have need of you.~ GOTO BrokkrJoinsBG1
    IF ~~ THEN REPLY ~We shall talk later about this.~ EXIT
END

IF ~~ THEN BEGIN BrokkrJoinsBG1
    SAY ~Finally, ye see me true worth. Yer skull ain't just a pile o' dung, ya know.~
    IF ~~ THEN DO
        %SetGlobal("rqGDBrokkrJoined","LOCALS",1)
        JoinParty()%
    EXIT
END

// Wasteland BG 1 TotSC
IF ~OR (22)
        AreaCheck("ARW000")
        AreaCheck("ARW001")
        AreaCheck("ARW002")
        AreaCheck("ARW003")
        AreaCheck("ARW004")
        AreaCheck("ARW005")
        AreaCheck("ARW006")
        AreaCheck("ARW007")
        AreaCheck("ARW008")
        AreaCheck("ARW009")
        AreaCheck("ARW010")
        AreaCheck("ARW011")
        AreaCheck("ARW012")
        AreaCheck("ARW500")
        AreaCheck("ARW501")
        AreaCheck("ARW502")
        AreaCheck("ARW503")
        AreaCheck("ARW504")
        AreaCheck("ARW505")
        AreaCheck("ARU008")
        AreaCheck("ARU009")
        AreaCheck("ARU010")
    Global("rqGDBrokkrJoined","LOCALS",1)
    Global("rqGDBrokkrKnows","GLOBAL",1)~ THEN BEGIN NotFreeToLeave
    SAY ~Bah! I didn't like ye tossin' me out in this cursed wasteland. Still, I'd rather follow ye than rot away all alone in this cursed dirt!~
    IF ~~ THEN REPLY ~Rejoin me, Brokkr.~ GOTO BrokkrJoinsBG1
    IF ~~ THEN REPLY ~Nope, you will still have to wait here for a while.~ GOTO BrokkrRefused
END

IF ~~ THEN BEGIN BrokkrRefused
    SAY ~Bah! You're a daft fool, <CHARNAME>... I'll bide me time, 'cause I got no choice but to wait and plan me escape from this cursed, rotten hole!~
    IF ~~ THEN EXIT
END

// Torl Bonechewer a stammerer do not change his text
BEGIN ~rqtorl~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN TorlIntro
    SAY ~I-I w-will not t-travel a-again in b-barrel Brokkr. G-go t-talk to P-Progunnos. I d-do n-know want a-anything f-from y-you.~
    IF ~~ THEN EXTERN ~rqbroJ~ BrokkrTorl1
END

IF ~~ THEN BEGIN TorlNoKnowProgunnos
    SAY ~I-I do not k-know where P-Progunnos is! I s-swear on h-honor of my f-father!~
    IF ~~ THEN EXTERN ~rqbroJ~ BrokkrNoHonor
END

IF ~~ THEN BEGIN TorlPlaysDumb
    SAY ~B-but I h-have not s-seen P-progunnos f-for s-several w-weeks!~
    IF ~~ THEN EXTERN ~rqbroJ~ BrokkrShakesUpTorl
END

IF ~~ THEN BEGIN TorlAdmitsPlayingDumb
    SAY ~N-no, p-please, d-don't hurt meeee... h-he went to Friendly Arm Inn to m-meet with a m-merchant who w-wanted to p-purchase the m-manual.~
    IF ~~ THEN EXTERN ~rqbroJ~ BrokkrReward
END

// Progunnos
BEGIN ~rqprog~

IF ~Global("rqGDBrokkrTreasure","GLOBAL",5)~ THEN BEGIN ProgunnosIntro
    SAY ~We have negotiated about this already Nemaricus so either come up with rest of the gold or bugger off.~
    IF ~~ THEN EXTERN ~rqnemar~ NemearicusIntro
END

// Brokkr and Progunnos
IF ~Global("rqGDBrokkrTreasure","GLOBAL",6)~ THEN BEGIN ProgunnosInquiry
    SAY ~Brokkr my old friend I had not thought you of all people would rescue me.~
    IF ~~ THEN EXTERN ~rqbroJ~ BrokkrNotSoMuch
END

IF ~~ THEN BEGIN ProgunnosCont
    SAY ~If I tell you will you let me go?~
    IF ~~ THEN EXTERN ~rqbroJ~ BrokkrLetMeGo
END

IF ~~ THEN BEGIN ProgunnosSpillsTheBeans
    SAY ~Torl took it from some hobgoblin corpse near Ulcaster ruins when we were exploring there.~
    IF ~~ THEN EXTERN ~rqbroJ~ BrokkrFinishesTheRest
END

IF ~~ THEN BEGIN ProgunnosRuns
    SAY ~Nooo!! I must run!!~
    IF ~~ THEN DO
        ~ApplySpellRES("runrun",Myself)
        SetGlobal("rqGDBrokkrTreasure","GLOBAL",7)
        EscapeAreaObject("Stairs6801")~
    EXIT
END

// Nemaricus vs Progunnos
BEGIN ~rqnemar~

IF ~~ THEN BEGIN NemearicusIntro
    SAY ~You have been stalling long enough, give me the book or...~
    IF ~~ THEN EXTERN ~rqbroJ~ BrokkrKillNemaricus
END

IF ~~ THEN BEGIN NemaricusInterrupted
    SAY ~Grr!!! Interrupted again!~
    IF ~~ THEN DO ~SetGlobal("rqGDBrokkrTreasure","GLOBAL",6)~ EXIT
END

// Azrammar
BEGIN ~rqazram~

IF ~Global("rqGDBrokkrTreasure","GLOBAL",8)~ THEN BEGIN Azrammar01
    SAY ~Brokkr! It's been ages, hasn't it? When this half-wit Progunnos claimed he had a training manual from Korolonor, I nearly lost my temper. No way I'd let that scrawny rat peddle our sacred relic to some pitiful human merchant!~
    IF ~~ THEN EXTERN ~rqbroJ~ BrokkrRelic
END

// 214
IF ~~ THEN BEGIN Azrammar02
    SAY ~Bah! You old coot! Here's yer cursed magic trinket and three thousand gold coins. I'll be takin' that manual.~
    IF ~~ THEN DO
        %EraseJournalEntry(~Brokkr's Treasure Chapter II

        Dwarf Brokkr asked me to acquire dwarven militia training manual. Whatever that is, it must be quite valuable to dwarves. Only lead Brokkr has is that a man named Torl is in the Blushing Mermaid.~)

        EraseJournalEntry(~Brokkr's Treasure Chapter II

        I have tracked down Torl, who was supposed to know where Progunnos is, and it looks like he went to the Friendly Arm Inn to sell the manual.~)

        EraseJournalEntry(~Brokkr's Treasure Chapter II

        Progunnos is dead and the dwarven manual is in my possession. When I have finished reading it, I should go to Baldur's Gate and return the manual to the dwarf Azrammar in Sorcerous Sundries for a big reward.~)
        SetGlobal("rqGDBrokkrTreasure","GLOBAL",10)
        TakePartyItem("rqbook2")
        GivePartyGold(3000)
        GiveItem("rqbelt03",Player1)
        AddexperienceParty(5000)
        EscapeArea()
        %
        SOLVED_JOURNAL ~Brokkr's Treasure Chapter II

        Brokkkr has finished his quest to recover his sacred relics. One thing is for certain: this dwarf has a nose for very useful relics.~
    EXIT
END

// Courier working for drow
BEGIN ~rqcourbr~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN CourierForBrokkr
    SAY ~Lord Brokkr.. Lord Brokkr I carry message for you. Ehm...how did it go... Your friends friends from below are waiting for you in Forest of Tethyr.~
    IF ~~ THEN EXTERN ~rqbroJ~ BrokkrSecret
END

IF ~~ THEN BEGIN DispleasedDrow
    SAY ~I am just courier do not hurt me please!~
    IF ~~ THEN DO
        %SetGlobal("rqGDBG2SendaiDrowAmbush","GLOBAL",1)
        EscapeArea()%
        SOLVED_JOURNAL ~Brokkr's family: Parlay with Drow rejected

        Looks like my companion Brokkkr was brought up by the drow, and he admitted that he worked for them, though he claims he no longer serves them. The drow contacted him again, but I refused to meet with Brokkkr's former owners, as I see no value in it, though I am certain such a refusal will have consequences.~
    EXIT
END

IF ~~ THEN BEGIN DrowWillBeHappy
    SAY ~I shall relay your positive reply, Farewell.~
    IF ~~ THEN DO
        %SetGlobal("rqGDBG2BrokSpying","GLOBAL",1)
        EscapeArea()%
        UNSOLVED_JOURNAL ~Brokkr's family: Accepted the invitation to to parlay with Drow

        Looks like my companion Brokkr have been brought up by the drow and he admitted that he worked for them though he claimed he does no longer serves them. The drow contacted him again I think it would better to speak to drow to ascertain their goals with Brokkr. We are supposed to meet in Forest of Tethyr.~
    EXIT
END

// Malzoth
BEGIN ~rqdwiz01~

IF ~Global("rqGDBG2BrokSpying","GLOBAL",1)~ THEN BEGIN MalzothIntro
    SAY ~Ithil'ithil ar'kathil ar'khaz'ithil ar'khaeril nindol. M'rae s'banar?~
    IF ~~ THEN EXTERN ~rqbroJ~ SpareMeOfThisCrap
END

IF ~~ THEN BEGIN HereIThought
    SAY ~It's good to see that weakling surface dwellers have not softened you, Brokkr.~
    IF ~~ THEN EXTERN ~rqbroJ~ JustSpitItOut
END

IF ~~ THEN BEGIN GistOfIt
    SAY ~We want to use your skills once more. Given the hostility of your group toward this mage Irenicus, I wager that you will be trying to thwart his plans in the city of Suldanesselar, yes?~
    IF ~Global("SolaufeinJob","GLOBAL",0)~ THEN REPLY ~What do you know of Irenicus, drow?~ GOTO DuergarSpies
    IF ~Global("SolaufeinJob","GLOBAL",0)~ THEN REPLY ~This is where I interject: what do you know of fiend Irenicus?~ GOTO DuergarSpies
    IF ~GlobalGT("SolaufeinJob","GLOBAL",1)~ THEN REPLY ~What do you know of Irenicus, drow?~ GOTO KnowIrenicus
    IF ~GlobalGT("SolaufeinJob","GLOBAL",1)~ THEN REPLY ~This is where I interject: what do you know of fiend Irenicus?~ GOTO KnowIrenicus
END

IF ~~ THEN BEGIN DuergarSpies
    SAY ~Not much. I had knowns that many warriors are busy outside of the city but had not known why. To my surprise I have found out that house Despana had made deals with surfacer mage named Irenicus. So I have pieced the whole thing together. Irenicus has used our forces to draw out elven army to make his assault on our despicable surface brethren of Suldanesselar. I do not know much beyond that.~
    IF ~Dead("UDsvir03") Global("SvirHostile","GLOBAL",1) Dead("UDSVIR05") Dead("UDSVIR01") Dead("udsilver")~ THEN GOTO TradingInfoDeadDragon
    IF ~Dead("UDsvir03") Global("SvirHostile","GLOBAL",1) Dead("UDSVIR05") Dead("UDSVIR01") !Dead("udsilver")~ THEN GOTO TradingInfo
    IF ~Dead("UDsvir03") Global("SvirHostile","GLOBAL",1) !Dead("udsilver")~ THEN GOTO GoldanderInfo
    IF ~Dead("UDsvir03") Global("SvirHostile","GLOBAL",1) Dead("udsilver")~ THEN GOTO TradingInfoDeadDragon
    IF ~!Dead("udsilver") !Dead("UDsvir03")~ THEN GOTO KnowIrenicus
END

IF ~~ THEN BEGIN GoldanderInfo
    SAY ~I know that leader of Svirfneblin Goldander is have been killed was that your doing?~
    IF ~~ THEN REPLY ~Both tried to manipulate in doing dirty work for them so I had to dispose of them.~ GOTO AnAnswer
    IF ~~ THEN REPLY ~How much is such information is worth to you?~ GOTO NoAnswer
    IF ~~ THEN REPLY ~I don't think I want to speak to you about such events.~ GOTO NoAnswer
END

IF ~~ THEN BEGIN TradingInfoDeadDragon
    SAY ~Since you and I are trading information I am interested about whereabouts of Silver one and the deep gnomes. I saw corpse of Goldander and others. May I know who has done this culling?~
    IF ~~ THEN REPLY ~Both tried to manipulate in doing dirty work for them so I had to dispose of them.~ GOTO AnAnswer
    IF ~~ THEN REPLY ~How much is such information is worth to you?~ GOTO NoAnswer
    IF ~~ THEN REPLY ~I don't think I want to speak to you about such events.~ GOTO NoAnswer
END

IF ~~ THEN BEGIN TradingInfo
    SAY ~Since you and I are trading information I would like to know what has happened to svirfneblin settlement near Ched Nasad.~
    IF ~~ THEN REPLY ~No I do not want you to know that.~ GOTO NoAnswer
    IF ~~ THEN REPLY ~How much will be compensated for such information?~ GOTO NoAnswer
    IF ~~ THEN REPLY ~I had choice whether I would face something unnatural and dangerous or several svirfneblin. Easy choice to make I would say~ GOTO AnAnswer
END

IF ~~ THEN BEGIN AnAnswer
    SAY ~Congratulations on your conquests. I will have to reevaluate certain actions... Let us continue to more useful topics.~
    IF ~~ THEN GOTO EvilOffer
END

IF ~~ THEN BEGIN NoAnswer
    SAY ~I had though you surfacers would be more forthcoming with your conquests... but let us continue.~
    IF ~~ THEN GOTO EvilOffer
END

IF ~~ THEN BEGIN KnowIrenicus
    SAY ~Very little, actually. I do not even know your name. I suppose it is not Veldrin? We found out that Ched Nasad was infiltrated by surfacers, and we shadowed your steps from the Underdark.~
    IF ~!Alignment(Player1,MASK_EVIL)~ THEN REPLY ~Why would you do that?~ GOTO BrokkrsRole
    IF ~Alignment(Player1,MASK_EVIL)~ THEN REPLY ~Why would you do that?~ GOTO BrokkrsRoleEvil
    IF ~!Alignment(Player1,MASK_EVIL)~ THEN REPLY ~How does Brokkr fit into all this?~ GOTO BrokkrsRole
    IF ~Alignment(Player1,MASK_EVIL)~ THEN REPLY ~How does Brokkr fit into all this?~ GOTO BrokkrsRoleEvil
END

IF ~~ THEN BEGIN BrokkrsRoleEvil
    SAY ~Lose that thought about Brokkr, for now. I will explain later, Right now I have a gnawing feeling coming from the back of my head that you and I are not so different, and for that reason, I have a better, more involved offer for you.~
    IF ~~ THEN REPLY ~What's on your mind, Malzoth?~ GOTO EvilOffer
    IF ~~ THEN REPLY ~This better be good.~ GOTO EvilOffer
END

IF ~~ THEN BEGIN EvilOffer
    SAY ~It just so happens that I have an old foe inside the city who I wish to hasten her arrival to Arvandor. Her name is Demin. If you are so inclined, I could enhance your reward considerably for the added risk that entails assassinating a priestess inside Suldanesselar. What would you say to my offer?~
    IF ~~ THEN REPLY ~I'll take your offer, drow, but your reward better be worth it!~ GOTO AcceptedEvil
    IF ~~ THEN REPLY ~I accept, for I think that these elves are somewhat involved with my nemesis Irenicus.~ GOTO AcceptedEvil
    IF ~~ THEN REPLY ~You must be insane drow. I refuse.~ GOTO RejectionMalzoth
    IF ~~ THEN REPLY ~This might be too risky, so I must decline, drow.~ GOTO RejectionMalzoth
END

IF ~~ THEN BEGIN AcceptedEvil
    SAY ~Darkness has surely blessed you. Now to the next part of my proposal.~
    IF ~~ THEN GOTO BrokkrsRoleEvil2
END

IF ~~ THEN BEGIN BrokkrsRoleEvil2
    SAY ~As I have told you, one of my older spies has recognized Brokkr, and just so happens, I have need for someone skilled in the art of subterfuge. I would like you to infiltrate Suldanesselar and map its defenses; every bit of information helps. All I ask from Brokkr is to write a journal, and of course, this journal has to return to me.~
    IF ~~ THEN REPLY ~Sounds easy enough. What do you need this for?~ GOTO SellItOfCourseE
END

IF ~~ THEN BEGIN SellItOfCourseE
    SAY ~To sell it, of course. Such information has value beyond gold...~
    IF ~~ THEN REPLY ~Fine, I know everything I need, but if you don't hold up to your side of the bargain, my vengeance shall be terrible, drow.~ GOTO NameOfBhaalspawn
    IF ~!Race(Player1,ELF)~ THEN REPLY ~On second thought, I will not betray elves to you. I retract my previous acknowledgment.~ GOTO RejectionMalzoth
    IF ~Race(Player1,ELF)~ THEN REPLY ~On second thought, I'd rather not betray my kin in their time of greatest need.~ GOTO RejectionMalzothKin
END

IF ~~ THEN BEGIN NameOfBhaalspawn
    SAY ~Last request before I depart: by what name should I call you?~
    IF ~!Race(Player1,ELF)~ THEN REPLY ~You can call me <CHARNAME>.~ GOTO KnowCharacterNameEvil
    IF ~Race(Player1,ELF)~ THEN REPLY ~You can call me <CHARNAME>.~ GOTO KnowCharacterNameEvilElf
    IF ~~ THEN REPLY ~You do not need to know my name, drow.~ GOTO UnderstandableEvil
END

IF ~~ THEN BEGIN KnowCharacterNameEvil
    SAY ~Smart surfacers are in demand by our group. Things would be so much easier if more surfacers thought like yourself.~
        IF ~~ THEN DO
            ~SetGlobal("rqGDBG2BrokSpying","GLOBAL",2)
            EscapeArea()
            ActionOverride("rqdwar01",EscapeArea())
            ActionOverride("rqdwar02",EscapeArea())
            ActionOverride("rqdwar03",EscapeArea())
            ActionOverride("rqdass01",EscapeArea())
            ActionOverride("rqdass02",EscapeArea())
            ActionOverride("rqdken01",EscapeArea())
            ActionOverride("rqdpri01",EscapeArea())~ EXTERN ~rqbroJ~ DeminDeadSuldanesselar
END

IF ~~ THEN BEGIN KnowCharacterNameEvilElf
    SAY ~I am left wondering how many of our surfacer brethren have such a beautiful mind like yours, Aluve.~
        IF ~~ THEN DO
            ~SetGlobal("rqGDBG2BrokSpying","GLOBAL",2)
            EscapeArea()
            ActionOverride("rqdwar01",EscapeArea())
            ActionOverride("rqdwar02",EscapeArea())
            ActionOverride("rqdwar03",EscapeArea())
            ActionOverride("rqdass01",EscapeArea())
            ActionOverride("rqdass02",EscapeArea())
            ActionOverride("rqdken01",EscapeArea())
            ActionOverride("rqdpri01",EscapeArea())~ EXTERN ~rqbroJ~ DeminDeadSuldanesselar
END

IF ~~ THEN BEGIN UnderstandableEvil
    SAY ~That is understandable, surfacer. I shall take my leave of you; I have wasted too much time here, Aluve.~
        IF ~~ THEN DO
            ~SetGlobal("rqGDBG2BrokSpying","GLOBAL",2)
            EscapeArea()
            ActionOverride("rqdwar01",EscapeArea())
            ActionOverride("rqdwar02",EscapeArea())
            ActionOverride("rqdwar03",EscapeArea())
            ActionOverride("rqdass01",EscapeArea())
            ActionOverride("rqdass02",EscapeArea())
            ActionOverride("rqdken01",EscapeArea())
            ActionOverride("rqdpri01",EscapeArea())~ EXTERN ~rqbroJ~ DeminDeadSuldanesselar
END

IF ~~ THEN BEGIN BrokkrsRole
    SAY ~Since I know that Brokkr is member of your group, and just so happens, I have need for someone skilled in the art of subterfuge. I would like you to infiltrate Suldanesselar and map its defenses; every bit of information helps. All I ask from Brokkr is to write a journal, and of course, this journal has to return to me.~
    IF ~~ THEN REPLY ~Why would I do such a thing for you?~ GOTO RewardOkay
    IF ~~ THEN REPLY ~What do you intend to do with such information?~ GOTO SellItOfCourse
    IF ~~ THEN REPLY ~I don't think so, drow. Now leave before I show you the extent of my power.~ GOTO RejectionMalzoth
    IF ~!Race(Player1,ELF)~ THEN REPLY ~I will not betray elves for your own personal gains, drow.~ GOTO RejectionMalzoth
    IF ~Race(Player1,ELF)~ THEN REPLY ~I will not betray my own kin for your own personal gains, drow.~ GOTO RejectionMalzothKin
END

IF ~~ THEN BEGIN RejectionMalzoth
    SAY ~Such pitiful display of loyalty to the sun-blighted surface elves is foolishness. And I have little patience for such things.~
    IF ~~ THEN DO
        ~EscapeArea()
        ActionOverride("rqdwar01",EscapeArea())
        ActionOverride("rqdwar02",EscapeArea())
        ActionOverride("rqdwar03",EscapeArea())
        ActionOverride("rqdass01",EscapeArea())
        ActionOverride("rqdass02",EscapeArea())
        ActionOverride("rqdken01",EscapeArea())
        ActionOverride("rqdpri01",EscapeArea())~ EXTERN ~rqbroJ~ RejectedMalzoth
END

IF ~~ THEN BEGIN RejectionMalzothKin
    SAY ~Admirable, but I have no need for such qualities. We shall be leaving then.~
    IF ~~ THEN DO
        ~EscapeArea()
        ActionOverride("rqdwar01",EscapeArea())
        ActionOverride("rqdwar02",EscapeArea())
        ActionOverride("rqdwar03",EscapeArea())
        ActionOverride("rqdass01",EscapeArea())
        ActionOverride("rqdass02",EscapeArea())
        ActionOverride("rqdken01",EscapeArea())
        ActionOverride("rqdpri01",EscapeArea())~ EXTERN ~rqbroJ~ RejectedMalzoth
END

IF ~~ THEN BEGIN RewardOkay
    SAY ~We have captured a powerful magic item. As an adventurer, surely you have use for such things, no?~
    IF ~~ THEN REPLY ~Drow are known to give cursed items and then attack the target if he dons such an item.~ GOTO DoubleCross
    IF ~~ THEN REPLY ~I am interested. What will that infiltration entail?~ GOTO Explain
    IF ~~ THEN REPLY ~What do I have to do?~ GOTO Explain
    IF ~~ THEN REPLY ~What do you intend to do with such information?~ GOTO SellItOfCourse
END

IF ~~ THEN BEGIN DoubleCross
    SAY ~Haha! Yes, we are, but I am not one of the double-crossing Lolthite arachno-brains. I have made my reputation by keeping my word, and to be truthful, the magic is unusable by anyone of elven heritage, which unfortunately applies to me. So, surfacer, do we have a deal?~
    IF ~~ THEN REPLY ~I'll take your offer.~ GOTO SmartSurfacer
    IF ~~ THEN REPLY ~No, I will not work for you, drow.~ GOTO RejectionMalzothBored
END

IF ~~ THEN BEGIN Explain
    SAY ~You only have to keep Brokkr alive. He will do the mapping, note defenses, and such. He knows what to do; he has done this many times for me.~
    IF ~~ THEN REPLY ~If there is profit to be made, I am in.~ GOTO SmartSurfacer
    IF ~~ THEN REPLY ~I reject your proposal, drow.~ GOTO RejectionMalzothBored
END

IF ~~ THEN BEGIN SellItOfCourse
    SAY ~To make a profit, of course, adventurer.~
    IF ~~ THEN REPLY ~I say yes; I did not like Elhan's deception and withholding of information.~ GOTO SmartSurfacer
    IF ~~ THEN REPLY ~No, I do not want to betray the elves despite their attitude towards me.~ GOTO RejectionMalzothBored
END

IF ~~ THEN BEGIN SmartSurfacer
    SAY ~Excellent! You are indeed cunning <PRO_MANWOMAN>, as I expected. When you return from Suldanesselar, we shall meet again. Oh, by what name should I call you?~
    IF ~~ THEN REPLY ~You can call me <CHARNAME>.~ DO ~SetGlobal("rqGDBG2MalzothKnowName","GLOBAL",1)~ GOTO DoneDeal
    IF ~~ THEN REPLY ~You do not need to know my name, drow.~ GOTO DoneDeal
END

IF ~~ THEN BEGIN DoneDeal
    SAY ~A smart surfacer. It was a pleasure, but I must make haste now. Farewell.~
    IF ~~ THEN DO
        ~SetGlobal("rqGDBG2BrokSpying","GLOBAL",2)
        EscapeArea()
        ActionOverride("rqdwar01",EscapeArea())
        ActionOverride("rqdwar02",EscapeArea())
        ActionOverride("rqdwar03",EscapeArea())
        ActionOverride("rqdass01",EscapeArea())
        ActionOverride("rqdass02",EscapeArea())
        ActionOverride("rqdken01",EscapeArea())
        ActionOverride("rqdpri01",EscapeArea())~ EXTERN ~rqbroJ~ KnowWhatYerDoing
END

IF ~~ THEN BEGIN RejectionMalzothBored
    SAY ~No deal? Foolish surfacers, unable to free themselves from the shackles of their sun-withered morality.~
    IF ~~ THEN DO
        ~EscapeArea()
        ActionOverride("rqdwar01",EscapeArea())
        ActionOverride("rqdwar02",EscapeArea())
        ActionOverride("rqdwar03",EscapeArea())
        ActionOverride("rqdass01",EscapeArea())
        ActionOverride("rqdass02",EscapeArea())
        ActionOverride("rqdken01",EscapeArea())
        ActionOverride("rqdpri01",EscapeArea())~ EXTERN ~rqbroJ~ RejectedMalzoth
END
