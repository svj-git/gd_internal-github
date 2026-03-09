BEGIN ~rqbro25~

IF ~Global("rqGDBrokSummoned","GLOBAL",1)~ THEN Brokkrsummon
SAY ~Eh, <CHARNAME>? What in the fiery pits is goin' on 'ere? What do ye want, ye scrawny whelp?~
    IF ~~ THEN REPLY ~Scrawny whelp eh? Do want to be stuck here?~ DO ~SetGlobal("rqGDBrokSummoned","GLOBAL",2)~ GOTO BrokkrHelpMe
    IF ~~ THEN REPLY ~I have need of your dwarven fortitude and your fighting skills.~ DO ~SetGlobal("rqGDBrokSummoned","GLOBAL",2)~ GOTO BrokkrNeedYourSkills
END

IF ~~ BrokkrNeedYourSkills
SAY ~Aye, I can provide that, but ye best not be meddlin' in me side quests, or it'll be the last thing ye do.~
    IF ~~ THEN REPLY ~Tell who is against you and what is required of me.~ GOTO WhatSideQuest
END

IF ~~ WhatSideQuest
SAY ~Dark pact that brought me up is now turnin' on me, and I might need yer sorry hide to get out of this mess. My accursed *family* might wanna see me dead. It's a right tangled mess, so if ye wanna know more, best keep yer ears peeled. They'll be settin' an ambush, I swear it.~
    IF ~~ THEN REPLY ~Ambush you say, You better pull your weight then if you want protection.~ GOTO BrokkrJoinMe
    IF ~~ THEN REPLY ~Fine ill deal with you later.~ GOTO BrokkrJoinMe
END

IF ~~ BrokkrHelpMe
SAY ~*Turns around with a sneer* Bah! Maybe not. What wicked plan are ya hatchin', then?~
    IF ~~ THEN GOTO BrokkrJoinMe
END

IF ~~ BrokkrJoinMe
SAY ~Hah! Should I be sharin' my axe with ye, or what?~
    IF ~~ THEN REPLY ~Yes join me.~ DO ~JoinParty()~ EXIT
    IF ~~ THEN REPLY ~No just yet. Wait here for while.~ DO ~MoveToPointNoInterrupt([1854.1639])~ EXIT
END

IF ~Global("rqGDBrokSummoned","GLOBAL",2)~ Brokkrsummoned2
SAY ~Yeh want me to join or what?~
    IF ~~ THEN REPLY ~Yes do join me.~ DO ~JoinParty()~ EXIT
    IF ~~ THEN REPLY ~No not yet.~ EXIT
END

BEGIN ~rqbro25P~

IF ~Global("rqGDBrokKickedOut","LOCALS",0)~ THEN BEGIN ToLeaveOrNotBrokkr
  SAY ~Ah, ye wanna toss me outta yer blasted party, eh?~
  IF ~~ THEN REPLY ~No, it was a mistake.~ DO ~SetGlobal("rqGDBrokKickedOut","LOCALS",0)
      JoinParty()~ EXIT
  IF ~AreaCheck("AR4500")~ THEN REPLY ~Wait here for now.~ DO ~SetGlobal("rqGDBrokKickedOut","LOCALS",1)
      MoveToPointNoInterrupt([1854.1639]) Face(0)~ GOTO WaitHereBrok
  IF ~!AreaCheck("AR4500")
      !AreaCheck("AR4000")
      !AreaCheck("AR6200")~ THEN REPLY ~I shall send you to pocket plane wait for me there.~ DO ~SetGlobal("rqGDBrokKickedOut","LOCALS",1)
      CreateVisualEffectObject("SPDIMNDR",Myself)
      Wait(2)
      MoveBetweenAreas("AR4500",[1854.1639],0)
        ~ EXIT
  IF ~!AreaCheck("AR4500")
      !AreaCheck("AR4000")
      !AreaCheck("AR6200")~ THEN REPLY ~Stay here Brokkr.~ DO ~SetGlobal("rqGDBrokKickedOut","LOCALS",1)~ GOTO WaitHereBrok
END

IF ~Global("rqGDBrokKickedOut","LOCALS",1)~ THEN BEGIN KickedOutRevisited
  SAY ~I've been hangin' 'round here far too long, ye know. Gimme a spot in yer crew. This place's safe enough from me foes, but I don't fancy bein' safe inside some damn dungeon.~
  IF ~~ THEN REPLY ~Yes lets go.~ DO ~SetGlobal("rqGDBrokKickedOut","LOCALS",0) JoinParty()~ EXIT
  IF ~~ THEN REPLY ~No just stay here.~ GOTO BoredomBrok
END

IF ~~ THEN BEGIN BoredomBrok
  SAY ~From one filthy rat nest to another cursed abyss, what luck I got... worthless scum.~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN WaitHereBrok
  SAY ~He summons me out, then deserts me like a blasted wraith, leavin' me to fade into the bloody shadows!~
  IF ~~ THEN EXIT
END

// Trash talk with companions
BEGIN ~rqbro25J~

// Volo interaction
IF ~~ THEN BEGIN BrokkrAnswerToVolo
    SAY ~Aye, ye got that right, ye scribblin' soft-handed fool. But next time, ye gotta come to me direct, aye? I can help ye better than yer feeble mind can dream. But it'll cost ye, hefty enough, eh? Hehe.~
    IF ~~ THEN EXTERN ~SARVOLO~ 9
END

IF ~~ THEN TaskFromMalzoth
    SAY ~Hah! You puny demon fly, catch it if ye can!~
    IF ~~ THEN EXTERN ~rqmalim2~  ImpDeminDeadNoAxe
END

IF ~~ THEN TaskFromMalzothAxe
    SAY ~Hark, impish filth! Here be me axe, ye scrawny little devil. Best ye scurry back and return it, or I’ll carve ye up with me torture’s craft, ye fiendish worm!~
    IF ~~ THEN EXTERN ~rqmalim2~  ImpDeminDeadAxe
END

IF ~~ THEN TaskFromMalzothFailed
    SAY ~I ain't got yer stinkin' filth now, so scram before I crush ya!~
    IF ~~ THEN EXTERN ~rqmalim2~ HaveProofDeminAliveFailed
END

// InParty prattle
CHAIN IF ~InParty("Cernd")
        See("Cernd")
        !StateCheck("Cernd",STATE_SLEEPING)
        Global("rqGDBrokCernd","LOCALS",0)~ THEN rqbro25J brokkrcerndtrash
    ~Hark ye, Bark arse-wiper! I've got a word with ye, and ye'd best listen.~
DO ~SetGlobal("rqGDBrokCernd","LOCALS",1)~
== BCERND ~*Sighs* Hopefully it's not just another rash you have developed, Brokkr.~
== rqbro25J ~Nay, ye druid-stinking rat-tail pasta-eater. I'm talkin' o' me right eye. Take a look an' see if there's aught in it, ye bleedin' fool.~
== BCERND ~Pull your eyelids with your finger and let me see.~
== BCERND ~No, I don't see anything. Just stop rubbing your eyes and you'll be fine. I could make you a salve which would soothe it, but alas, at this time of year i cannot do anything.~
== rqbro25J ~Haar! Best ye don't be swipin' me potion, ye scrawny damp-spawn. Who knows what cursed side effects'll spill from it?~
== BCERND ~Has anyone told you that you have the most unnatural eyes for a dwarf? I'm surprised I only noticed it just now upon closer inspection.~
== rqbro25J ~Aye, me mother gave 'em to me. Go bother her about me eyes.~
== BCERND ~Your mother was she a Shield Dwarf?~
== rqbro25J ~Hush now, druid, ye'd best keep yer gob shut, or ye'll be eatin' soup solely with broken arms as yer spoons.~
EXIT

CHAIN IF ~InParty("Edwin")
        See("Edwin")
        !StateCheck("Edwin",STATE_SLEEPING)
        Global("rqGDBrokEdwin","LOCALS",0)~ THEN rqbro25J brokkredwintrash
    ~Oi, Spellfizzler, you got any thought o' enchantin' still? I'm lookin' to haul meself back to the forge, doin' custom work again. Nobles pay the iron price for good smithin', that's the truth. I've still got a few rusty-but-useful contacts in Waterdeep. You interested, or ye got a squeaky excuse for a respondin' tongue?~
DO ~SetGlobal("rqGDBrokEdwin","LOCALS",1)~
== BEDWIN ~(Half-wit with a monkey thinks that I should be wasting my time enchanting iron for gold when I could storm the Tower of Dis and demand a king's ransom.) I suppose I could entertain your inane query for the sake of research.~
== rqbro25J ~Gold, fame, favors from those Waterdevian nobles what's not to like? With gold in yer grip, ye can grind any treacherous plot into real guts and bones.~
== BEDWIN ~(I am constantly left wondering if everyone except me is afflicted by mind fog.) Listen, dwarf, why don't you offer your enchanting to some hedge wizard in Athkatla? I have much more important plans to accomplish. (They will come much quicker if I they  will cease to fatigue my mind with their bruit.)~
EXIT

CHAIN IF ~InParty("Imoen")
        See("Imoen")
        !StateCheck("Imoen",STATE_SLEEPING)
        Global("rqGDBrokImoen","LOCALS",0)~ THEN BIMOEN2 brokkrimoentrash
    ~Brokkr, be me name, aye, and I spit threats at every word on everyone. fire. Har har har.~
DO ~SetGlobal("rqGDBrokImoen","LOCALS",1)~
== BIMOEN2 ~Hows that for an impression?~
== rqbro25J ~Ya blasted dolt! Why in the seven hammered hammers don't ye scuttle off to yer <BROTHERSISTER> and leave me be, ye immature boygirl.~
== BIMOEN2 ~No fun at all.~
EXIT

CHAIN IF ~InParty("Jan")
        See("Jan")
        !StateCheck("Jan",STATE_SLEEPING)
        Global("rqGDBrokJansen","LOCALS",0)~ THEN BJAN25 brokkrjantrash
    ~So, my friend, how does your quest to get your grubby mitts on every bit of treasure in Amn go?~
DO ~SetGlobal("rqGDBrokJansen","LOCALS",1)~
== rqbro25J ~Yawn, ye pint-sized troublemaker, are ye talkin' to me, gnome, or am I wastin' me breath?~
== BJAN25 ~I had not thought that gold could impair the thinking facilities of our poor Borkie, but I guess in our times anything is possible.~
== rqbro25J ~If yer damned spells hadn't proved useful, I'd've heaved yer scrawny hide into some deep, dark ditch and left ye to rot.~
== BJAN25 ~Such eloquent tongue you have there, Borkie. Now do tell us more...~
== rqbro25J ~I've had me fill o' yer blasted garbage, gnome. Cease thy yammerin' or I'll bash yer teeth in and toss ye down the shaft!~
== BJAN25 ~Whoa, you might just do that... I shall leave you be.~
EXIT

CHAIN IF ~InParty("HaerDalis")
        See("HaerDalis")
        !StateCheck("HaerDalis",STATE_SLEEPING)
        Global("rqGDBrokHaerDalis","LOCALS",0)~ THEN BHAERD25 haerdalisbrokktrash
    ~The more we travel together, the more I observe that there is much more to you than meets the eye, my faithless hound.~
DO ~SetGlobal("rqGDBrokHaerDalis","LOCALS",1)~
== rqbro25J ~There ain't nuthin' spike on the back o' me axe could not fix, bard.~
== BHAERD25 ~For a while, that grand drapery made out threats obstructed me, but now it looks more like the city of Sigil pierced by thousands of portals.~
== rqbro25J ~Yer flashy prattle ain't worth a pickin' copper to me. Drag yerself off and fetch a sewer rat, aye; maybe he'll savor yer screechin' more than I do.~
== BHAERD25 ~Your secrets will be discovered sooner or later, Brokkr. I just hope that they will not harm us or <CHARNAME>.~
== rqbro25J ~Ye or <CHARNAME> have nary a thing to dread from me or my foes. So hush yer mouth, and put that tongue of yers to better use, lap up to some noble's backside.~
== BHAERD25 ~I have no confidence in your words, Brokkr... as do you.~
EXIT

CHAIN IF ~InParty("Korgan")
        See("Korgan")
        !StateCheck("Korgan",STATE_SLEEPING)
        Global("rqGDBrokKorgan","LOCALS",0)~ THEN BKORGA25 korganbrokkrtrash
    ~Brokkr, have ye been thinkin' 'bout what yer gonna be doin' after <CHARNAME>'s destiny be fulfilled, eh?~
DO ~SetGlobal("rqGDBrokKorgan","LOCALS",1)~
== rqbro25J ~The forge-fires call to me. Aye, I feel their heat in me bones. Might be I'll answer. Might be I'll gather a band of sell-swords instead and make a proper name for meself. The path's still clouded in stone-dust, I'll grant ye that. But mark my words, and mark 'em well: I'll be steerin' a wide, wide berth around any o' those cursed Bloodaxe scum.~
== rqbro25J ~Bah! I've a score to settle in me own heart. This ain't a wish, it's a vow. It gets done, or I break upon it.~
== BKORGA25 ~I donnae' what yer schemin'... but if there's good killin' to be had, count me axe in!~
== rqbro25J ~Hmph. Then maybe I'll be callin' on yer axe. *Spits* But don't be countin' on it, stone-nose.~
EXIT

CHAIN IF ~InParty("Sarevok")
        See("Sarevok")
        !StateCheck("Sarevok",STATE_SLEEPING)
        Global("rqGDBrokSarevok","LOCALS",0)~ THEN BSAREV25 sarevokbrokktrash
    ~Dwarf, have a look at my leg armor. I would like you to either widen it or put more padding in it.~
DO ~SetGlobal("rqGDBrokSarevok","LOCALS",1)~
== rqbro25J ~Hmph! Ye lookin' at me like I'm yer clan's smith? Bah! Fix it yerself, ya slab o' muscle! Ain't ye strong enough?~
== BSAREV25 ~Of all the people who follow <CHARNAME>, I do not understand why you are here, Dwarf, and that question burns me like Abyssal fire.~
== rqbro25J ~So, ye turncoat, from mortal enemy in Baldur's Gate to now guardin' <CHARNAME>? Fool's gold's more honest than yer treacherous words, ye rat.~
== BSAREV25 ~Dwarf, when your benefactors arise to claim whatever they wish from you, it will also be my problem. Are we understood here?~
== rqbro25J ~Aye, it be a clear, finely hewn diamond, Sarevok.~
EXIT

CHAIN IF ~InParty("Viconia")
        See("Viconia")
        !StateCheck("Viconia",STATE_SLEEPING)
        Global("rqGDBrokViconia","LOCALS",0)~ THEN BVICON25 viconiabrokkrtrash
    ~They say that drow who have grown up on the surface have much better eyesight in daylight. Yours seems most unadjusted to the sunblighted surface, as is mine.~
DO ~SetGlobal("rqGDBrokViconia","LOCALS",1)~
== rqbro25J ~What's this, ye sneakin' drow? I don't buy yer drivel. Take yer blasted wisdom and cram it up yer dark hole where the sun ain't never shinin'!~
== BVICON25 ~Hit a gold vein, did I, Hargluk? Your rage is certainly betraying your inner thoughts.~
== rqbro25J ~Bah! I, with me fury, shouteh loud for all to hear betrayin' naught but me own wrath! Ye, ye're just fishin' in an empty pond, aye, wastin' yer time, ya scrawny drow!~
== BVICON25 ~Be on your guard, dwarf, because treason has its own very painful reward.~
EXIT


BEGIN ~rqdwiz02~

IF ~Global("rqGDBG2MalzothKnowName","GLOBAL",1)~ THEN BEGIN EnchanterIntro
    SAY ~<CHARNAME>. Pleasantries. My name is Zhar'kyl Vhaeril, and it is my pleasure to be a mage sent by Malzoth to make a trade with you. Shall we proceed? Do you have what Malzoth had required of you?~
    IF ~PartyHasItem("rqproof6") PartyHasItem("rqproof5")~ THEN REPLY ~I have both the map of Suldanesselar and proof of Demin's demise.~ DO ~TakePartyItem("rqproof6") TakePartyItem("rqproof5")~ GOTO DoneDeal
    IF ~PartyHasItem("rqproof6")~ THEN REPLY ~I have the map of Suldanesselar as you requested.~ DO ~TakePartyItem("rqproof6")~ GOTO DoneDeal
    IF ~PartyHasItem("rqproof5")~ THEN REPLY ~I have the Holy Stone that belonged to Demin.~ DO ~TakePartyItem("rqproof5")~ GOTO DoneDeal
    IF ~!PartyHasItem("rqproof5")~ THEN REPLY ~I must have misplaced the proof you want.~ GOTO NoProof
END

IF ~Global("rqGDBG2MalzothKnowName","GLOBAL",0)~ THEN BEGIN EnchanterIntroNoName
    SAY ~Surfacer, I am a mage sent by Malzoth to make a deal with you. Let's make this sun-soiled event as short as possible, surfacer. Captain Malzoth has told me that you are supposed to provide me with certain proof of deed.~
    IF ~PartyHasItem("rqproof6") PartyHasItem("rqproof5")~ THEN REPLY ~I have both the map of Suldanesselar and proof of Demin's demise.~ DO ~TakePartyItem("rqproof6") TakePartyItem("rqproof5")~ GOTO DoneDeal
    IF ~PartyHasItem("rqproof6")~ THEN REPLY ~I have the map of Suldanesselar as you requested.~ DO ~TakePartyItem("rqproof6")~ GOTO DoneDeal
    IF ~PartyHasItem("rqproof5")~ THEN REPLY ~I have the Holy Stone that belonged to Demin.~ DO ~TakePartyItem("rqproof5")~ GOTO DoneDeal
    IF ~!PartyHasItem("rqproof5")~ THEN REPLY ~I must have misplaced the proof you want.~ GOTO NoProof
END

IF ~~ THEN BEGIN DoneDeal
    SAY ~Let me see... It seems authentic... now to fulfill our part, If you own one of weapons I will enchant your one or two artifacts which you should own.~
    IF ~PartyHasItem("rqhamm03")~ THEN GOTO HaveHammer
    IF ~PartyHasItem("rqaxe02")~ THEN GOTO HaveAxe
    IF ~PartyHasItem("rqaxe02") PartyHasItem("rqhamm03")~ THEN GOTO HaveAxeHammer
    IF ~!PartyHasItem("rqaxe02") !PartyHasItem("rqhamm03")~ THEN GOTO HaveNone
END

IF ~~ THEN BEGIN HaveAxeHammer
    SAY ~I will further enchant both Sofn and Hindra. Just wait here a while I perform the necessary incantations to make your weapon truly a weapon for gods.~
    IF ~~ THEN DO
        ~TakePartyItem("rqaxe02")
        TakePartyItem("rqhamm03")
        CreateVisualEffect("spcrtwpn",[217.1400])
        GiveItemCreate("rqhamm04",LastTalkedToBy,0,0,0)
        GiveItemCreate("rqaxe04",LastTalkedToBy,0,0,0)~ GOTO FinalFarewell
END

IF ~~ THEN BEGIN HaveAxe
    SAY ~I will further enchant your axe, Hindra. Just wait here a while while I perform the necessary incantations to make your weapon truly a weapon for gods.~
    IF ~~ THEN DO
        ~TakePartyItem("rqaxe02")
        CreateVisualEffect("spcrtwpn",[217.1400])
        GiveItemCreate("rqaxe04",LastTalkedToBy,0,0,0)~ GOTO FinalFarewell
END

IF ~~ THEN BEGIN HaveHammer
    SAY ~I will further enchant your hammer, Sofn. Just wait here a while I perform the necessary incantations to make your weapon truly a weapon for gods.~
    IF ~~ THEN DO
        ~TakePartyItem("rqhamm03")
        CreateVisualEffect("spcrtwpn",[217.1400])
        GiveItemCreate("rqhamm04",LastTalkedToBy,0,0,0)~ GOTO FinalFarewell
END

IF ~~ THEN BEGIN HaveNone
    SAY ~I cannot detect any of Vargs enchanted items... so that means... Damn it but better my magic than my life. Here, take it, blasted surfacer. May you stab your... I misspoke, honored surfacer. Here is the finest artifact that I have ever seen. May it serve you well.~
    IF ~~ THEN DO
            ~GiveItem("rqletmal", LastTalkedToBy)
            GiveItem("rqmisc04", LastTalkedToBy)
            GiveItem("rqmisc05", LastTalkedToBy)
            DisplayStringHead(Myself,23357)
            ReallyForceSpell(Myself,DRYAD_TELEPORT)~
        EXIT
END

IF ~~ THEN BEGIN NoProof
    SAY ~Are you foolish enough to appear here without proof to receive a reward? Your head must be as empty as the skies of your land.~
    IF ~~ THEN DO
        %SetInterrupt(FALSE)
            DisplayStringHead(Myself,23357)
            ReallyForceSpell(Myself,DRYAD_TELEPORT)
        EraseJournalEntry(~Brokkr's family: Accepted the invitation to to parlay with Drow

        Looks like my companion Brokkr have been brought up by the drow and he admitted that he worked for them though he claimed he does no longer serves them. The drow contacted him again I think it would better to speak to drow to ascertain their goals with Brokkr. We are supposed to meet in Forest of Tethyr.~)
        EraseJournalEntry(~Brokkr's family: Spy in Suldanesselar accepted

            I have met the drow *foster father* of Brokkr, and no love has been lost between the two. Though I have accepted his request to map Suldanesselar's defences.~)
        EraseJournalEntry(~Brokkr's family: Spy in Suldanesselara and kill Demin

            I have met the drow *foster father* of Brokkr, and no love has been lost between the two. Though I have accepted his request to map Suldanesselar's defences and to assassinate Priestess Demin.~)
            %
            SOLVED_JOURNAL ~Brokkr's family: Spy in Suldanesselar failed

            I have failed; I somehow misplaced the required proof, and without it, Malzoth's fiend has refused to give me my reward.~
        EXIT
END

IF ~~ THEN BEGIN FinalFarewell
    SAY ~Aluve, surfacer. May our paths never cross again.~
    IF ~~ THEN DO
            %GiveItem("rqletmal", LastTalkedToBy)
            SetInterrupt(FALSE)
            DisplayStringHead(Myself,23357)
            ReallyForceSpell(Myself,DRYAD_TELEPORT)
        EraseJournalEntry(~Brokkr's family: Accepted the invitation to to parlay with Drow

        Looks like my companion Brokkr have been brought up by the drow and he admitted that he worked for them though he claimed he does no longer serves them. The drow contacted him again I think it would better to speak to drow to ascertain their goals with Brokkr. We are supposed to meet in Forest of Tethyr.~)
        EraseJournalEntry(~Brokkr's family: Spy in Suldanesselar accepted

            I have met the drow *foster father* of Brokkr, and no love has been lost between the two. Though I have accepted his request to map Suldanesselar's defences.~)
        EraseJournalEntry(~Brokkr's family: Spy in Suldanesselara and kill Demin

            I have met the drow *foster father* of Brokkr, and no love has been lost between the two. Though I have accepted his request to map Suldanesselar's defences and to assassinate Priestess Demin.~)
            %
            SOLVED_JOURNAL ~Brokkr's family: Spy in Suldanesselar finished

            Looks like Malzoth has asked around and is no longer brave enough to meet me in person. Whatever, I got my reward.~
        EXIT
END

// Malzoths Imp maps only
BEGIN ~rqmalim1~

IF ~Global("rqGDBG2BrokSpying","GLOBAL",3)~ THEN BEGIN ProofOfDeath
    SAY ~Have you... have you done the task that... that my master Malzoth... Malzoth has set before you, Brokkr?~
    IF ~PartyHasItem("rqproof6")~ THEN REPLY ~Yes she dead i have the proofs right here.~ GOTO HaveProofDeminAlive
    IF ~!PartyHasItem("rqproof6")~ THEN REPLY ~I don't have it.~ GOTO ImpDeminDeadNoProof
END

IF ~~ THEN BEGIN HaveProofDeminAlive
    SAY ~A-as ins-tructed by my M-mast-ter Malzoth, I am tra-ansfer-ring to you own-ership of the-se items.~
    IF ~~ THEN DO
        %GiveItem("rqhamm03", "rqbro")
        GiveItem("rqletmal", "rqbro")
        CreateVisualEffectObject("ICFIRSDI",Myself)
        TakePartyItem("rqproof6")
        DestroySelf()
        EraseJournalEntry(~Brokkr's family: Accepted the invitation to to parlay with Drow

        Looks like my companion Brokkr have been brought up by the drow and he admitted that he worked for them though he claimed he does no longer serves them. The drow contacted him again I think it would better to speak to drow to ascertain their goals with Brokkr. We are supposed to meet in Forest of Tethyr.~)
        EraseJournalEntry(~Brokkr's family: Spy in Suldanesselar accepted

            I have met the drow *foster father* of Brokkr, and no love has been lost between the two. Though I have accepted his request to map Suldanesselar's defences.~)
        EraseJournalEntry(~Brokkr's family: Spy in Suldanesselara and kill Demin

            I have met the drow *foster father* of Brokkr, and no love has been lost between the two. Though I have accepted his request to map Suldanesselar's defences and to assassinate Priestess Demin.~)
            %
        SOLVED_JOURNAL ~Brokkr's family: Spy in Suldanesselar finished

        Looks like Malzoth has asked around and is no longer brave enough to meet me in person. Whatever, I got my reward.~
    EXIT
END

IF ~~ THEN BEGIN ImpDeminDeadNoProof
    SAY ~Witout proo... proof, Nooo... Reward!~
    IF ~~ THEN DO
        %CreateVisualEffectObject("ICFIRSDI",Myself)
        DestroySelf()
        EraseJournalEntry(~Brokkr's family: Accepted the invitation to to parlay with Drow

        Looks like my companion Brokkr have been brought up by the drow and he admitted that he worked for them though he claimed he does no longer serves them. The drow contacted him again I think it would better to speak to drow to ascertain their goals with Brokkr. We are supposed to meet in Forest of Tethyr.~)
        EraseJournalEntry(~Brokkr's family: Spy in Suldanesselar accepted

            I have met the drow *foster father* of Brokkr, and no love has been lost between the two. Though I have accepted his request to map Suldanesselar's defences.~)
        EraseJournalEntry(~Brokkr's family: Spy in Suldanesselara and kill Demin

            I have met the drow *foster father* of Brokkr, and no love has been lost between the two. Though I have accepted his request to map Suldanesselar's defences and to assassinate Priestess Demin.~)
        %
        SOLVED_JOURNAL ~Brokkr's family: Spy in Suldanesselar finished

        I have failed; I somehow misplaced the required proof, and without it, Malzoth's fiend has refused to give me my reward.~
    EXIT
END

// Malzoth Demin dead
BEGIN ~rqmalim2~
// Low IQ conversation with stupid imp
IF ~Global("rqGDBG2BrokSpying","GLOBAL",3)~ THEN BEGIN BrokksTask
    SAY ~My ma... ma... master Malzoth ask you to... to give proof that priestess Demin is gone, and... and, uh, maps of Sulda... Suldanesselar.~
    IF ~PartyHasItem("rqproof6") PartyHasItem("rqproof5")~ THEN EXTERN ~rqbro25J~ TaskFromMalzoth
    IF ~PartyHasItem("rqproof6") PartyHasItem("rqproof5") PartyHasItem("rqaxe02")~ THEN EXTERN ~rqbro25J~ TaskFromMalzothAxe
    IF ~PartyHasItem("rqproof6") PartyHasItem("rqproof5") !PartyHasItem("rqaxe02")~ THEN EXTERN ~rqbro25J~ TaskFromMalzoth
    IF ~!PartyHasItem("rqproof6") !PartyHasItem("rqproof6")~ THEN EXTERN ~rqbro25J~ TaskFromMalzothFailed
    IF ~!PartyHasItem("rqproof6") PartyHasItem("rqproof6")~ THEN EXTERN ~rqbro25J~ TaskFromMalzothFailed
    IF ~PartyHasItem("rqproof6") !PartyHasItem("rqproof6")~ THEN EXTERN ~rqbro25J~ TaskFromMalzothFailed
END

IF ~~ THEN BEGIN HaveProofDeminAliveFailed
    SAY ~No prrof, no rewarrds, fools!~
    IF ~~ THEN DO
        %CreateVisualEffectObject("ICFIRSDI",Myself)
        DestroySelf()
        EraseJournalEntry(~Brokkr's family: Accepted the invitation to to parlay with Drow

        Looks like my companion Brokkr have been brought up by the drow and he admitted that he worked for them though he claimed he does no longer serves them. The drow contacted him again I think it would better to speak to drow to ascertain their goals with Brokkr. We are supposed to meet in Forest of Tethyr.~)
        EraseJournalEntry(~Brokkr's family: Spy in Suldanesselar accepted

            I have met the drow *foster father* of Brokkr, and no love has been lost between the two. Though I have accepted his request to map Suldanesselar's defences.~)
        EraseJournalEntry(~Brokkr's family: Spy in Suldanesselara and kill Demin

            I have met the drow *foster father* of Brokkr, and no love has been lost between the two. Though I have accepted his request to map Suldanesselar's defences and to assassinate Priestess Demin.~)
        %
        SOLVED_JOURNAL ~Brokkr's family: Spy in Suldanesselar failed

        I have failed; I somehow misplaced the required proof, and without it, Malzoth's fiend has refused to give me my reward.~
    EXIT
END

IF ~~ THEN BEGIN ImpDeminDeadAxe
    SAY ~As ins-truc-ted by my Mas-ter Mal-zoth, I am trans-fer-ring to you own-er-ship of these items.~
    IF ~~ THEN DO
        %GiveItem("rqhamm03","rqbro")
        TakePartyItem("rqaxe02")
        GiveItem("rqaxe04","rqbro")
        GiveItem("rqletmal","rqbro")
        TakePartyItem("rqproof5")
        TakePartyItem("rqproof6")
        CreateVisualEffectObject("ICFIRSDI",Myself)
        DestroySelf()%
        SOLVED_JOURNAL ~Brokkr's family: Spy in Suldanesselar finished

        Looks like Malzoth has asked around and is no longer brave enough to meet me in person. Whatever, I got my reward.~
    EXIT
END

IF ~~ THEN BEGIN ImpDeminDeadNoAxe
    SAY ~As ins-truc-ted by my Mas-ter Mal-zoth, I am trans-fer-ring to you own-er-ship of these items.~
    IF ~~ THEN DO
        %GiveItem("rqhamm03","rqbro")
        GiveItem("rqletmal","rqbro")
        TakePartyItem("rqproof5")
        TakePartyItem("rqproof6")
        CreateVisualEffectObject("ICFIRSDI",Myself)
        DestroySelf()%
        SOLVED_JOURNAL ~Brokkr's family: Spy in Suldanesselar finished

        Looks like Malzoth has asked around and is no longer brave enough to meet me in person. Whatever, I got my reward.~
    EXIT
END

