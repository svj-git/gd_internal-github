BEGIN ~rqbofist~

IF ~Global("rqGDRepreJob4","GLOBAL",0)~ THEN BEGIN IntroBoFist0
  SAY ~Greetings citizen. What can Flaming Fist do for you?~
  IF ~~ THEN EXIT
END

IF ~GlobalGT("rqGDRepreJob4","GLOBAL",1)~ THEN BEGIN IntroBoFist1
  SAY ~Greetings citizen. What can Flaming Fist do for you?~
  IF ~~ THEN EXIT
END

IF ~Global("rqGDRepreJob4","GLOBAL",1)
  Global("rqGDRepreJob4BountyRej","GLOBAL",0)
  Global("rqGDGrothukEscape","GLOBAL",0)
  Global("rqGDGrothukDead","GLOBAL",0)~ THEN BEGIN IntroBoFist2
  SAY ~Greetings. I am a Bounty Officer for Flaming Fist. What do you wish of me?~
  IF ~~ THEN REPLY ~Gvalas the merchant has spoken to me. He wishes to exact revenge on certain Gro'Thuk. Can you confirm his crime of murder, Gvalas' son Firthof?~ GOTO RevengeGvalas
  IF ~~ THEN REPLY ~I would like to know more about certain Gro'Thuk.~ DO ~SetGlobal("rqGDGroThukSmart","GLOBAL",1)~ GOTO WhoIsGroThuk
  IF ~~ THEN REPLY ~Can you tell me where I could find this Gro'Thuk?~ GOTO GroThukFind
END

IF ~~ THEN BEGIN RevengeGvalas
  SAY ~Citizen, this matter is best to be solved by Fist. Gro'Thuk is a killer, and I do not want any citizen of this city subjected to violence.~
  IF ~~ THEN REPLY ~Do not worry about us. We can certainly handle Gro'Thuk.~ GOTO TooInterested
  IF ~~ THEN REPLY ~So, where do I find him?~ GOTO GroThukFind
END

IF ~~ THEN BEGIN WhoIsGroThuk
  SAY ~Well, I can tell you that Gro'Thuk is smart and has an eloquent silver tongue, so he is clearly clever. Do not underestimate him.~
  IF ~~ THEN REPLY ~Yes, but is he a criminal?~ GOTO GrothukCriminal
  IF ~~ THEN REPLY ~But has he been involved in the murder of Firthof, son of merchant Gvalas?~ GOTO FirthofInvolvement
  IF ~~ THEN REPLY ~You seem to be well informed about this Gro'Thuk, yet strangely, you are unable to capture him.~ GOTO TooInterested
END

IF ~~ THEN BEGIN GrothukCriminal
  SAY ~If you must know, his personal effects were found near the corpse of a farmer.~
  IF ~~ THEN REPLY ~So, does that mean there is a reward on his head?~ GOTO RewardOnGrothukHead
  IF ~~ THEN REPLY ~What do you know about Firthof's murder?~ GOTO FirthofInvolvement
  IF ~~ THEN REPLY ~I do not think I need to know more.~ GOTO TooInterested
END

IF ~~ THEN BEGIN FirthofInvolvement
  SAY ~I do not know anything about Gro'Thuk's involvement in Firthof's murder, but we want to apprehend Gro'Thuk for the murder of a peasant.~
  IF ~~ THEN REPLY ~So, could I just make him leave this world, and would the Fist reward me?~ GOTO TooInterested
  IF ~~ THEN REPLY ~Could you tell me how Gvalas could have developed his suspicion about Gro'Thuk?~ GOTO DoubleBounty
END

IF ~~ THEN BEGIN DoubleBounty
  SAY ~If I knew that, I would double his bounty. Either way...~
  IF ~~ THEN GOTO GroThukFind
END

IF ~~ THEN BEGIN RewardOnGrothukHead
  SAY ~There is a reward of 200 gold for bringing Gro'Thuk to justice.~
  IF ~~ THEN GOTO TooInterested
END

IF ~~ THEN BEGIN GroThukFind
  SAY ~I do not know the whereabouts of Gro'Thuk. If I did, I would have already sent the Fist to get him.~
  IF ~~ THEN GOTO TooInterested
END

IF ~~ THEN BEGIN TooInterested
    SAY ~You seem to be too interested in him. Listen: kill Gro'Thuk and bring me proof of his demise. The bounty for such an act is 200 gold.~
    IF ~~ THEN REPLY ~I am not interested in working for Flaming Fist for such a paltry sum.~ DO ~SetGlobal("rqGDRepreJob4BountyRej","GLOBAL",1)~ EXIT
    IF ~~ THEN REPLY ~Fine, I shall get you his head.~ GOTO AgreementThen
    IF ~~ THEN REPLY ~Heads will roll, and one might just land in your hands.~ GOTO AgreementThen
END

IF ~~ THEN BEGIN AgreementThen
    SAY ~We are in agreement then.~
    IF ~~ THEN EXIT
END

IF ~Global("rqGDRepreJob4","GLOBAL",1)
    Global("rqGDRepreJob4BountyRej","GLOBAL",1)
    !Dead("rqgroth")
    Global("rqGDGrothukDead","GLOBAL",0)~ THEN BEGIN RejectedFirstTime
    SAY ~What do you want from Fist now?~
    IF ~~ THEN REPLY ~I have reconsidered your offer. Where can I find this Gro'Thuk?~ GOTO GvalasKnowFirthof
    IF ~~ THEN REPLY ~Nothing, officer. Farewell.~  GOTO BeOnYourWayThen
END

IF ~~ THEN BEGIN GvalasKnowFirthof
    SAY ~No, I do not know where he could be found, but if you find him, kill him, and bring proof of his death to me.~
    IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN BeOnYourWayThen
    SAY ~Be on your way then.~
    IF ~~ THEN EXIT
END

IF ~Global("rqGDRepreJob4","GLOBAL",1)
    !PartyHasItem("rqhead01")
    Dead("rqgroth")~ THEN BEGIN NoProofG
    SAY ~I see that you have no proof. No head, no gold; we both know that.~
    IF ~~ THEN EXIT
END

IF ~Global("rqGDRepreJob4","GLOBAL",1)
    PartyHasItem("rqhead01")
    Dead("rqgroth")~ THEN BEGIN HaveProofG
    SAY ~One less vile half-orc will make our city safer overall. Thank you. Here is your 200 gold.~
    IF ~~ THEN DO ~GiveGoldForce(200)~ EXIT
END

// Grael interjecting to Trest's command
IF ~~ THEN BEGIN NotAuthorized
    SAY ~You do not have the authority to do that, Trest.~
    IF ~~ THEN EXTERN ~rqtrest~ Grael11
END

