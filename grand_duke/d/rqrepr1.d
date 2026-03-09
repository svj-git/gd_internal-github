// Talvin of Gelfiven Drakon Tavern AR7720

BEGIN ~rqrepr1~

IF ~Global("rqGDGrandDukeQuest","GLOBAL",1)~ THEN BEGIN Repre1Intro
    SAY ~*As you approach, his eyes scan you from top to bottom* My name is Talvin of the Gelfiven family. Before we support you, we need to know you. What I need to know is whether you are able to sacrifice certain things to achieve something greater.~
    IF ~PartyHasItem("ring06")~ THEN REPLY ~What exactly do you have in mind?~ GOTO GreaterAchieve
    IF ~!PartyHasItem("ring06")~ THEN REPLY ~What exactly do you have in mind?~ GOTO GreaterAchieveNoHaveRing
END

IF ~Global("rqGDRepreJob1","GLOBAL",1) PartyHasItem("ring06")~ THEN BEGIN HaveRingSecondTime
    SAY ~I will outline what I intend to do with your ring. It is...~
    IF ~~ THEN GOTO WhyDestroyTheRing
END

IF ~Global("rqGDRepreJob1","GLOBAL",1) !PartyHasItem("ring06")~ THEN BEGIN NoRingYet
    SAY ~No ring on <HISHER> hands and no ring in hand. Why are you wasting my time?~
    IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN GreaterAchieve
    SAY ~I want you to bring me a Ring of Protection +1.~
    IF ~~ THEN REPLY ~Why? What do you intend to do with it?~ GOTO WhyDestroyTheRing
END

IF ~~ THEN BEGIN GreaterAchieveNoHaveRing
    SAY ~I want you to bring me a Ring of Protection +1.~
    IF ~~ THEN REPLY ~I do not have such an item.~ GOTO RingNoHave
END

IF ~~ THEN BEGIN RingNoHave
    SAY ~Well then get it. I will be waiting for you here.~
    IF ~~ THEN REPLY ~Fine. I am intrigued by what you want to do with it, though I do hope I will not regret anything.~ DO ~SetGlobal("rqGDRepreJob1","GLOBAL",1)~ EXIT
    IF ~~ THEN REPLY ~No! My precious ring shall not touch your grubby hands!~ GOTO NoVoteThen
    IF ~~ THEN REPLY ~This is quickly becoming uninteresting to me.~ GOTO NoVoteThen
END

IF ~~ THEN BEGIN WhyDestroyTheRing
    SAY ~Destroy it, of course. So, are you willing to sacrifice this trinket for my vote or not?~
    IF ~~ THEN REPLY ~No! I fought hard and long for this, only to give it up for your vote!~ GOTO NoVoteThen
    IF ~~ THEN REPLY ~I do see your point. Take it.~ GOTO VoteGot
    IF ~~ THEN REPLY ~Is there no other choice? I do not wish to destroy my possession, for it would serve no purpose to me.~ GOTO Doubter
END

IF ~~ THEN BEGIN Doubter
    SAY ~I thought I made myself clear. My vote for the destruction of your ring.~
    IF ~~ THEN REPLY ~Alright, take it.~ DO ~TakePartyItem("ring06")~ GOTO VoteGot
    IF ~~ THEN REPLY ~No, I would be a fool to destroy my precious ring!~ GOTO NoVoteThen
END

IF ~~ THEN BEGIN NoVoteThen
    SAY ~Well, you will get no vote from me! Fool!~
    IF ~~ THEN DO
        %IncrementGlobal("rqGDVotes","GLOBAL",-1)
        AddExperienceParty(500)
        EscapeArea()%
        SOLVED_JOURNAL ~Duke of Baldur's Gate: Talvin of Gelfiven vote lost

        I could not let that fool Talvin destroy my ring for his vote. I do not think that I will need all landowner votes anyway.~
    EXIT
END

IF ~~ THEN BEGIN VoteGot
    SAY ~You have passed my test! Here, take back your magic. You have earned my vote. Farewell.~
    IF ~~ THEN DO
        %IncrementGlobal("rqGDVotes","GLOBAL",1)
        GiveItem("ring06",LastTalkedToBy) // Ring of Protection +1
        AddExperienceParty(500)
        EscapeArea()%
        SOLVED_JOURNAL ~Duke of Baldur's Gate: Talvin of Gelfiven vote gained

        Easily gained vote, though I would not have liked it if Talvin had just destroyed my ring.~
    EXIT
END
