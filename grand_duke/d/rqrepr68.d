// Turpin

BEGIN ~rqrepr6~

IF ~Global("rqGDGrandDukeQuest","GLOBAL",1)~ THEN BEGIN Repre6Welcome
    SAY ~<CHARNAME>, welcome, welcome... to our little gathering of your supporters.~
    IF ~~ THEN EXTERN ~rqrepr7~ PotentialSupporters
END

IF ~~ THEN BEGIN NegotiationQuestion
    SAY ~Yes, we still have not agreed to cooperate, but I am sure that we can come to some sort of agreement here.~
    IF ~~ THEN REPLY ~Is this collective bargaining? Can I negotiate with each representative separately?~ GOTO CollectiveBargain
END

IF ~~ THEN BEGIN CorrectionSupportersYes
    SAY ~Let us get introduced. I am Turpin of the Milgerin family.~
    IF ~~ THEN EXTERN ~rqrepr7~ IvyllaIntro
END

IF ~~ THEN BEGIN CollectiveBargain
    SAY ~Yes, you can. We as a group will not hold it against you if you do not agree to our *requests*.~
    IF ~~ THEN REPLY ~So what exactly do you want?~ GOTO Repre6Wants
END

IF ~~ THEN BEGIN Repre6Wants
    SAY ~*Clears throat* My family wishes to acquire *exclusive* ale trading rights. I will vote for your candidacy. If for whatever reason you you decide not to honor our agreement, I have witnesses here that will bolster my argument, and you will acquire a powerful enemy. So, do I have your word on this matter?~
    IF ~~ THEN REPLY ~As Duke, do I have the power to do that?~ GOTO PowerToDoSo
    IF ~~ THEN REPLY ~If all you are asking is to have your ale license, then I agree to your demands.~ GOTO FinalAgreement
    IF ~~ THEN REPLY ~No, I don't wish to engage in corruption even before I am Duke. No agreement.~ GOTO NowAgreementRepre6
END

IF ~~ THEN BEGIN PowerToDoSo
    SAY ~Yes, you do. So, can I count on you?~
    IF ~~ THEN REPLY ~Seems like small price for your support. I agree to your request.~ GOTO FinalAgreement
    IF ~~ THEN REPLY ~No, I am not interested in your corrupt schemes.~ GOTO NowAgreementRepre6
END

IF ~~ THEN BEGIN NowAgreementRepre6
    SAY ~An unwise rejection. Well, I can only hope our relations will improve significantly later.~
    IF ~~ THEN DO
        ~AddExperienceParty(500)
        IncrementGlobal("rqGDVotes","GLOBAL",-1)~
        SOLVED_JOURNAL ~Duke of Baldur's Gate: Turpin vote lost

        Landowners are trying to bribe me even before I got into the position of Duke. Naturally, I have rejected such things.~
        EXTERN ~rqrepr7~ IvyllaDemands
END

IF ~~ THEN BEGIN FinalAgreement
    SAY ~I am sure this will be just the beginning of fruitful cooperation between us.~
    IF ~~ THEN DO
        ~AddExperienceParty(500)
        IncrementGlobal("rqGDVotes","GLOBAL",1)~
        SOLVED_JOURNAL ~Duke of Baldur's Gate: Turpin vote gained

        Monopoly on ale distribution is surely just the beginning. I do wonder how much gold such a monopoly will earn Turpin.~
        EXTERN ~rqrepr7~ IvyllaDemands
END

IF ~~ THEN BEGIN TurpinIntejection
    SAY ~Wait a moment. Does your husband know about your *actions* here?~
    IF ~~ THEN EXTERN ~rqrepr7~ IvyllaActivities
END

IF ~~ THEN BEGIN FemaleAreYouAbleToDeliver
    SAY ~Are you actually able to deliver, Ivylla?~
    IF ~~ THEN EXTERN ~rqrepr7~ IvyllaAssurances
END

// Ivylla
BEGIN ~rqrepr7~

IF ~Global("rqGDGrandDukeQuest","GLOBAL",1)~ THEN BEGIN BeginTurpin
    SAY ~Turpin, would you please?~
    IF ~~ THEN EXTERN ~rqrepr6~ Repre6Welcome
END

IF ~~ THEN BEGIN PotentialSupporters
    SAY ~*Clears throat* *potential* supporters.~
    IF ~~ THEN EXTERN ~rqrepr6~ CorrectionSupportersYes
END

IF ~~ THEN BEGIN IvyllaIntro
    SAY ~Pleasure it is to meet you, <CHARNAME>. My name is Ivylla, wife of Nemegen Donnerstrom.~
    IF ~~ THEN EXTERN ~rqrepr8~ RemelsenIntro
END

IF ~~ THEN BEGIN IvyllaDemands
    SAY ~I wish to profit from your ascension. I want 2000 gold right now.~
    IF ~~ THEN EXTERN ~rqrepr6~ TurpinIntejection
END

IF ~~ THEN BEGIN IvyllaActivities
    SAY ~He doesn't. Why? What does this have to do with anything?~
    IF ~~ THEN EXTERN ~rqrepr6~ FemaleAreYouAbleToDeliver
END

IF ~~ THEN BEGIN IvyllaAssurances
    SAY ~He does what I wish of him, so yes, Turpin, I can deliver. <CHARNAME>, I can get you my husband's vote for cheaper, let's say 1500 gold.~
    IF ~~ THEN REPLY ~Really? I am doubtful as Turpin is.~ GOTO DoubtWithIvylla
    IF ~~ THEN REPLY ~I do not like to deal with manipulators. You will not get anything from me.~ GOTO IvyllaNoDeal
    IF ~PartyGoldGT(1499)~ THEN REPLY ~Alright, but you better make Nemegen vote for me.~ GOTO IssueOfNemegenVote
    IF ~PartyGoldLT(1500)~ THEN REPLY ~I do not have enough gold for this.~ GOTO NotEnoughGold
END

IF ~~ THEN BEGIN NotEnoughGold
    SAY ~What? You don't? I am not going to persuade my husband to vote for any beggars.~
    IF ~~ THEN DO ~IncrementGlobal("rqGDVotes","GLOBAL",-1)~  EXTERN ~rqrepr8~ RemelsenThatWentWell
END

IF ~~ THEN BEGIN DoubtWithIvylla
    SAY ~*Chuckles* I doubt you are so poor as to not afford to pay for my vote.~
    IF ~PartyGoldGT(1499)~ THEN REPLY ~I am rich enough. Though you better deliver or there will be bad blood between us. Now take your blasted gold.~ GOTO IssueOfNemegenVote
    IF ~PartyGoldGT(1499)~ THEN REPLY ~No deals with females like you.~ GOTO IvyllaNoDeal
    IF ~PartyGoldLT(1500)~ THEN REPLY ~I cannot afford your bribe. Can you wait for me to raise the gold?~ GOTO NotEnoughGold
    IF ~PartyGoldGT(1499)~ THEN REPLY ~No, I am not interested in making any deals with cutthroat females like yourself.~ GOTO IvyllaNoDeal
END

IF ~~ THEN BEGIN IvyllaNoDeal
    SAY ~Well, you just lost my husband's vote. Hope you feel morally upright.~
    IF ~~ THEN DO
        %AddExperienceParty(500)
        IncrementGlobal("rqGDVotes","GLOBAL",-1)%
        SOLVED_JOURNAL ~Duke of Baldur's Gate: Ivylla vote lost

        Ivylla, a nasty harpy of a woman, tried to extort me for votes. I do not tolerate such behavior from anyone, much less a frail, pompous female.~
        EXTERN ~rqrepr8~ RemelsenThatWentWell
END

IF ~~ THEN BEGIN IssueOfNemegenVote
    SAY ~You will not regret your investment, I promise.~
    IF ~~ THEN DO
        ~TakePartyGold(1500)
        AddExperienceParty(500)
        IncrementGlobal("rqGDVotes","GLOBAL",1)~
        SOLVED_JOURNAL ~Duke of Baldur's Gate: Ivylla vote gained

        Buying votes with money. How can someone be in such a position and still be so greedy?~
        EXTERN ~rqrepr8~ RemelsenNormal
END
// Remelsen
BEGIN ~rqrepr8~

IF ~Global("rqGDGrandDukeQuest","GLOBAL",1)~ THEN BEGIN TurpinStartRemelsen
    SAY ~Turpin, why don't you start?~
    IF ~~ THEN EXTERN ~rqrepr6~ Repre6Welcome
END

IF ~~ THEN BEGIN RemelsenIntro
    SAY ~And I am Remelsen. Turpin, please speak about why we are here. I do not wish to spend any more time here than I have to. No offense, <CHARNAME>.~
    IF ~~ THEN EXTERN ~rqrepr6~ Repre6Wants
END

IF ~~ THEN BEGIN RemelsenThatWentWell
    SAY ~Not good. Not good at all.... <CHARNAME>.~
    IF ~Dead("ALATOS")~ THEN GOTO RemelsenShadowThievesDead // dead shadow thieves check
    IF ~!Dead("ALATOS")~ THEN GOTO RemelsenShadowThieves
END

IF ~~ THEN BEGIN RemelsenNormal
    SAY ~Last but not least, you and I have a chance to exchange a few words.~
    IF ~Dead("ALATOS")~ THEN GOTO RemelsenShadowThievesDead // dead shadow thieves check
    IF ~!Dead("ALATOS")~ THEN GOTO RemelsenShadowThieves // alive shadow thieves
END

IF ~~ THEN BEGIN RemelsenShadowThievesDead
    SAY ~In exchange for our support, I want to know what happened at the Nashkel mines and who is responsible for it.~
    IF ~~ THEN REPLY ~A half-orc and his kobolds were poisoning the ore. He was working for the Iron Throne.~ GOTO PoisoningTheOre
END

IF ~~ THEN BEGIN RemelsenShadowThieves
    SAY ~My ask is simple: I want noninterference in the actions of my friend, Alatos Ravenscar.~
    IF ~~ THEN REPLY ~Sounds easy. I can promise you that.~ GOTO GotVoteFromRemelsen
    IF ~~ THEN REPLY ~No, I will not give you this promise.~ GOTO NoVoteFromRemelsen
END

IF ~~ THEN BEGIN PoisoningTheOre
    SAY ~So this whole *crisis* was not of the Zhents' doing? You being an opponent of the Iron Throne makes supporting your dukedom very, very easy. You have my vote.~
    IF ~~ THEN GOTO GotVoteFromRemelsen
END

IF ~~ THEN BEGIN GotVoteFromRemelsen
    SAY ~You have my vote, <CHARNAME>. If things go as smoothly here, you can expect to uplift your station soon enough...~
    IF ~~ THEN GOTO RemovalFromInn
END

IF ~~ THEN BEGIN RemovalFromInn
    SAY ~All things must end, right? Well, it is time for our little gathering to conclude.~
    IF ~~ THEN DO
        %AddExperienceParty(500)
        ActionOverride("rqrepr6",EscapeArea())
        ActionOverride("rqrepr7",EscapeArea())
        EscapeArea()
        IncrementGlobal("rqGDVotes","GLOBAL",1)%
        SOLVED_JOURNAL ~Duke of Baldur's Gate: Remelsen vote gained

        Getting Remelsen to vote for me was very easy, which makes me wonder about his motives.~
    EXIT
END

IF ~~ THEN BEGIN NoVoteFromRemelsen
    SAY ~Disappointing, but it is what it is. Keep in mind that our guild is not without defenses.~
    IF ~~ THEN DO
        %AddExperienceParty(500)
        ActionOverride("rqrepr6",EscapeArea())
        ActionOverride("rqrepr7",EscapeArea())
        EscapeArea()
        IncrementGlobal("rqGDVotes","GLOBAL",-1)%
        SOLVED_JOURNAL ~Duke of Baldur's Gate: Remelsen vote lost

        The Duke of Baldur's Gate, being Alatos's pawn, did not seem like a good deal to me. Give a thief a hand, and he'll take your whole arm.~
    EXIT
END
