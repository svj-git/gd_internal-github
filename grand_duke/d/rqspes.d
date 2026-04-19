// Spestyl

BEGIN ~rqspes~

IF ~InParty("rqrhiv")~ THEN BEGIN ReignZelmira
    SAY ~Your help is welcome. Now, scram, priestess. <CHARNAME>, you are finished.~
    IF ~~ THEN DO
        %TakePartyItemAll("SCRL2J")  // Letter
        TakePartyItemAll("SCRL2K")  // Letter
        TakePartyItemAll("SCRL2L")  // Letter
        TakePartyItemAll("SCRL2M")  // Letter
        TakePartyItemAll("SCRL2N")  // Letter
        TakePartyItemAll("SCRL2O")  // Letter
        TakePartyItemAll("SCRL2P")  // Letter
        TakePartyItemAll("SCRL2Q")  // Letter
        TakePartyItemAll("SCRL2R")  // Letter
        TakePartyItemAll("SCRL2S")  // Letter
        TakePartyItemAll("SCRL2T")  // Letter
        TakePartyItemAll("SCRL2U")  // Letter
        TakePartyItemAll("SCRL2V")  // Letter
        TakePartyItemAll("SCRL2W")  // Letter
        TakePartyItemAll("SCRL2X")  // Letter
        TakePartyItemAll("SCRL2Y")  // Letter
        TakePartyItemAll("SCRL2Z")  // Letter
        TakePartyItemAll("SCRL3A")  // Letter
        TakePartyItemAll("SCRL3B")  // Letter
        TakePartyItemAll("SCRL3C")  // Letter
        TakePartyItemAll("SCRL3E")  // Letter
        TakePartyItemAll("SCRL3F")  // The diary of Sarevok
        TakePartyItemAll("SCRL3Z")  // Gorion's Scroll
        TakePartyItemAll("SCRLZHA")  // Scroll
        TakePartyItemAll("MISC78")  // Invitation
            EraseJournalEntry(~Duke of Baldur's Gate:

            I do not like to be used like a pawn. Yet I know that killing Alatos in the Eastern district will clear out a lot of fog.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

            I am to assault the Flaming Fist citadel, which seems a daunting task, yet I am confident I will succeed. My mission in the citadel has three goals: Kill Kerboven, kill all Flaming Fists on the first and second floors, and leave the corpses of Alatos's men, which I am carrying inside a crate given by Trest.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

        Flaming Fist Citadel is under our control. Pity I cannot just do whatever evil deed I want without Fist interfering. Success is success, though. I need to speak to Krivy in the Blade and Stars about further actions.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

        Flaming Fist Citadel is under our control. Pity I cannot just do whatever evil deed I want without Fist still interfering. Success is success; I need to speak to Krivy in Blade and Stars about further actions.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Talvin of Gelfiven vote gained

        Easily gained vote, though I would not have liked it if Talvin had just destroyed my ring.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Talvin of Gelfiven vote lost

        I could not let that fool Talvin destroy my ring for his vote. I do not think that I will need all landowner votes anyway.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Gemerkan vote lost

        Gemerkan, yet another city dweller, wanted to offload his burdens onto me. Though I wonder why or how a member of a pitch-making family would wound Sirine; that remains a mystery to me.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Gemerkan

        Eligible voters want something for their votes; I should have known. This one, though, is relatively straightforward: kill Sirine and bring her body to Iachino or Krivy in the Elfsong Tavern. Sirine should have wounds on her body, and she should be located in the lighthouse area near the coastline.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Melwis, a Kelthor family representative

        Melwis, a representative for the Kelthor family, wants me to deal with Merchelen. I should intimidate him into leaving the city, though I do not think Melwis would mind if Merchelen dies. Iachino in the Elfsong is the contact person if I wish to complete this quest.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Kelthor family represented by Melwis: vote lost

        Melwis a Kelthor family representative wanted me to enact revenge deal with Merchelen, but I rejected him.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Gvalas vote lost

        Gvalas wanted me to enact revenge on his son, but I rejected him.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Gvalas

        The father of the murdered child wants to exact his revenge on certain Gro'Thuk. If I am not convinced by the father's pleas, I could confirm Gro'Thuk's guilt with the Bounty Officer at the Flaming Fist Citadel. I do not need to find Gvalas to report my success. Iachino is the person to speak to if I want to receive my vote. Iachino can be found in the Elfsong Tavern in Baldur's Gate.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Temur vote lost

        Pompous fool Temur got really mad when I rejected his proposal to do the work of his seneschal.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Temur of Droliegen

        Looks like another burgher needs my help. This time, Ogre Magi are to be returned to the ground. The Ogre Magi are supposed to terrorize the farmlands northeast of Baldur's Gate. Iachino in the Elfsong Tavern knows about this task, and I am to speak to him when I wish to complete my task.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Nestor Vote gained

        I gave Nestor the head I have on me; what he will do with it, though, is a mystery to me.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Nestor Vote lost

        Nestor tried to send me to kill a wyvern for him. If he has such needs, I could have just sent him to Cloakwood, where he could find plenty of such heads if he can prevent his bladder from leaking.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Nestor

        Kill wyvern for a vote, that's new to me. Either way, I am going to get the wyvern's head and bring it to Iachino.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Ioviis Vote lost

        While Ioviis's request sounded innocent enough, I cannot just make promises to everyone.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Ioviis Vote gained

        I have accepted Ioviis's request, as it seemed innocuous enough.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Turpin vote lost

        Landowners are trying to bribe me even before I got into the position of Duke. Naturally, I have rejected such things.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Turpin vote gained

        Monopoly on ale distribution is surely just the beginning. I do wonder how much gold such a monopoly will earn Turpin.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Ivylla vote lost

        Ivylla, a nasty harpy of a woman, tried to extort me for votes. I do not tolerate such behavior from anyone, much less a frail, pompous female.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Ivylla vote gained

        Buying votes with money. How can someone be in such a position and still be so greedy?~)
        EraseJournalEntry(~Duke of Baldur's Gate: Remelsen vote gained

        Getting Remelsen to vote for me was very easy, which makes me wonder about his motives.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Remelsen vote lost

        The Duke of Baldur's Gate, being Alatos's pawn, did not seem like a good deal to me. Give a thief a hand, and he'll take your whole arm.~)
        EraseJournalEntry(~Rhiviq's Revenge

        I have agreed to exact revenge on behalf of Mage Rhiviq. Rhiviq has indicated that the enemy, whom he has refused to reveal, is supposed to be located in the city of Baldur's Gate.~)
        EraseJournalEntry(~Rhiviq's Revenge

        After arriving in Baldur's Gate, Rhiviq told me that the people who enslaved him are in one of the houses with locked door in northwestern part of the city.~)
        EraseJournalEntry(~Rhiviq's Revenge

        I expected Rhiviq to murder someone who wronged him, though I could have predicted it would be his foster parents. His elation after the fact disturbed me. Still, I regard him as a useful addition to my party, so he stays for now, at least.~)
        EraseJournalEntry(~Brokkr's Treasure

        Dwarf Brokkr had his axe stolen by gnolls located in Gnoll Stronghold, and I have agreed to recover it.~)
        EraseJournalEntry(~Brokkr's murder plot

        I would have never thought that a cold man like Brokkr would help solve a murder case in Water Waterdeep. Either way, if I am inclined to gain further insight into this mystery, I should talk to Jergun Ermingsen in the Council of Six Building. I doubt that questioning the dwarf about this would result in revealing any interesting details.~)
        EraseJournalEntry(~Brokkr's murder plot

            I have agreed to investigate a series of murders for Jergun from the city guard. The murderer is targeting peasants. Murderer is or are of small stature and physically weak. Murderer leaves behind disfigured corpses. Some, not all, have been found with eyes removed and blood drained. There are no witnesses. Joses is my aide in the investigation. I am to continue the investigation southeast of the Docks district.~)
        EraseJournalEntry(~Brokkr's murder plot

            I need to think twice before I accept work from any authority. Do they expect me to follow a smell throughout Athkatla? Am I a bloodhound? Despite Jergun asking me to investigate these murders, it seems someone is trying to impede my investigation. I should trust no one. Another murder has supposedly occurred north of the Copper Coronet. Joses will be waiting for me there, hopefully with more actionable proof than just a sulfurous smell.~)
        EraseJournalEntry(~Brokkr's murder plot

            I have let the werewolf go; at least he did not try to mislead me with lies. I even question whether there were any murders or not, though I had not trusted anyone in this affair. I will not return to the Council of Six to check if Jergun is there, which I highly doubt, as I suspect he was part of the deception.~)
        EraseJournalEntry(~Brokkr's Treasure

        I have recovered Brokkkr's axe from the clutches of gnolls in their very own stronghold.~)
        EraseJournalEntry(~Brokkr's Treasure Chapter II

        Dwarf Brokkr asked me to acquire dwarven militia training manual. Whatever that is, it must be quite valuable to dwarves. Only lead Brokkr has is that a man named Torl is in the Blushing Mermaid.~)
        EraseJournalEntry(~Brokkr's Treasure Chapter II

        I have tracked down Torl, who was supposed to know where Progunnos is, and it looks like he went to the Friendly Arm Inn to sell the manual.~)
        EraseJournalEntry(~Brokkr's Treasure Chapter II

        Progunnos is dead and the dwarven manual is in my possession. When I have finished reading it, I should go to Baldur's Gate and return the manual to the dwarf Azrammar in Sorcerous Sundries for a big reward.~)
        EraseJournalEntry(~Brokkr's Treasure Chapter II failure

        I have failed to kill Torl before he could escape, and thus I am unable to return the training manual.~)
        EraseJournalEntry(~Brokkr's Treasure Hurgan's Cache

        A new treasure hunt. I'm beginning to think this dwarf has a nose for treasure, though I'm unsure what kind of magic item he's after. Either way, I should travel to Peldvale to investigate this mystery.~)
        EraseJournalEntry(~Brokkr's Treasure Hurgan's Cache found

            Looks like Brokk's former lover wanted to get the same treasure I did and sprung an ambush for me. What surprised me was how somber Brokk was after her death; regardless, I should check her corpse for any treasure.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

            I am to assault the Flaming Fist citadel, which seems a daunting task, yet I am confident I will succeed. My mission in the citadel has three goals: Kill Kerboven, kill all Flaming Fists on the first and second floors, and leave the corpses of Alatos's men, which I am carrying inside a crate given by Trest.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

            I do not like to be used like a pawn. Yet I know that killing Alatos in the Eastern district will clear out a lot of fog.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

            I am to assault the Flaming Fist citadel, which seems a daunting task, yet I am confident I will succeed. My mission in the citadel has three goals: Kill Kerboven, kill all Flaming Fists on the first and second floors, and leave the corpses of Alatos's men, which I am carrying inside a crate given by Trest.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

        Flaming Fist Citadel is under our control. It's a pity I cannot just do whatever evil deed I want without the Fist still interfering. Success is success; I need to speak to Krivy in Blade and Stars about further actions.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

        After speaking to Lerov, who claims to act on Krivy's behalf, I have agreed to meet Krivy behind Sorcerous Sundries.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

        Rejected Lerov's attempt to meet with Krivy behind Sorcerous Sundries. If I change my mind, I can find Lerov in the Elfsong Tavern.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

        I think Alatos has earned his death for his actions against me. I shall kill all the thieves even if it is the last thing I do in Baldur's Gate.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

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
            Ioviis Elfsong Tavern 2nd floor, East Baldur's Gate.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

        After Lerov's betrayal, Krivy instructed me to find Lezgyn Hawk and turn him to our side. When I am done, I will want to report my success to one of Krivy's men in the Blade and Stars.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

        I had enough of Krivy and his nonsense. I would rather be free and do what I wish than be strung along by some thief.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

        I think Alatos has earned his death for his actions against me. I shall kill all the thieves even if it is the last thing I do in Baldur's Gate.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

        So Alatos is behind my assassination attempt. I should visit Alatos's lair in the Eastern district and eliminate him.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

            My next move, according to Krivy, should be to make a deal with Duke Belt, which will hopefully stop the attempts on my life.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

            I have refused Krivy's suggestion to slaughter Alatos and his thieves, which I might regret in the future, but I do not think that bloodshed would have solved the situation. My next move, according to Krivy, should be to make a deal with Duke Belt, which will hopefully stop the attempts on my life.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

        Krivy has set me up against paladins; I do have reservations about this but little choice. The paladins are lodged in the Shop of Silence in the Eastern district of Baldur's Gate. If I am finished with the paladins, I should report it to Krivy in the Blade and Stars.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

        I am to assault the Flaming Fist Citadel, which sounds like suicide, but Krivy assures me that with the help of Trest, who is second in command of the Flaming Fist mercenaries, it is possible. Further details can be gleaned from Trest, who is standing outside the Flaming Fist Citadel.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

        Alatos should be the last obstacle before my ascension to the ducal position. All I have to do is kill everyone in the guild. Location: East Baldur's Gate, northeast of Sorcerous Sundries.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Gemerkan vote gained

        Weird thing, this Sirine affair, but it secures my vote from Gemerkan.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

        I wanted to speak to Krivy, so Iachino set out to arrange our parlay. In the meantime, I should speak to a certain man who waits for me outside of Elfsong.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Melwis Kelthor family representative

        Dead Merchelen means a vote from Agraar.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Melwis Kelthor family representative

        Scaring Merchelen was relatively easy, as he was already afraid of Kelthors.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Gvalas vote lost

        Letting Gro'Thuk escape was a pretty stupid, avoidable mistake.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Gvalas vote gained

        It is all about the dosage, and Gro'Thuk has found out that water can be poisonous in large quantities.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Gvalas vote gained

        Gro'Thuk is dead, and hopefully Gvalas will be unable to discover that his death did not look like an accident.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Temur of Droliegen vote gained

        Liberating occupied farmlands from Ogre Mages is quest worthy of hero tales. I should commission bard to write song about me.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

        I wanted to speak to Krivy, so Iachino set out to arrange our parlay. In the meantime, I should speak to a certain man who waits for me outside of Elfsong.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

        It seems that my actions have caught the attention of the Dukes. This is both good and bad. The bad thing is that the Dukes will intervene if I continue on my current course. The good part is that Krivy can actually deliver on his promises; otherwise, I would not have received this letter. Now I have two options: either continue with my quest with Krivy or take Belt's offer.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

        I passed the news about Lezgyn to Krivy, though a messenger warned me about overstaying in the Blade and Stars Tavern. Why do I smell another ambush? I should prepare myself to fight my way out of here.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

        Received a message from Duke Belt. This is both good and bad. The bad thing is that the Dukes will intervene if I continue on my current course. The good part is that Krivy can actually deliver on his promises; otherwise, I would not have received this letter. Now I have two options: either continue with my quest with Krivy or take Belt's offer to leave the city.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

        I have taken this opportunity to get back into the good graces of Duke Belt. I think it would be much better for the city, and I have no wish to become like Sarevok.~)
        ActionOverride(Player1,LeaveAreaLUAPanic("ARAM00","",[10.960],S))
        ActionOverride(Player1,LeaveAreaLUA("ARAM00","",[10.960],S))
        ActionOverride(Player2,LeaveAreaLUA("ARAM00","",[10.960],S))
        ActionOverride(Player3,LeaveAreaLUA("ARAM00","",[10.960],S))
        ActionOverride(Player4,LeaveAreaLUA("ARAM00","",[10.960],S))
        ActionOverride(Player5,LeaveAreaLUA("ARAM00","",[10.960],S))
        ActionOverride(Player6,LeaveAreaLUA("ARAM00","",[10.960],S))
        %
    EXIT
END

IF ~!InParty("rqrhiv")~ THEN BEGIN Reign
    SAY ~Your inteference will end right now.~
    IF ~~ THEN DO
        %TakePartyItemAll("SCRL2J")  // Letter
        TakePartyItemAll("SCRL2K")  // Letter
        TakePartyItemAll("SCRL2L")  // Letter
        TakePartyItemAll("SCRL2M")  // Letter
        TakePartyItemAll("SCRL2N")  // Letter
        TakePartyItemAll("SCRL2O")  // Letter
        TakePartyItemAll("SCRL2P")  // Letter
        TakePartyItemAll("SCRL2Q")  // Letter
        TakePartyItemAll("SCRL2R")  // Letter
        TakePartyItemAll("SCRL2S")  // Letter
        TakePartyItemAll("SCRL2T")  // Letter
        TakePartyItemAll("SCRL2U")  // Letter
        TakePartyItemAll("SCRL2V")  // Letter
        TakePartyItemAll("SCRL2W")  // Letter
        TakePartyItemAll("SCRL2X")  // Letter
        TakePartyItemAll("SCRL2Y")  // Letter
        TakePartyItemAll("SCRL2Z")  // Letter
        TakePartyItemAll("SCRL3A")  // Letter
        TakePartyItemAll("SCRL3B")  // Letter
        TakePartyItemAll("SCRL3C")  // Letter
        TakePartyItemAll("SCRL3E")  // Letter
        TakePartyItemAll("SCRL3F")  // The diary of Sarevok
        TakePartyItemAll("SCRL3Z")  // Gorion's Scroll
        TakePartyItemAll("SCRLZHA")  // Scroll
        TakePartyItemAll("MISC78")  // Invitation
            EraseJournalEntry(~Duke of Baldur's Gate:

            I do not like to be used like a pawn. Yet I know that killing Alatos in the Eastern district will clear out a lot of fog.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

            I am to assault the Flaming Fist citadel, which seems a daunting task, yet I am confident I will succeed. My mission in the citadel has three goals: Kill Kerboven, kill all Flaming Fists on the first and second floors, and leave the corpses of Alatos's men, which I am carrying inside a crate given by Trest.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

        Flaming Fist Citadel is under our control. Pity I cannot just do whatever evil deed I want without Fist interfering. Success is success, though. I need to speak to Krivy in the Blade and Stars about further actions.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

        Flaming Fist Citadel is under our control. Pity I cannot just do whatever evil deed I want without Fist still interfering. Success is success; I need to speak to Krivy in Blade and Stars about further actions.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Talvin of Gelfiven vote gained

        Easily gained vote, though I would not have liked it if Talvin had just destroyed my ring.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Talvin of Gelfiven vote lost

        I could not let that fool Talvin destroy my ring for his vote. I do not think that I will need all landowner votes anyway.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Gemerkan vote lost

        Gemerkan, yet another city dweller, wanted to offload his burdens onto me. Though I wonder why or how a member of a pitch-making family would wound Sirine; that remains a mystery to me.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Gemerkan

        Eligible voters want something for their votes; I should have known. This one, though, is relatively straightforward: kill Sirine and bring her body to Iachino or Krivy in the Elfsong Tavern. Sirine should have wounds on her body, and she should be located in the lighthouse area near the coastline.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Melwis, a Kelthor family representative

        Melwis, a representative for the Kelthor family, wants me to deal with Merchelen. I should intimidate him into leaving the city, though I do not think Melwis would mind if Merchelen dies. Iachino in the Elfsong is the contact person if I wish to complete this quest.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Kelthor family represented by Melwis: vote lost

        Melwis a Kelthor family representative wanted me to enact revenge deal with Merchelen, but I rejected him.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Gvalas vote lost

        Gvalas wanted me to enact revenge on his son, but I rejected him.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Gvalas

        The father of the murdered child wants to exact his revenge on certain Gro'Thuk. If I am not convinced by the father's pleas, I could confirm Gro'Thuk's guilt with the Bounty Officer at the Flaming Fist Citadel. I do not need to find Gvalas to report my success. Iachino is the person to speak to if I want to receive my vote. Iachino can be found in the Elfsong Tavern in Baldur's Gate.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Temur vote lost

        Pompous fool Temur got really mad when I rejected his proposal to do the work of his seneschal.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Temur of Droliegen

        Looks like another burgher needs my help. This time, Ogre Magi are to be returned to the ground. The Ogre Magi are supposed to terrorize the farmlands northeast of Baldur's Gate. Iachino in the Elfsong Tavern knows about this task, and I am to speak to him when I wish to complete my task.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Nestor Vote gained

        I gave Nestor the head I have on me; what he will do with it, though, is a mystery to me.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Nestor Vote lost

        Nestor tried to send me to kill a wyvern for him. If he has such needs, I could have just sent him to Cloakwood, where he could find plenty of such heads if he can prevent his bladder from leaking.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Nestor

        Kill wyvern for a vote, that's new to me. Either way, I am going to get the wyvern's head and bring it to Iachino.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Ioviis Vote lost

        While Ioviis's request sounded innocent enough, I cannot just make promises to everyone.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Ioviis Vote gained

        I have accepted Ioviis's request, as it seemed innocuous enough.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Turpin vote lost

        Landowners are trying to bribe me even before I got into the position of Duke. Naturally, I have rejected such things.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Turpin vote gained

        Monopoly on ale distribution is surely just the beginning. I do wonder how much gold such a monopoly will earn Turpin.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Ivylla vote lost

        Ivylla, a nasty harpy of a woman, tried to extort me for votes. I do not tolerate such behavior from anyone, much less a frail, pompous female.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Ivylla vote gained

        Buying votes with money. How can someone be in such a position and still be so greedy?~)
        EraseJournalEntry(~Duke of Baldur's Gate: Remelsen vote gained

        Getting Remelsen to vote for me was very easy, which makes me wonder about his motives.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Remelsen vote lost

        The Duke of Baldur's Gate, being Alatos's pawn, did not seem like a good deal to me. Give a thief a hand, and he'll take your whole arm.~)
        EraseJournalEntry(~Rhiviq's Revenge

        I have agreed to exact revenge on behalf of Mage Rhiviq. Rhiviq has indicated that the enemy, whom he has refused to reveal, is supposed to be located in the city of Baldur's Gate.~)
        EraseJournalEntry(~Rhiviq's Revenge

        After arriving in Baldur's Gate, Rhiviq told me that the people who enslaved him are in one of the houses with locked door in northwestern part of the city.~)
        EraseJournalEntry(~Rhiviq's Revenge

        I expected Rhiviq to murder someone who wronged him, though I could have predicted it would be his foster parents. His elation after the fact disturbed me. Still, I regard him as a useful addition to my party, so he stays for now, at least.~)
        EraseJournalEntry(~Brokkr's Treasure

        Dwarf Brokkr had his axe stolen by gnolls located in Gnoll Stronghold, and I have agreed to recover it.~)
        EraseJournalEntry(~Brokkr's murder plot

        I would have never thought that a cold man like Brokkr would help solve a murder case in Water Waterdeep. Either way, if I am inclined to gain further insight into this mystery, I should talk to Jergun Ermingsen in the Council of Six Building. I doubt that questioning the dwarf about this would result in revealing any interesting details.~)
        EraseJournalEntry(~Brokkr's murder plot

            I have agreed to investigate a series of murders for Jergun from the city guard. The murderer is targeting peasants. Murderer is or are of small stature and physically weak. Murderer leaves behind disfigured corpses. Some, not all, have been found with eyes removed and blood drained. There are no witnesses. Joses is my aide in the investigation. I am to continue the investigation southeast of the Docks district.~)
        EraseJournalEntry(~Brokkr's murder plot

            I need to think twice before I accept work from any authority. Do they expect me to follow a smell throughout Athkatla? Am I a bloodhound? Despite Jergun asking me to investigate these murders, it seems someone is trying to impede my investigation. I should trust no one. Another murder has supposedly occurred north of the Copper Coronet. Joses will be waiting for me there, hopefully with more actionable proof than just a sulfurous smell.~)
        EraseJournalEntry(~Brokkr's murder plot

            I have let the werewolf go; at least he did not try to mislead me with lies. I even question whether there were any murders or not, though I had not trusted anyone in this affair. I will not return to the Council of Six to check if Jergun is there, which I highly doubt, as I suspect he was part of the deception.~)
        EraseJournalEntry(~Brokkr's Treasure

        I have recovered Brokkkr's axe from the clutches of gnolls in their very own stronghold.~)
        EraseJournalEntry(~Brokkr's Treasure Chapter II

        Dwarf Brokkr asked me to acquire dwarven militia training manual. Whatever that is, it must be quite valuable to dwarves. Only lead Brokkr has is that a man named Torl is in the Blushing Mermaid.~)
        EraseJournalEntry(~Brokkr's Treasure Chapter II

        I have tracked down Torl, who was supposed to know where Progunnos is, and it looks like he went to the Friendly Arm Inn to sell the manual.~)
        EraseJournalEntry(~Brokkr's Treasure Chapter II

        Progunnos is dead and the dwarven manual is in my possession. When I have finished reading it, I should go to Baldur's Gate and return the manual to the dwarf Azrammar in Sorcerous Sundries for a big reward.~)
        EraseJournalEntry(~Brokkr's Treasure Chapter II failure

        I have failed to kill Torl before he could escape, and thus I am unable to return the training manual.~)
        EraseJournalEntry(~Brokkr's Treasure Hurgan's Cache

        A new treasure hunt. I'm beginning to think this dwarf has a nose for treasure, though I'm unsure what kind of magic item he's after. Either way, I should travel to Peldvale to investigate this mystery.~)
        EraseJournalEntry(~Brokkr's Treasure Hurgan's Cache found

            Looks like Brokk's former lover wanted to get the same treasure I did and sprung an ambush for me. What surprised me was how somber Brokk was after her death; regardless, I should check her corpse for any treasure.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

            I am to assault the Flaming Fist citadel, which seems a daunting task, yet I am confident I will succeed. My mission in the citadel has three goals: Kill Kerboven, kill all Flaming Fists on the first and second floors, and leave the corpses of Alatos's men, which I am carrying inside a crate given by Trest.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

            I do not like to be used like a pawn. Yet I know that killing Alatos in the Eastern district will clear out a lot of fog.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

            I am to assault the Flaming Fist citadel, which seems a daunting task, yet I am confident I will succeed. My mission in the citadel has three goals: Kill Kerboven, kill all Flaming Fists on the first and second floors, and leave the corpses of Alatos's men, which I am carrying inside a crate given by Trest.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

        Flaming Fist Citadel is under our control. It's a pity I cannot just do whatever evil deed I want without the Fist still interfering. Success is success; I need to speak to Krivy in Blade and Stars about further actions.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

        After speaking to Lerov, who claims to act on Krivy's behalf, I have agreed to meet Krivy behind Sorcerous Sundries.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

        Rejected Lerov's attempt to meet with Krivy behind Sorcerous Sundries. If I change my mind, I can find Lerov in the Elfsong Tavern.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

        I think Alatos has earned his death for his actions against me. I shall kill all the thieves even if it is the last thing I do in Baldur's Gate.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

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
            Ioviis Elfsong Tavern 2nd floor, East Baldur's Gate.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

        After Lerov's betrayal, Krivy instructed me to find Lezgyn Hawk and turn him to our side. When I am done, I will want to report my success to one of Krivy's men in the Blade and Stars.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

        I had enough of Krivy and his nonsense. I would rather be free and do what I wish than be strung along by some thief.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

        I think Alatos has earned his death for his actions against me. I shall kill all the thieves even if it is the last thing I do in Baldur's Gate.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

        So Alatos is behind my assassination attempt. I should visit Alatos's lair in the Eastern district and eliminate him.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

            My next move, according to Krivy, should be to make a deal with Duke Belt, which will hopefully stop the attempts on my life.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

            I have refused Krivy's suggestion to slaughter Alatos and his thieves, which I might regret in the future, but I do not think that bloodshed would have solved the situation. My next move, according to Krivy, should be to make a deal with Duke Belt, which will hopefully stop the attempts on my life.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

        Krivy has set me up against paladins; I do have reservations about this but little choice. The paladins are lodged in the Shop of Silence in the Eastern district of Baldur's Gate. If I am finished with the paladins, I should report it to Krivy in the Blade and Stars.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

        I am to assault the Flaming Fist Citadel, which sounds like suicide, but Krivy assures me that with the help of Trest, who is second in command of the Flaming Fist mercenaries, it is possible. Further details can be gleaned from Trest, who is standing outside the Flaming Fist Citadel.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

        Alatos should be the last obstacle before my ascension to the ducal position. All I have to do is kill everyone in the guild. Location: East Baldur's Gate, northeast of Sorcerous Sundries.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Gemerkan vote gained

        Weird thing, this Sirine affair, but it secures my vote from Gemerkan.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

        I wanted to speak to Krivy, so Iachino set out to arrange our parlay. In the meantime, I should speak to a certain man who waits for me outside of Elfsong.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Melwis Kelthor family representative

        Dead Merchelen means a vote from Agraar.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Melwis Kelthor family representative

        Scaring Merchelen was relatively easy, as he was already afraid of Kelthors.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Gvalas vote lost

        Letting Gro'Thuk escape was a pretty stupid, avoidable mistake.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Gvalas vote gained

        It is all about the dosage, and Gro'Thuk has found out that water can be poisonous in large quantities.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Gvalas vote gained

        Gro'Thuk is dead, and hopefully Gvalas will be unable to discover that his death did not look like an accident.~)
        EraseJournalEntry(~Duke of Baldur's Gate: Temur of Droliegen vote gained

        Liberating occupied farmlands from Ogre Mages is quest worthy of hero tales. I should commission bard to write song about me.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

        I wanted to speak to Krivy, so Iachino set out to arrange our parlay. In the meantime, I should speak to a certain man who waits for me outside of Elfsong.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

        It seems that my actions have caught the attention of the Dukes. This is both good and bad. The bad thing is that the Dukes will intervene if I continue on my current course. The good part is that Krivy can actually deliver on his promises; otherwise, I would not have received this letter. Now I have two options: either continue with my quest with Krivy or take Belt's offer.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

        I passed the news about Lezgyn to Krivy, though a messenger warned me about overstaying in the Blade and Stars Tavern. Why do I smell another ambush? I should prepare myself to fight my way out of here.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

        Received a message from Duke Belt. This is both good and bad. The bad thing is that the Dukes will intervene if I continue on my current course. The good part is that Krivy can actually deliver on his promises; otherwise, I would not have received this letter. Now I have two options: either continue with my quest with Krivy or take Belt's offer to leave the city.~)
        EraseJournalEntry(~Duke of Baldur's Gate:

        I have taken this opportunity to get back into the good graces of Duke Belt. I think it would be much better for the city, and I have no wish to become like Sarevok.~)
        ActionOverride(Player1,LeaveAreaLUAPanic("ARAM00","",[10.960],S))
        ActionOverride(Player1,LeaveAreaLUA("ARAM00","",[10.960],S))
        ActionOverride(Player2,LeaveAreaLUA("ARAM00","",[10.960],S))
        ActionOverride(Player3,LeaveAreaLUA("ARAM00","",[10.960],S))
        ActionOverride(Player4,LeaveAreaLUA("ARAM00","",[10.960],S))
        ActionOverride(Player5,LeaveAreaLUA("ARAM00","",[10.960],S))
        ActionOverride(Player6,LeaveAreaLUA("ARAM00","",[10.960],S))
        %
    EXIT
END
