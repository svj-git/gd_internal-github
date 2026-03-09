// Ioviis

BEGIN ~rqrepr10~

IF ~Global("rqGDGrandDukeQuest","GLOBAL",1)~ THEN BEGIN Intro10
    SAY ~It is good to finally meet you, <CHARNAME>. My name is Ioviis, and I represent leather workers and certain burghers. Are you interested in the position of Duke of Baldur's Gate?~
    IF ~~ THEN REPLY ~Yes, I am.~ GOTO PriceInterested
    IF ~~ THEN REPLY ~So, what exactly do you wish of me?~ GOTO WishOfMe
    IF ~~ THEN REPLY ~Apologies, I do not want your vote. Farewell.~ GOTO Rejected10
END

IF ~~ THEN BEGIN Rejected10
    SAY ~You have rejected me like this!?~
    IF ~~ THEN DO
        ~IncrementGlobal("rqGDVotes","GLOBAL",-1)
        EscapeArea()~
    EXIT
END

IF ~~ THEN BEGIN PriceInterested
    SAY ~Well, there might be a price attached to it. Still interested?~
    IF ~~ THEN REPLY ~Let's pretend I am interested, tell me the details of your request.~ GOTO WishOfMe
    IF ~~ THEN REPLY ~No, I want nothing from you.~ GOTO Rejected10
END

IF ~~ THEN BEGIN WishOfMe
    SAY ~Several merchants I know have proposed to build a new building for our workers; however, we lack gold for construction. This is where you could come in and rescue us.~
    IF ~~ THEN REPLY ~You want a bribe?~ GOTO Bribe10
    IF ~~ THEN REPLY ~Just tell me how much gold this will cost me.~ GOTO NothingRightNow
    IF ~~ THEN REPLY ~I do appreciate your offer, though I am an adventurer and construction of housing holds no interest to me.~ GOTO NotInterestInProposal
END

IF ~~ THEN BEGIN NotInterestInProposal
    SAY ~Well, that is unfortunate. Farewell.~
    IF ~~ THEN DO
        %IncrementGlobal("rqGDVotes","GLOBAL",-1)
        AddExperienceParty(500)
        EscapeArea()%
        SOLVED_JOURNAL ~Duke of Baldur's Gate: Ioviis Vote lost

        While Ioviis's request sounded innocent enough, I cannot just make promises to everyone.~
    EXIT
END

IF ~~ THEN BEGIN Bribe10
    SAY ~No bribe. We just want a loan from you to help erect our building. You, of course, will get a portion of the profits.~
    IF ~~ THEN REPLY ~Is that all you want from me for your support?~ GOTO AllYouWant
    IF ~~ THEN REPLY ~I agree to this, but we will have to wait and make this deal after I have been elected to the Ducal position.~ GOTO YouWillGetMyVote
END

IF ~~ THEN BEGIN AllYouWant
    SAY ~Yes, we shall discuss further our project after you get elected.~
    IF ~~ THEN REPLY ~If all you want is my promise to invest in your construction, I accept.~ GOTO YouWillGetMyVote
    IF ~~ THEN REPLY ~No, I do not want your vote. Farewell.~ GOTO NotInterestInProposal
END

IF ~~ THEN BEGIN NothingRightNow
    SAY ~Nothing right now. If you get elected, we shall talk about our issue later.~
    IF ~~ THEN DO
        %IncrementGlobal("rqGDVotes","GLOBAL",1)
        AddExperienceParty(500)
        EscapeArea()%
        SOLVED_JOURNAL ~Duke of Baldur's Gate: Ioviis Vote gained

        I have accepted Ioviis's request, as it seemed innocuous enough.~
    EXIT
END

IF ~~ THEN BEGIN YouWillGetMyVote
    SAY ~Then we are in agreement. We shall have further discussions after you get elected.~
    IF ~~ THEN DO
        %IncrementGlobal("rqGDVotes","GLOBAL",1)
        AddExperienceParty(500)
        EscapeArea()%
        SOLVED_JOURNAL ~Duke of Baldur's Gate: Ioviis Vote gained

        I have accepted Ioviis's request, as it seemed innocuous enough.~
    EXIT
END
