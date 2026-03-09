BEGIN ~rqkrivy~

IF ~Global("rqGDGrandDukeQuest","GLOBAL",0)~ THEN BEGIN WhoAmI
    SAY ~Greetings again, <CHARNAME>. Or should I say, Hero of Baldur's Gate? After you rescued them, you are supposed to be merely a simple courier and deliver a letter to Amn. Ridiculous, I would think!~
    IF ~~ THEN REPLY ~Get to the point. What do you want from me exactly?~ GOTO WantFromCharName
    IF ~~ THEN REPLY ~Why are you talking about me delivering letters to Amn?~ GOTO CourierDuty
    IF ~~ THEN REPLY ~Why do you speak like this? Start from the beginning.~ GOTO WantFromCharName
END

IF ~~ THEN BEGIN CourierDuty
    SAY ~Because that's how they will be trying to get rid of you.~
    IF ~~ THEN REPLY ~So what do you want from me then?~ GOTO WantFromCharName
    IF ~~ THEN REPLY ~How come you know that?~ GOTO HowDoYouKnowThat
END

IF ~~ THEN BEGIN HowDoYouKnowThat
    SAY ~I just came from the Ducal Palace, but a better reason for knowing such facts is that I do have the ear of powerful people in this city. But the question is: will you listen to me for a while?~
    IF ~~ THEN REPLY ~So what do you want?~ GOTO WantFromCharName
END

IF ~~ THEN BEGIN WantFromCharName
    SAY ~What if I told you that there are interested parties who wish to help you to positions of power and not to be used like a pathetic courier? Simply put, Entar Silvershield is dead and we think that perhaps you could grow into his position.~
    IF ~~ THEN REPLY ~What you say is interesting, but what's the catch?~ GOTO ProblemsQuestion
    IF ~~ THEN REPLY ~Who are these interested parties you claim to represent?~ GOTO WhoAreInterestedParties
    IF ~~ THEN REPLY ~I am very much interested.~ GOTO VeryInteresteGrandDuke
    IF ~!Global("rqGDGrandDukeQuest","GLOBAL",10)~ THEN REPLY ~You are mistaken; I do not desire power at all.~ GOTO NOTInterested
    IF ~Global("rqGDGrandDukeQuest","GLOBAL",10)~ THEN REPLY ~You are mistaken; I do not desire power at all.~ GOTO SecondRejection
END

IF ~~ THEN BEGIN VeryInteresteGrandDuke
    SAY ~You must understand that you will need the votes of noble families to be elected as duke.~
    IF ~~ THEN REPLY ~What is your end goal?~ GOTO QuestionMotive
    IF ~~ THEN REPLY ~Who is behind this effort?~ GOTO WhoAreInterestedParties
END

IF ~~ THEN BEGIN WhoAreInterestedParties
    SAY ~Noble families with voting rights, of course, and a few powerful men with influence to which noble families listen.~
    IF ~~ THEN REPLY ~Is that all?~ GOTO ProblemsQuestion
END

IF ~~ THEN BEGIN ProblemsQuestion
    SAY ~Well, you will be required to do favors for voters, but you must have expected this, right?~
    IF ~~ THEN REPLY ~What do you aim to gain?~ GOTO QuestionMotive
END

IF ~~ THEN BEGIN QuestionMotive
    SAY ~I think that being a person who helps others is a good thing, no?~
    IF ~Alignment(Player1,MASK_EVIL)~ THEN GOTO ExplainForEvilCharname
    IF ~Alignment(Player1,MASK_GOOD)~ THEN GOTO ExplainForGoodCharname
    IF ~Alignment(Player1,MASK_GENEUTRAL)~ THEN GOTO ExplainForNeutralCharname
END

IF ~~ THEN BEGIN ExplainForEvilCharname
    SAY ~A good thing for both of us, that is. Surely, you would appreciate powerful friends in the right places as I am.~
    IF ~~ THEN REPLY ~Duke <CHARNAME> - I like the sound of that.~ GOTO PositiveReply
    IF ~!Global("rqGDGrandDukeQuest","GLOBAL",10)~ THEN REPLY ~I don't trust you at all. Farewell.~ GOTO NOTInterested
    IF ~Global("rqGDGrandDukeQuest","GLOBAL",10)~ THEN REPLY ~I don't trust you at all. Farewell.~ GOTO SecondRejection
END

IF ~~ THEN BEGIN ExplainForGoodCharname
    SAY ~The city needs a <MANWOMAN> of your morality. Why not become Duke and influence the city in the right way?~
    IF ~~ THEN REPLY ~Hmph... I accept. This city needs a savior.~ GOTO PositiveReply
    IF ~!Global("rqGDGrandDukeQuest","GLOBAL",10)~ THEN REPLY ~No, not interested. Farewell.~ GOTO NOTInterested
    IF ~Global("rqGDGrandDukeQuest","GLOBAL",10)~ THEN REPLY ~No, not interested. Farewell.~ GOTO SecondRejection
END

IF ~~ THEN BEGIN ExplainForNeutralCharname
    SAY ~Though you might or might not care about power, surely you do care about the city. Think how much it could be improved under your wise rule...~
    IF ~~ THEN REPLY ~I accept, and I shall make sure this city is run well.~ GOTO PositiveReply
    IF ~!Global("rqGDGrandDukeQuest","GLOBAL",10)~ THEN REPLY ~No, I prefer not to be involved with your shady schemes. Farewell.~ GOTO NOTInterested
    IF ~Global("rqGDGrandDukeQuest","GLOBAL",10)~ THEN REPLY ~No, I prefer not to be involved with your shady schemes. Farewell.~ GOTO SecondRejection
END

IF ~~ THEN BEGIN PositiveReply
    SAY ~Excellent. Here, take this parchment; it contains a list of my contacts and their locations where you can meet them. I will contact you as you make progress on our matter.~
    IF ~~ THEN DO
            %SetGlobal("rqGDGrandDukeQuest","GLOBAL",1)
            GiveItem("rqletkr1",Player1)
            EscapeArea()%
            UNSOLVED_JOURNAL ~Duke of Baldur's Gate:

            Man who calls himself Krivy has approached me with a proposal. He claims that noble families could be persuaded to vote for my election as Duke of Baldur's Gate. I do foresee several problems, though. Nobles will certainly want something in return for their support, and I am not sure if I can trust this Krivy.

            Letter from Krivy states that I should speak to my potential supporters located in following taverns:

            Talvin of Gelfiven Drakon Tavern, Central Baldur's Gate
            Gemerkan Keexie Tavern, East Baldur's Gate
            Melwis Blade and Stars, Southeast Baldur's Gate
            Gvalas Three Old Kegs, North Baldur's Gate
            Temur of Droliegen Blushing Mermaid, Northeast Baldur's Gate
            Turpin of Milgerin, Ivylla Donnerstrom, Remelsen
            All three are in Splurging Sturgeon, Northeast Baldur's Gate
            Nestor Low Lantern, South Baldur's Gate
            Ioviis Elfsong Tavern 2nd floor, East Baldur's Gate.~
        EXIT
END

IF ~~ THEN BEGIN NOTInterested
    SAY ~Rejection then... I will conduct some transactions in the Elfsong Tavern, so if you change your mind, come and see me there.~
    IF ~~ THEN DO
            %SetGlobal("rqGDGrandDukeQuest","GLOBAL",10)
            EscapeArea()%
        EXIT
END

IF ~~ THEN BEGIN SecondRejection
    SAY ~So be it, <CHARNAME>. Well, it is time for us to leave.~
    IF ~~ THEN DO
            ~EscapeArea()
            ActionOverride("rqiachin",EscapeArea())
            ActionOverride("rqlerov",EscapeArea())~
        EXIT
END

// Rejected Krivy at first meeting
IF ~Global("rqGDGrandDukeQuest","GLOBAL",10)~ THEN BEGIN AgainBeggining
    SAY ~You have reconsidered? In case you have forgotten, we met at the Ducal Palace and I offered you my support for your election as Duke.~
    IF ~~ THEN REPLY ~Yes, I have. Tell me what this is about.~ GOTO AgreedToKrivyQuest
    IF ~~ THEN REPLY ~No, this was a mistake on my part.~ GOTO Mistake
END

IF ~~ THEN BEGIN AgreedToKrivyQuest
    SAY ~Somehow I knew you would reconsider. Should I retell what I have offered to you?~
    IF ~~ THEN REPLY ~Yes, refresh my memory.~ GOTO WantFromCharName
    IF ~~ THEN REPLY ~I recall what you were telling me. Tell me the shorter version of what you wish of me.~ GOTO ShortVersion
END

IF ~~ THEN BEGIN ShortVersion
    SAY ~The short version is: Duke Entar is dead, and the city desperately needs new leaders. We think it could be you.~
    IF ~~ THEN REPLY ~So, these landowners probably want something for their votes, right?~ GOTO VoterTalk
END

IF ~~ THEN BEGIN VoterTalk
    SAY ~I cannot lie to you; they probably will. Would that be a problem for you?~
    IF ~~ THEN REPLY ~Fine, I shall talk to your *landowners*.~ GOTO PositiveReply
    IF ~~ THEN REPLY ~Nope, still not interested in your schemes.~ GOTO Mistake
END

IF ~~ THEN BEGIN Mistake
    SAY ~Understood. We shall leave now.~
    IF ~~ THEN DO
            ~EscapeArea()
            ActionOverride("rqlerov",EscapeArea())
            ActionOverride("rqiachin",EscapeArea())~
        EXIT
END

// Neutral path: Krivy appearing after Lerov Ambush
IF ~Global("rqGDNeutralPathStep3","GLOBAL",1)~ THEN BEGIN Entrance
    SAY ~What a fine <DAYNIGHTALL>, isn't it?~
    IF ~~ THEN REPLY ~Where have you been?~ GOTO Elaborate
    IF ~~ THEN REPLY ~Assassins are after me, and you talk about the weather?~ GOTO Elaborate
    IF ~~ THEN REPLY ~Did you convince more noblemen to join my cause?~ GOTO Elaborate
    IF ~~ THEN REPLY ~Was Lerov acting on your orders?~ GOTO Lerov
END

IF ~~ THEN BEGIN Lerov
    SAY ~No, he was not; he was a traitor working for our enemies. But let's not speak of filth lest we sink to their level.~
    IF ~~ THEN GOTO Further
END

IF ~~ THEN BEGIN Elaborate
    SAY ~I wish I could elaborate on what I have been through and who I have met to further our cause, but we do not have time for that. Let's speak about important things.~
    IF ~~ THEN REPLY ~What exactly?~ GOTO Further
END

IF ~~ THEN BEGIN Further
    SAY ~Our enemies have acted, but now it's our turn. We need to cut off their senses, and I know just how to do it. There is a Flaming Fist in the Undercellar who acts as Belt's right hand in all actions against us.~
    IF ~~ THEN REPLY ~What is his name?~ GOTO Hawk
    IF ~~ THEN REPLY ~Wait one moment, these assassins were working for Belt?~ GOTO BeltWork
END

IF ~~ THEN BEGIN BeltWork
    SAY ~Yes, indirectly, but the assassins were actually hired by Alatos. Thus I have a mission for you: to cut through the alliance between Belt and Alatos by converting their goon...~
    IF ~~ THEN GOTO Hawk
END

IF ~~ THEN BEGIN Hawk
    SAY ~Lezgyn Hawk. We need to turn him to our side. I repeat, turn him to our side, not kill him.~
    IF ~~ THEN REPLY ~Is that all?~ GOTO Explain
    IF ~~ THEN REPLY ~Why don't I just kill Belt and be done with it?~ GOTO Belt
    IF ~~ THEN REPLY ~Have I lost support from the nobles?~ GOTO Support
    IF ~~ THEN REPLY ~What is this Lezgyn supposed to do for us?~ GOTO Specifics
END

IF ~~ THEN BEGIN Explain
    SAY ~Turn him to our side, and then we can move to the second and last step.~
    IF ~~ THEN REPLY ~Tell me the details of what he is supposed to do for us.~ GOTO Specifics
    IF ~~ THEN REPLY ~I'd rather just kill Belt.~ GOTO Belt
END

IF ~~ THEN BEGIN Belt
    SAY ~No, he's gone into hiding. He is not in the palace.~
    IF ~~ THEN REPLY ~What about the nobles?~ GOTO Support
    IF ~~ THEN REPLY ~Enough of this; I want to go after Lezgyn.~ GOTO Specifics
END

IF ~~ THEN BEGIN Support
    SAY ~No, not yet; they are waiting to see who is victorious in our struggle.~
    IF ~~ THEN REPLY ~Fine, what exactly am I supposed to do with Lezgyn?~ GOTO Specifics
    IF ~~ THEN REPLY ~I'd rather go after Belt's jugular.~ GOTO Belt
END

IF ~~ THEN BEGIN Specifics
    SAY ~Go and find Lezgyn in the Undercellar and convince him to join our cause. We need him to warn us every time Belt acts against us. Oh, I will have my trusted associate waiting for you in the Blade and Stars.~
    IF ~~ THEN DO
        %SetGlobal("rqGDNeutralPathStep3","GLOBAL",2)
        SetGlobal("rqGDNeutralPathStep4","GLOBAL",1)
        EscapeArea()%
        UNSOLVED_JOURNAL ~Duke of Baldur's Gate:

        After Lerov's betrayal, Krivy instructed me to find Lezgyn Hawk and turn him to our side. When I am done, I will want to report my success to one of Krivy's men in the Blade and Stars.~
    EXIT
END

// Attack on Thieves East Baldur's Gate
IF ~Global("rqGDNeutralPathStep5","GLOBAL",3)~ THEN BEGIN Presentation
    SAY ~<CHARNAME>, we have a serious problem at our hands. I had hoped that this would stay just a low-level conflict between us and the Thieves Guild, but it seems that Belt wants to be involved more directly.~
    IF ~~ THEN REPLY ~Why does Belt want me dead because of my attempt to become Duke?~ GOTO Beltway
    IF ~~ THEN REPLY ~How is Alatos involved?~ GOTO Guild
    IF ~~ THEN REPLY ~I have convinced Lezgyn to act as our spy.~ GOTO Spy
END

IF ~~ THEN BEGIN Spy
    SAY ~I apologize for sending you on that task, as it has damaged our efforts. In either case, Lezgyn does not matter now.~
    IF ~~ THEN REPLY ~Why does Belt want me dead?~ GOTO Beltway
END

IF ~~ THEN BEGIN Beltway
    SAY ~No, Belt does not want you dead just far away until the situation clears out, and he does not want me to interfere.~
    IF ~~ THEN REPLY ~What about the thieves?~ GOTO Guild
END

IF ~~ THEN BEGIN Guild
    SAY ~Alatos wants us dead or gone, though we can still strike back at them.~
    IF ~~ THEN REPLY ~You have dragged me into this; why should I do anything for you?!~ GOTO Dragged
    IF ~~ THEN REPLY ~It sure does not look like they just want us out of the city.~ GOTO Forced
    IF ~~ THEN REPLY ~So basically, you are telling me that Belt and the Thieves conspire to force me out of the city?~ GOTO Confirmation
END

IF ~~ THEN BEGIN Confirmation
    SAY ~Yes. I know that Belt, via Lezgyn, contacted Alatos, and you know the rest.~
    IF ~~ THEN REPLY ~Explain further, Krivy.~ GOTO Forced
END

IF ~~ THEN BEGIN Forced
    SAY ~Their goal is just to create enough commotion to scare off your voters; it is that simple. Now you can strike back or leave.~
    IF ~~ THEN REPLY ~I shall dish out payment, misery, and death to all who have wronged me.~ GOTO Revenge
    IF ~~ THEN REPLY ~I'd rather leave the city.~ GOTO RejectionKrivy
END

IF ~~ THEN BEGIN Dragged
    SAY ~Nobody can say that I have not tried. So long, <CHARNAME>. It has been a pleasure. Damn! How could they have found me here?!~
    IF ~~ THEN DO
        %SetGlobal("rqGDZZEnding","GLOBAL",1)
        DisplayStringHead(Myself,~Uses Item~)
        ForceSpell(Myself,DRYAD_TELEPORT)%

        SOLVED_JOURNAL ~Duke of Baldur's Gate:

        I had enough of Krivy and his nonsense. I would rather be free and do what I wish than be strung along by some thief.~
    EXIT
END

IF ~~ THEN BEGIN RejectionKrivy
    SAY ~I can transport you to a nearby area; from there, you can go anywhere you like. Damn it! They must have spotted me here.~
    IF ~~ THEN DO
        %SetGlobal("rqGDZZEnding","GLOBAL",1)
        DisplayStringHead(Myself,~Uses Item~)
        ForceSpell(Myself,DRYAD_TELEPORT)%
        SOLVED_JOURNAL ~Duke of Baldur's Gate:

        I had enough of Krivy and his nonsense. I would rather be free and do what I wish than be strung along by some thief.~
    EXIT
END

IF ~~ THEN BEGIN Revenge
    SAY ~Great. Know that Alatos will be prepared for you.~
    IF ~~ THEN DO
        %SetGlobal("rqGDNeutralPathStep5","GLOBAL",4)
        SetGlobal("rqGDNeutralPathStep6","GLOBAL",1)
        SetGlobal("BG_AttackedThieves","GLOBAL",1)
        SetGlobal("Password","GLOBAL",1)
        SetGlobal("rqGDThiefReinforce","GLOBAL",1)
        EscapeArea()%
        UNSOLVED_JOURNAL ~Duke of Baldur's Gate:

        I think Alatos has earned his death for his actions against me. I shall kill all the thieves even if it is the last thing I do in Baldur's Gate.~
    EXIT
END

// Neutral Release Charname
IF ~Global("rqGDNeutralPathStep4","GLOBAL",1)~ THEN BEGIN ReleaseCharname
    SAY ~I do not enjoy seeing you caged like this, <CHARNAME>. There are far more interesting things to do outside.~
    IF ~~ THEN REPLY ~I have had enough of this ducal election farce. All I want is to return to adventuring.~ GOTO Release
    IF ~~ THEN REPLY ~There are certain thing that i wish to know.~ GOTO MoreQuestions
END

IF ~~ THEN BEGIN MoreQuestions
    SAY ~I shall illuminate your mind with my answers...~
    IF ~~ THEN REPLY ~How did you know I was imprisoned here?~ GOTO KnowGarrisonCommander
    IF ~~ THEN REPLY ~Will this disrupt my ducal campaign?~ GOTO DisruptMyCampaign
    IF ~~ THEN REPLY ~Belt sought me out and tried to convince me to stop our cooperation. Why?~ GOTO StopCooperation
    IF ~~ THEN REPLY ~Why did you try to have me elected when you knew that with just your support there was simply no way I would have been elected?~ GOTO NotEnoughSupport
    IF ~~ THEN REPLY ~No more questions. Just get me out of here.~ GOTO GetMeOutOfThere
END

IF ~~ THEN BEGIN DisruptMyCampaign
    SAY ~Huh? Who do you think ordered your arrest? Our conflict has created enough instability that nobles are now reluctant to support us.~
    IF ~~ THEN REPLY ~More questions i have for you.~ GOTO MoreQuestions
    IF ~~ THEN REPLY ~No more of this nonsense. I wish to return to adventuring.~ GOTO GetMeOutOfThere
END

IF ~~ THEN BEGIN StopCooperation
    SAY ~Belt is afraid of me, I think for the wrong reasons, but whatever. Being a former thief is probably his biggest gripe with me.~
    IF ~~ THEN REPLY ~More questions i have for you.~ GOTO MoreQuestions
    IF ~~ THEN REPLY ~I suppose it is time to move on to what I know best: adventuring.~ GOTO GetMeOutOfThere
END

IF ~~ THEN BEGIN KnowGarrisonCommander
    SAY ~Oh... the garrison commander and I know each other.~
    IF ~~ THEN REPLY ~There are certain other things that I would like to know.~ GOTO MoreQuestions
    IF ~~ THEN REPLY ~I am done with this nonsense. I want to return to adventuring.~ GOTO GetMeOutOfThere
END

IF ~~ THEN BEGIN NotEnoughSupport
    SAY ~I had hoped your charisma and the fact that you literally saved this city would convince more nobles to support us. There was also the issue of Belt's spy undermining me, though he is dead now.~
    IF ~~ THEN REPLY ~I have more questions.~ GOTO MoreQuestions
    IF ~~ THEN REPLY ~I'd rather not continue our little campaign and return to adventuring.~ GOTO GetMeOutOfThere
END

IF ~~ THEN BEGIN GetMeOutOfThere
    SAY ~I shall effect your release shortly, but before I do that, I want to ask one thing of you.~
    IF ~~ THEN REPLY ~What is it?~ GOTO RevengeKillThieves
END

IF ~~ THEN BEGIN RevengeKillThieves
    SAY ~I want you to get revenge. I want you to kill everyone in the Thieves Guild. They are partly responsible for all of this.~
    IF ~~ THEN REPLY ~Partly? Who is the other faction responsible?~ GOTO PartlyResponsible
    IF ~~ THEN REPLY ~No, I do not owe you anything. I just want to restart my adventuring.~ GOTO Release
END

IF ~~ THEN BEGIN PartlyResponsible
    SAY ~That would be me, I am afraid. You could have been my <PRO_MANWOMAN> who would rid this city of filthy thieving scum.~
    IF ~~ THEN REPLY ~If my ducal campaign is disrupted, I might as well return to adventuring.~ GOTO Release
    IF ~~ THEN REPLY ~What proof do you have of this?~ GOTO ProofOfThiefWorkingAgainstMe
    IF ~~ THEN REPLY ~Blood for blood. I shall bring their violence to them.~ GOTO Bloodshed
END

IF ~~ THEN BEGIN ProofOfThiefWorkingAgainstMe
    SAY ~Have they not attacked you? A certain Nemean comes to mind, or other ambushes?~
    IF ~~ THEN REPLY ~Retribution will be a fitting response to their unprovoked attacks.~ GOTO Bloodshed
    IF ~~ THEN REPLY ~No, I just want to put this event behind me. I am leaving.~ GOTO Release
END

IF ~~ THEN BEGIN Bloodshed
    SAY ~Be careful. They will be ready for your assault. Farewell, <CHARNAME>. It was a pleasure.~
    IF ~~ THEN DO
        %SetGlobal("rqGDNeutralPathStep4","GLOBAL",3)
        SetGlobal("BG_AttackedThieves","GLOBAL",1)
        SetGlobal("Password","GLOBAL",1)
        SetGlobal("rqGDThiefReinforce","GLOBAL",1)
        EscapeArea()%
        UNSOLVED_JOURNAL ~Duke of Baldur's Gate:

        I think Alatos has earned his death for his actions against me. I shall kill all the thieves even if it is the last thing I do in Baldur's Gate.~
    EXIT
END

IF ~~ THEN BEGIN Release
    SAY ~I shall effect your release shortly.~
    IF ~~ THEN DO
        ~SetGlobal("rqGDNeutralPathStep4","GLOBAL",2)
        EscapeArea()~
    EXIT
END

// Good path step4 Assault on Thieves Guild
IF ~Global("rqGDGoodPathStep4","GLOBAL",1)~ THEN BEGIN Warning
    SAY ~<CHARNAME>, I have been trying to find you for quite some time now. Alatos has sent an assassin after you; his name is Nemean.~
    IF ~~ THEN REPLY ~Yes, I know. I have already killed him.~ GOTO ActNow
    IF ~~ THEN REPLY ~Now he's telling me that.~ GOTO ActNow
    IF ~~ THEN REPLY ~I killed Nemean. Why did you seek me out?~ GOTO ActNow
    IF ~~ THEN REPLY ~What about the elections? Do I still have support from the nobles?~ GOTO SupportingNow
    IF ~~ THEN REPLY ~Your actions are causing mayhem. I should have arrested you and brought you before Belt.~ GOTO BeforeBelt
END

IF ~~ THEN BEGIN BeforeBelt
    SAY ~Ha! Do you even know who my enemy is? Who hired Nemean? We could go deeper, but I suspect you just want to know who is after you.~
    IF ~~ THEN REPLY ~I want the longer version.~ GOTO Explaining
    IF ~~ THEN REPLY ~Speak. Who desires my death?~ GOTO Short
END

IF ~~ THEN BEGIN Short
    SAY ~Belt has hired Alatos to remove you from the city since he is afraid of your ducal aspirations.~
    IF ~~ THEN REPLY ~Remove, as in forced out or killed?~ GOTO DetailOfRemoval
END

IF ~~ THEN BEGIN DetailOfRemoval
    SAY ~I do not think that Belt wants you dead, but Alatos does since you and I work together.~
    IF ~~ THEN REPLY ~This still does not explain why Alatos is after you.~ GOTO NotExplain
END

IF ~~ THEN BEGIN NotExplain
    SAY ~Later, <CHARNAME>. We could talk all <DAYNIGHTALL> and not get anywhere. What I want from you is simple: kill Alatos.~
    IF ~~ THEN REPLY ~Can I just leave this mess and return to adventuring?~ GOTO LeavingBG1
    IF ~~ THEN REPLY ~He is a thief and did order your assassination, while you did nothing wrong...~ GOTO NothingWrong
END

IF ~~ THEN BEGIN NothingWrong
    SAY ~Yes, I would think removing thieves from the city is a good thing, no? Now let me explain further:~
    IF ~~ THEN GOTO Explaining
END

IF ~~ THEN BEGIN LeavingBG1
    SAY ~Sure, you want to do this? It will end your only chance to elevate yourself and do more good from a higher position.~
     IF ~~ THEN REPLY ~Yes, it is what I wish.~ GOTO BeltNoGoAfterAlatos
     IF ~~ THEN REPLY ~Maybe you are right. I should help others by doing what's right as Duke.~ GOTO Assault
     IF ~~ THEN REPLY ~Now that I think about it... though I need more information about my enemies and why Belt and Alatos are allied.~ GOTO Short
END

IF ~~ THEN BEGIN ActNow
    SAY ~Damn, I had not anticipated they would be acting so fast. Nevertheless, we have a serious obstacle in our path.~
    IF ~~ THEN REPLY ~What are you talking about?~ GOTO Goal
END

IF ~~ THEN BEGIN SupportingNow
    SAY ~Nobles? They are a cowardly bunch. They wait out our struggle and support the winner.~
    IF ~~ THEN REPLY ~No spine at all. I should have known... so why are you here?~ GOTO Goal
END

IF ~~ THEN BEGIN Goal
    SAY ~First, you need to realize who our enemies are. Belt and Alatos are conspiring together to force us out of the city.~
    IF ~~ THEN REPLY ~What? Why would they do that?~ GOTO Explaining
END

IF ~~ THEN BEGIN Explaining
    SAY ~Because they absolutely do not want you to become Duke. Belt's motive is obvious: he does not like me being behind you. Alatos does not like unnecessary changes after experiencing Angelo's brief but quite destructive period. He knows your morality and rightfully assumes you would be opposed to Belt's and Alatos' *unholy alliance*.~
    IF ~~ THEN REPLY ~So why are you telling me all this?~ GOTO Assault
END

IF ~~ THEN BEGIN Assault
    SAY ~We need to strike at Alatos' lair and kill him and his goons.~
    IF ~~ THEN REPLY ~Why not just negotiate with Belt to stop these attacks?~ GOTO Parlay
    IF ~~ THEN REPLY ~Despite what you are saying might be true, I am not murdering everyone in the Thieves Guild.~ GOTO Refusal
    IF ~~ THEN REPLY ~If what you say is true, I'd better strike back at those who have an interest in my demise.~ GOTO Agreement
    IF ~~ THEN REPLY ~All of this is your fault, Krivy!~ GOTO MyFault
END

IF ~~ THEN BEGIN Parlay
    SAY ~What makes you think they would adhere to any agreement? And even if they did, how long do you think it would take them to try again? The wise course of action would be to send a message: kill Alatos and his crooked thieves. What do you think the city gains from your inaction?~
    IF ~~ THEN REPLY ~And thieves shall plague this city no more.~ GOTO Agreement
    IF ~~ THEN REPLY ~No matter what you say, I will not do this.~ GOTO BeltNoGoAfterAlatos
END

IF ~~ THEN BEGIN Refusal
    SAY ~Fine. Now explain to me how your course of action will benefit you in the long run?~
    IF ~~ THEN REPLY ~You are correct. It is better to show no mercy to those who have struck the first blow.~ GOTO Agreement
    IF ~~ THEN REPLY ~I do not need to explain myself to you, Krivy.~ GOTO BeltNoGoAfterAlatos
END

IF ~~ THEN BEGIN MyFault
    SAY ~Perhaps it is. What does not change is that in their eyes, we are enemies. You stand before a decision: whether you want to eliminate your enemies or let them strike at you at their leisure.~
    IF ~~ THEN REPLY ~True. I shall exact retribution for their foul deeds.~ GOTO Agreement
    IF ~~ THEN REPLY ~I do not like being manipulated, Krivy, so I am not going to do that.~ GOTO BeltNoGoAfterAlatos
END

IF ~~ THEN BEGIN Agreement
    SAY ~Good. Now make haste and remove the evil of Alatos' thieves. Now to the second part of your assignment...~
    IF ~~ THEN DO
        %SetGlobal("rqGDGoodPathStep4","GLOBAL",2)
        SetGlobal("BG_AttackedThieves","GLOBAL",1)
        SetGlobal("Password","GLOBAL",1)
        SetGlobal("rqGDThiefReinforce","GLOBAL",1)%
        UNSOLVED_JOURNAL ~Duke of Baldur's Gate:

        So Alatos is behind my assassination attempt. I should visit Alatos's lair in the Eastern district and eliminate him.~
        GOTO BeltTalk
END

IF ~~ THEN BEGIN BeltNoGoAfterAlatos
    SAY ~I am thoroughly confused by your morality, but I do respect your decision even though I consider it foolish. Now to the next move.~
    IF ~~ THEN DO ~SetGlobal("rqGDGoodPathStep4","GLOBAL",10)~ GOTO BeltTalk
END

IF ~~ THEN BEGIN BeltTalk
    SAY ~You should make peace with Belt, so find Belt or his right hand Alvier in the Ducal Palace.~
    IF ~Global("rqGDGoodPathStep4","GLOBAL",1)~ THEN REPLY ~What? Did you not just claim that Alatos was working for Belt?~ GOTO Exactly
    IF ~Global("rqGDGoodPathStep4","GLOBAL",2)~ THEN REPLY ~I have seen my share of insane suggestions; this one tops them all.~ GOTO Exactly
    IF ~Global("rqGDGoodPathStep4","GLOBAL",2)~ THEN REPLY ~After slaughtering thieves, you want me to speak to Belt?~ GOTO Exactly
    IF ~Global("rqGDGoodPathStep4","GLOBAL",10)~ THEN REPLY ~You must be insane.~ GOTO Insanity
END

IF ~~ THEN Exactly
    SAY ~Yes, let me explain. Speaking to Belt after you kill his goon Alatos will show him that you are not to be trifled with, and it's not like Belt can just attack you for killing thieves he would implicate himself.~
    IF ~~ THEN REPLY ~I do hope you are correct, Krivy.~ GOTO Fin
    IF ~~ THEN REPLY ~Whatever you say.~ GOTO Fin
END

IF ~~ THEN BEGIN Insanity
    SAY ~Am I? I'm just trying to help you. If you talk to Belt, do his little courier mission, and disappear from the city, what reason would Belt have to attack you?~
    IF ~~ THEN REPLY ~Why would I do that after he sent an assassin after me?~ GOTO WorkOrNot
    IF ~~ THEN REPLY ~I have reconsidered. I'd rather go after Alatos.~ GOTO GoAfterAlatos
    IF ~~ THEN REPLY ~Do you think that will work?~ GOTO WorkOrNot
END

IF ~~ THEN BEGIN WorkOrNot
    SAY ~That you need to discover on your own, <CHARNAME>.~
    IF ~~ THEN GOTO FinNoAlatos
END

IF ~~ THEN BEGIN GoAfterAlatos
    SAY ~Well, it would seem you have some foresight after all.~
    IF ~~ THEN REPLY ~You must be insane, but on second thought, what you say does have some merit.~ GOTO Agreement
    IF ~~ THEN REPLY ~As foolish as it sounds, I might actually do that.~ GOTO Agreement
END

IF ~~ THEN BEGIN FinNoAlatos
    SAY ~My time here is done. Farewell.~
    IF ~~ THEN DO
            %SetGlobal("rqGDGoodPathStep5","GLOBAL",1)
            SetGlobal("rqGDGoodPathStep4","GLOBAL",2)
            EscapeArea()%
            UNSOLVED_JOURNAL ~Duke of Baldur's Gate:

            My next move, according to Krivy, should be to make a deal with Duke Belt, which will hopefully stop the attempts on my life.~
        EXIT
END

IF ~~ THEN BEGIN Fin
    SAY ~My time here is done. Farewell.~
    IF ~~ THEN DO
            %SetGlobal("rqGDGoodPathStep5","GLOBAL",1)
            SetGlobal("rqGDGoodPathStep4","GLOBAL",3)
            EscapeArea()%
            UNSOLVED_JOURNAL ~Duke of Baldur's Gate:

            I have refused Krivy's suggestion to slaughter Alatos and his thieves, which I might regret in the future, but I do not think that bloodshed would have solved the situation. My next move, according to Krivy, should be to make a deal with Duke Belt, which will hopefully stop the attempts on my life.~
        EXIT
END

// Undercellar Good path last action
IF ~Global("rqGDGoodPathStep6","GLOBAL",1)~ THEN BEGIN Balaclava
    SAY ~What? Wait a second, why are you here, <CHARNAME>?~
    IF ~~ THEN REPLY ~Belt has sent me to... have a little talk...~ GOTO LittleTalk
    IF ~~ THEN REPLY ~You should have known how this would go, Krivy.~ GOTO LastWords
    IF ~~ THEN REPLY ~Why all this? Why did you create such an elaborate deception?~ GOTO ExplanationOfMotive
    IF ~~ THEN REPLY ~Who are you working for?~ GOTO DeathPreferable
    IF ~~ THEN REPLY ~What were you supposed to do?~ GOTO DeathPreferable
END

IF ~~ THEN BEGIN LittleTalk
    SAY ~Hahaha! I think I'd rather go down fighting than starve in a Fist dungeon!~
    IF ~~ THEN DO
        ~SetGlobal("rqGDGoodPathStep6","GLOBAL",2)
        SetGlobal("rqGDZZEnding","GLOBAL",1)
        Enemy()~
    EXIT
END

IF ~~ THEN BEGIN DeathPreferable
    SAY ~Failure is wholly on me. I should have known better than to involve you in my plans. Let us end this farce!~
    IF ~~ THEN DO
        ~SetGlobal("rqGDGoodPathStep6","GLOBAL",2)
        SetGlobal("rqGDZZEnding","GLOBAL",1)
        Enemy()~
    EXIT
END

IF ~~ THEN BEGIN ExplanationOfMotive
    SAY ~I don't think I need to explain anything to you. The secret of my failure will die with me.~
    IF ~~ THEN DO
        ~SetGlobal("rqGDGoodPathStep6","GLOBAL",2)
         SetGlobal("rqGDZZEnding","GLOBAL",1)
         Enemy()~
    EXIT
END

IF ~~ THEN BEGIN LastWords
    SAY ~I should have... I should have... *In silence, he draws his weapon*.~
    IF ~~ THEN DO
        ~SetGlobal("rqGDGoodPathStep6","GLOBAL",2)
         SetGlobal("rqGDZZEnding","GLOBAL",1)
         Enemy()~
    EXIT
END

// Evil path
IF ~GlobalGT("rqGDVotes","GLOBAL",7)
    Alignment(Player1,MASK_EVIL)
    Global("rqGDEvilPath","GLOBAL",1)
    Global("rqGDEvilPathStep1","GLOBAL",0)~ THEN BEGIN KrivyIntro1
    SAY ~<CHARNAME>! I know I am early, but there are events that you need to be aware of.~
    IF ~~ THEN REPLY ~What has happened?~ GOTO EnemiesMovesAgainstUs
END

IF ~~ THEN BEGIN EnemiesMovesAgainstUs
    SAY ~It would seem that our enemies have moved against us. My spies have informed me that a group of paladins have arrived in Baldur's Gate. We will have to *move* them out of your city unless you want to be attacked without forewarning.~
    IF ~~ THEN REPLY ~Why would paladins come here?~ GOTO WhyWouldPaladins
    IF ~~ THEN REPLY ~Can I just persuade them to leave?~ GOTO PersuadeToLeave
    IF ~~ THEN REPLY ~I will not let do-gooder paladins interfere!~ GOTO PaladinsKillThem
END

IF ~~ THEN BEGIN WhyWouldPaladins
    SAY ~You are a child of Bhaal, are you not? That and the actions of your sibling Sarevok might have caused them to come here.~
    IF ~~ THEN REPLY ~But what do they want?~ GOTO WhatElseSpyKnowsAboutPaladins
END

IF ~~ THEN BEGIN PersuadeToLeave
    SAY ~*Laughs* It is doubtful that paladins will will want to have meaningful conversations with you.~
    IF ~~ THEN REPLY ~So they are here to kill me?~ GOTO WhatElseSpyKnowsAboutPaladins
    IF ~~ THEN REPLY ~What else do your spies know about these paladins?~ GOTO WhatElseSpyKnowsAboutPaladins
END

IF ~~ THEN BEGIN WhatElseSpyKnowsAboutPaladins
    SAY ~The paladins were invited here by the Dukes to protect themselves from you, <CHARNAME>.~
    IF ~~ THEN REPLY ~So what am I to do with these paladins?~ GOTO WhatIAmToDo
END

IF ~~ THEN BEGIN WhatIAmToDo
    SAY ~Either convince them not to interfere with your plans or kill them.~
    IF ~~ THEN REPLY ~You do not leave me much choice in this matter.~ GOTO MuchChoice
    IF ~~ THEN REPLY ~Consider it done.~ GOTO MuchChoice
END

IF ~~ THEN BEGIN MuchChoice
    SAY ~Just go and see them in the Shop of Silence located in this district, and when you are done, meet me at the Blade and Stars. Farewell.~
    IF ~~ THEN DO
        %SetGlobal("rqGDEvilPath","GLOBAL",1)
        SetGlobal("rqGDEvilPathStep1","GLOBAL",1)
        EscapeArea()%
        UNSOLVED_JOURNAL ~Duke of Baldur's Gate:

        Krivy has set me up against paladins; I do have reservations about this but little choice. The paladins are lodged in the Shop of Silence in the Eastern district of Baldur's Gate. If I am finished with the paladins, I should report it to Krivy in the Blade and Stars.~
    EXIT
END

IF ~~ THEN BEGIN PaladinsKillThem
    SAY ~That's the spirit! They are lodged in the Shop of Silence, which is located in the central east sector near the curtain wall. Oh, and meet me in the Blade and Stars later. Farewell, <CHARNAME>.~
    IF ~~ THEN DO
        %SetGlobal("rqGDEvilPathStep1","GLOBAL",1)
        EscapeArea()%
        UNSOLVED_JOURNAL ~Duke of Baldur's Gate:

        Krivy has set me up against paladins; I do have reservations about this but little choice. The paladins are lodged in the Shop of Silence in the Eastern district of Baldur's Gate. If I am finished with the paladins, I should report it to Krivy in the Blade and Stars.~
    EXIT
END

// Assault on Flaming fist headquarters Trest helps you.
IF ~Global("rqGDEvilPathStep1","GLOBAL",1)~ THEN BEGIN PaladinsNotDone1
    SAY ~We are in very dangerous situtation right now so i ask you have you succeded in removing paladin threat?~
    IF ~~ THEN REPLY ~No not yet~ GOTO NoNotYet1
    IF ~~ THEN REPLY ~Where find them again?~ GOTO PaladinsNotDone
END

IF ~~ THEN BEGIN NoNotYet1
    SAY ~Then hurry up this is serious <CHARNAME> go to the Silences shop and confront the paladins.~
    IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN PaladinsNotDone
    SAY ~Damn they in Silences shop in East district hurry before they will converge on our location.~
    IF ~~ THEN EXIT
END

//Paladins dead
IF ~Global("rqGDEvilPathStep1","GLOBAL",2)~ THEN BEGIN AssaultFFistHQIntro
    SAY ~Is the paladin nuisance neutralized? We need to move rapidly from now on, otherwise our plans could be foiled.~
    IF ~Dead("rqcle1a") Dead("rqpal1a") Dead("rqpal2a") Dead("rqpal3a") Dead("rqpal4a") Dead("rqpal5a")~ THEN REPLY ~Yes, it is.~
        DO %AddexperienceParty(5000)
        EraseJournalEntry(~Duke of of Baldur's Gate:

        Krivy has set me up against paladins; I do have reservations about this but little choice. The paladins are lodged in the Shop of Silence in the Eastern district of Baldur's Gate. If I am finished with the paladins, I should report it to Krivy in the Blade and Stars.~)%
            GOTO YesTheyAreDead
    IF ~!Dead("rqcle1a") !Dead("rqpal1a") !Dead("rqpal2a") !Dead("rqpal3a") !Dead("rqpal4a") !Dead("rqpal5a")~ THEN REPLY ~No, not yet.~ GOTO NoNotYet
END

IF ~~ THEN BEGIN NoNotYet
    SAY ~Find the Shop of Silence and let your weapons and magic do the talking, otherwise we will be hanging from a tree very soon, my friend.~
    IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN YesTheyAreDead
    SAY ~We need to strike a blow at their heart: the Flaming Fist citadel. If we can act quickly and decisively enough, we should be able to take control of the city.~
    IF ~~ THEN REPLY ~I have longed for power, and now I shall have it!~ GOTO SeizePower
    IF ~~ THEN REPLY ~Wait one moment; we were talking about being elected, not seizing power by force.~ GOTO Elected
    IF ~~ THEN REPLY ~This better be more successful than the attempt of Sarevok.~ GOTO Doubts
    IF ~~ THEN REPLY ~What is your reasoning behind attacking the Flaming Fist citadel? To me, it looks like suicide.~ GOTO WhyFistCitadel
    IF ~~ THEN REPLY ~Assaulting the Flaming Fist inside their own citadel is a foolish plan; I am not risking my neck for this.~ GOTO RejectionKrivyEvil
END

IF ~~ THEN BEGIN Elected
    SAY ~That plan went up in smoke when Belt made the rest of the nobles aware of your heritage. So now we have two choices: either we flee the city, or we seize power in the city for ourselves.~
    IF ~~ THEN REPLY ~Now that you put it this way, I'd rather take the power I ought to have!~ GOTO SeizePower
    IF ~~ THEN REPLY ~No, I prefer life adventuring familiar risk and all that. Farewell.~ GOTO RejectionKrivyEvil
END

IF ~~ THEN BEGIN SeizePower
    SAY ~Good... good... Go forth and secure your destiny!~
        IF ~~ THEN DO
        %SetGlobal("rqGDEvilPathStep2","GLOBAL",1)
        SetGlobal("rqGDEvilPathStep1","GLOBAL",3)
        EscapeArea()%
        UNSOLVED_JOURNAL ~Duke of Baldur's Gate:

        I am to assault the Flaming Fist Citadel, which sounds like suicide, but Krivy assures me that with the help of Trest, who is second in command of the Flaming Fist mercenaries, it is possible. Further details can be gleaned from Trest, who is standing outside the Flaming Fist Citadel.~
    EXIT
END

IF ~~ THEN BEGIN WhyFistCitadel
    SAY ~I am no fool, <CHARNAME>. I have my ally Trest at the citadel; he is Second in Command of the Fist. You just need to help him secure his position. If you do not like my plan, you can simply leave Baldur's Gate, but knowing you, I think you are much more inclined to seize power.~
    IF ~~ THEN REPLY ~Power awaits, then.~ GOTO SeizePower
    IF ~~ THEN REPLY ~You better deliver, or I shall take my revenge on you, though I'd rather be a Duke than serve one.~ GOTO SeizePower
    IF ~~ THEN REPLY ~I am not interested in further risking my neck for these shady schemes.~ GOTO RejectionKrivyEvil
    IF ~~ THEN REPLY ~You mean I could just leave? This whole thing is rather dangerous; I do not want to end up like Sarevok.~ GOTO NotSarevokEnd
END

IF ~~ THEN BEGIN NotSarevokEnd
    SAY ~Yes, I do have a teleportation scroll which I had planned to use. You could use it to move out of the city, south of Nashkhel.~
    IF ~~ THEN REPLY ~Yes, I do want that; I want to resume adventuring.~ GOTO ResumeAdventuring
    IF ~~ THEN REPLY ~No, I'd rather take what my brother could not.~ GOTO Doubts
END

IF ~~ THEN BEGIN ResumeAdventuring
    SAY ~I am disappointed by your actions, but I cannot force you to stay here... Know that you have made enemies, and they will try to attack you sooner or later.~
        IF ~~ THEN DO
            ~SetGlobal("rqGDZZEnding","GLOBAL",1)
            EscapeArea()~
        EXIT
END

IF ~~ THEN BEGIN Doubts
    SAY ~I understand that you have doubts about our overthrow of the legitimate Ducal leadership, but power is what you take for yourself; it cannot be given it has to be taken.~
    IF ~~ THEN REPLY ~I'd rather seize my destiny!~ GOTO SeizePower
    IF ~~ THEN REPLY ~Adventuring is much simpler than your schemes, so that is what I will be doing. Farewell.~ GOTO RejectionKrivyEvil
END

IF ~~ THEN BEGIN RejectionKrivyEvil
    SAY ~It seems that I have misjudged you. Well, no matter; I will be leaving immediately. I suggest you do the same.~
    IF ~~ THEN DO
        ~SetGlobal("rqGDZZEnding","GLOBAL",1)
        EscapeArea()~
    EXIT
END

// Krivy tries to convince you to go against Shadow Thieves.
IF ~Global("rqGDEvilPathStep3","GLOBAL",2)~ THEN BEGIN KrivyIntroThieves
    SAY ~Have you succeeded at the Flaming Fist Citadel? Can we continue with the last stage? The Ducal title is waiting.~
    IF ~~ THEN REPLY ~Last stage? I don't think so. I defeated an ambush, and they certainly weren't Flaming Fist members.~ DO
        %EraseJournalEntry (~Duke of Baldur's Gate:

        I am to assault the Flaming Fist Citadel, which sounds like suicide, but Krivy assures me that with the help of Trest, who is second in command of the Flaming Fist mercenaries, it is possible. Further details can be gleaned from Trest, who is standing outside the Flaming Fist Citadel.~)%
            GOTO WhoAreMyEnemies
    IF ~~ THEN REPLY ~The Ducal palace is waiting!~ DO
        %EraseJournalEntry (~Duke of Baldur's Gate:

        I am to assault the Flaming Fist Citadel, which sounds like suicide, but Krivy assures me that with the help of Trest, who is second in command of the Flaming Fist mercenaries, it is possible. Further details can be gleaned from Trest, who is standing outside the Flaming Fist Citadel.~)%
            GOTO DucalPalaceNotYet
    IF ~~ THEN REPLY ~Who are you setting me against now?~ DO
        %EraseJournalEntry (~Duke of Baldur's Gate:

        I am to assault the Flaming Fist Citadel, which sounds like suicide, but Krivy assures me that with the help of Trest, who is second in command of the Flaming Fist mercenaries, it is possible. Further details can be gleaned from Trest, who is standing outside the Flaming Fist Citadel.~)%
            GOTO WhoAreMyEnemies
END

IF ~~ THEN BEGIN DucalPalaceNotYet
    SAY ~No, not yet. Most nobles do not like us, though they *will* respect your strength. If presented with "fait accompli," they will yield to you.~
    IF ~~ THEN REPLY ~So what shall we do next?~ GOTO WhoAreMyEnemies
END

IF ~~ THEN BEGIN WhoAreMyEnemies
    SAY ~Understand what we are up against... You should know who the remaining allies of the Dukes are. I understand that our enemies have already sent assassins after you. A certain Nemean comes to mind, and he works for Alatos.~
    IF ~~ THEN REPLY ~What?! Belt has aligned himself with thieves?~ GOTO AlignedWithThieves
    IF ~~ THEN REPLY ~You might be correct. What are we going to do about this?~ GOTO AlignedWithThieves
END

IF ~~ THEN BEGIN AlignedWithThieves
    SAY ~Why is this so surprising? We have removed his Paladins. Belt knows how dangerous you are. Why not get all available manpower? Alatos is friendly to Ducal power, and he certainly does not want to deal with the likes of you. Why do you think he released information about your heritage to the noblemen?~
    IF ~~ THEN REPLY ~Krivy, I have killed quite a lot of men already. When will I be voted in as Duke?~ GOTO Votes
    IF ~~ THEN REPLY ~Do you know all this for a fact?~ GOTO Votes
    IF ~~ THEN REPLY ~What is your role in all this?~ GOTO KrivyRole
    IF ~~ THEN REPLY ~Never mind all this political nonsense. Just tell me what is the shortest route between me and the Ducal title.~ GOTO KillThem
END

IF ~~ THEN BEGIN KrivyRole
    SAY ~My role is really small and insignificant. Suffice it to say that I do wish to see you at the Ducal Palace.~
    IF ~~ THEN REPLY ~Enough of stalling. I'd like direct action.~ GOTO KillThem
    IF ~~ THEN REPLY ~So who do you work for?~ GOTO WhoDoYouWorkFor
END

IF ~~ THEN BEGIN WhoDoYouWorkFor
    SAY ~I cannot expose the people I work for, <CHARNAME>.~
    IF ~~ THEN REPLY ~So what are we to do now?~ GOTO Votes
    IF ~~ THEN REPLY ~Can the thieves be convinced to stand down, in your opinion?~ GOTO KillThem
END

IF ~~ THEN BEGIN Votes
    SAY ~Valid question. You see, <CHARNAME>, power comes from the edge of a sword. If we kill or neutralize all the military force the Dukes can muster, we will present the voting landowners with a choice. They will no longer have to be intimidated by Belt's implied threat of force. Obviously, I will have to present all this news to make them believe in you.~
    IF ~~ THEN REPLY ~Would it be possible to persuade them somehow to switch sides?~ GOTO KillThem
    IF ~~ THEN REPLY ~So what should we do with the thieves?~ GOTO KillThem
END

IF ~~ THEN BEGIN KillThem
    SAY ~Direct assault, or we *could* negotiate terms which they will maybe honor at first and then stab you in the back? Only a fool would trust a thief. Therefore, the only logical conclusion is to kill Alatos and his men.~
    IF ~~ THEN DO
        %SetGlobal("rqGDEvilPathStep4","GLOBAL",1)
        SetGlobal("BG_AttackedThieves","GLOBAL",1)
        SetGlobal("Password","GLOBAL",1)
        SetGlobal("rqGDThiefReinforce","GLOBAL",1)%
        UNSOLVED_JOURNAL ~Duke of Baldur's Gate:

        Alatos should be the last obstacle before my ascension to the ducal position. All I have to do is kill everyone in the guild. Location: East Baldur's Gate, northeast of Sorcerous Sundries.~
    EXIT
END




