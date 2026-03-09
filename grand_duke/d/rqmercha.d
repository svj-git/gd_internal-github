BEGIN ~rqmerc01~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN MerchantIntro1
    SAY ~Welcome to my shop, my dear friend. Why don't you stop for a while and marvel at the wonders I have collected just for you?~
    IF ~CheckStatGT(LastTalkedToBy,7,INT)~ THEN REPLY ~Sure, show me what you have for sale.~ GOTO StartShop
    IF ~CheckStatLT(LastTalkedToBy,7,INT)~ THEN REPLY ~Can you talk slower? I no understand what you just say.~ GOTO Stupid
    IF ~~ THEN REPLY ~I do not wish anything from you. Farewell.~ EXIT
END

IF ~~ THEN BEGIN StartShop
    SAY ~Excellent! I am sure you won't be disappointed.~
    IF ~~ THEN DO ~StartStore("rqstor01",LastTalkedToBy())~ EXIT
END

IF ~~ THEN BEGIN Stupid
    SAY ~*Sigh* I show wares. You pick what you need. Then you give me gold.~
    IF ~~ THEN DO ~StartStore("rqstor01",LastTalkedToBy())~ EXIT
END

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN MoreOfTheSame
    SAY ~Welcome to my store again! I am certain that my excellent and prized items have caught your attention.~
    IF ~CheckStatGT(LastTalkedToBy,7,INT)~ THEN REPLY ~Yes, show me your wares..~ GOTO StartShop2
    IF ~CheckStatLT(LastTalkedToBy,7,INT)~ THEN REPLY ~You talk much. Show me wares.~ GOTO Stupid2
    IF ~~ THEN REPLY ~I do not wish anything from you. Farewell.~ EXIT
END

IF ~~ THEN BEGIN StartShop2
    SAY ~Ha! I knew that your purse was begging to be lightened.~
    IF ~~ THEN DO ~StartStore("rqstor01",LastTalkedToBy())~ EXIT
END

IF ~~ THEN BEGIN Stupid2
    SAY ~One of these days, one of these days...~
    IF ~~ THEN DO ~StartStore("rqstor01",LastTalkedToBy())~ EXIT
END

BEGIN ~rqmerc02~

IF ~AreaCheck("AR0704")~ THEN BEGIN BG2IntroMerchant
    SAY ~Greetings, honored customer. Welcome back to my store.~
    IF ~~ THEN REPLY ~Ah yes, why don't you show me your wares then?~ GOTO StartShop3
    IF ~~ THEN REPLY ~I have no time to speak to you, merchant. Farewell.~ GOTO NoTime
END

IF ~~ THEN BEGIN StartShop3
    SAY ~Ha! I knew that your purse was begging to be lightened.~
    IF ~~ THEN DO ~StartStore("rqstor02",LastTalkedToBy())~ EXIT
END

IF ~~ THEN BEGIN NoTime
    SAY ~Have a fine <DAYNIGHT> and maybe visit me next time.~
    IF ~~ THEN EXIT
END

