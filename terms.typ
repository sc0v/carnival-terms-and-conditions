#let fee = (
  entry: (doghouse: 20, blitz: 50, full: 75),
  cancel: (doghouse: 20, blitz: 50, full: 75),
  cancel-late-multiplier: 2,
  meeting: 25,
  training: 50,
  hardhat-lost: 25,
  hardhat-defaced: 15,
  ppe: 15,
  observer-building: 15,
  vehicle: 100,
  spill: (small: 25, medium: 50, large: 100),
  plot-clean: 25,
  fire-lane: 25,
  tool-missing-pct: 125,
  spillover: 25,
  plan-change-max: 150,
  structural-max: 200,
  quiet-hours: 25,
  wiring: 100,
  electrical-max: 200,
  power-box: 20,
  breaker: 25,
  occupancy: (25, 50),
  downtime-notice: (5, 10, 15),
  closed-hours: 25,
  watch-duty-min: 10,
  watch-leave: 25,
  watch-late: (10, 15, 25),
  watch-late-min-4th: 80,
  watch-missed: (50, 100, 150),
  watch-missed-min-4th: 200,
  intox-staff: (50, 100),
  teardown-crew-full: 25,
  teardown-crew-blitz: 25,
  late-teardown: (1, 5, 10),
  dumpster: 100,
  deadline: (2.5, 5, 10),
  concessions-hour: 25,
  permit: 50,
  parking-blitz: 75,
)

#let usd(x) = {
  let cents = int(calc.round(x * 100))
  let whole = calc.quo(cents, 100)
  let rest = calc.rem(cents, 100)
  if rest == 0 { [\$#whole] } else { [\$#whole.#if rest < 10 [0]#rest] }
}

#let usds(xs, sep: ", ") = xs.map(usd).join(sep)

#let times(n) = if n == 2 [doubled] else [multiplied by #n]

#let signatures(..labels) = {
  v(1em)
  grid(
    columns: (3fr, 1fr),
    column-gutter: 2em,
    row-gutter: 1.6em,
    ..labels.pos().map(l => (
      [#line(length: 100%, stroke: 0.6pt) #v(-0.6em) *#l*],
      [#line(length: 100%, stroke: 0.6pt) #v(-0.6em) *Date*],
    )).flatten()
  )
  v(1em)
}

#set document(title: "Spring Carnival Booth Terms and Conditions")
#set page(paper: "us-letter", margin: (x: 1in, y: 0.9in), numbering: "1")
#set text(size: 10.5pt)
#set par(justify: true, spacing: 0.9em)
#set list(indent: 1em)
#set table(inset: 6pt, stroke: 0.5pt + gray)
#show table: set par(justify: false)
#let section-breaks = state("section-breaks", true)
#let page-breaks(on) = section-breaks.update(on)

#show heading.where(level: 1): it => {
  context if section-breaks.get() { pagebreak(weak: true) }
  v(0.8em)
  text(size: 14pt, weight: "bold", it.body)
  v(0.3em)
}
#show heading.where(level: 2): it => {
  v(0.5em)
  text(size: 11.5pt, weight: "bold", it.body)
  v(0.2em)
}
#show outline.entry.where(level: 1): set text(weight: "bold")

= TERMS AND CONDITIONS OF PARTICIPATION

The following Terms and Conditions of Participation (the "Terms") apply to each student organization that desires to operate an amusement booth at Carnegie Mellon Spring Carnival. By signing below and participating in the event, the undersigned organization agrees to be bound by these Terms in their entirety.

*This organization, \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ , hereby declares itself:*

*\_\_\_\_\_\_ Fraternity              \_\_\_\_\_\_ Sorority              \_\_\_\_\_\_ Independent*

*\_\_\_\_\_\_ Blitz              \_\_\_\_\_\_ Doghouse*

*This organization agrees to comply with these Terms and with all applicable federal, state, and local laws and University policies. One or more of the signers has authority to sign documents on behalf of the organization.*

#signatures("Booth Chair", "Booth Chair", "Booth Chair", "Head(s) of Booth")

= PAYMENT AUTHORIZATION

By signing below, I acknowledge and authorize the automatic debiting of my organization's University Account for the entry fee and any fines, which are invoiced together after Spring Carnival (§11.2). My organization's account will be debited 14 days after the receipt of an invoice. Any appeals must be submitted in writing to the SCC Chair(s) and approved or denied within those 14 days (§11.4). I understand that fines resulting from cancellation may be invoiced at the time of cancellation.

#table(
  columns: 3,
  [*Entry fee (§3.1)*],
  [*Cancellation fine, fall classes to Start of Spring Break (§3.2)*],
  [*Cancellation fine, after Start of Spring Break (§3.2)*],

  [Doghouse: #usd(fee.entry.doghouse)],
  [#usd(fee.cancel.doghouse)],
  [#usd(fee.cancel.doghouse * fee.cancel-late-multiplier)],

  [Blitz: #usd(fee.entry.blitz)], [#usd(fee.cancel.blitz)], [#usd(fee.cancel.blitz * fee.cancel-late-multiplier)],
  [One-story or two-story: #usd(fee.entry.full)],
  [#usd(fee.cancel.full)],
  [#usd(fee.cancel.full * fee.cancel-late-multiplier)],
)

All payments are made via the organization's University Account. Organizations housed in Student Affairs (SIT, Greek Life, Student Life) require no additional action. Organizations outside Student Affairs must provide an oracle string to the SCC Treasurer.

*Organization Name  \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_*

*Organization Oracle String \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_* \
_(non Student Affairs departments only)_

#signatures("Booth Chair", "President", "Authorized Signer/Treasurer", "University/Staff/Faculty Advisor")

#outline(title: [Table of Contents], depth: 2)

= §1 Definitions

Terms defined in this section keep these meanings throughout. This section defines terms only; all obligations and rules begin in §2.

*1.1 Spring Carnival* is the ten consecutive days during which all Midway construction, operations, and demolition activities occur. The days are numbered Day 1 (Friday) through Day 10 (Sunday), where Day 10 is the Sunday at the end of the University's Spring Carnival weekend as set by the academic calendar.

*1.1.2 Build Week* is the period from the start of Move-On (Day 1) through to 1 PM on the day of the Opening Ceremony (Day 7).

*1.1.3 Operations* is the period from the end of the Opening Ceremony on Day 7 through 11:00 pm on Day 9 (Saturday).

*1.1.4 Hours of Operation* are the times within Operations when booths are open to the public, as listed in §8.1.1.

*1.1.5 Move-On* is Day 1 of Spring Carnival, during which organizations transport the bulk of their building materials onto Midway.

*1.1.6 Tear-Down* is Day 10 of Spring Carnival, during which organizations fully demolish and remove their booths and all related materials from Midway.

*1.1.7 Start of Spring Break* is the Saturday at the start of the University's spring break, as set by the academic calendar.

*1.2 Midway* is the entirety of the College of Fine Arts (CFA) Parking Lot site used for the construction, operation, and Tear-Down of amusement booths during Spring Carnival.

*1.3 The Spring Carnival Committee (SCC)* consists of all members as defined in the SCC Constitution. These include Chair(s), Assistant Chair(s), Advisor(s), heads of subcommittees, assistant heads of subcommittees, members of subcommittees, and general members.

*1.4 The Booth Committee* consists of the Head(s) of Booth, Assistant Head(s) of Booth, Director(s) of Fraternity Booths, Director(s) of Sorority Booths, Director(s) of Independent Booths, Director(s) of Blitz Booths, Director(s) of Doghouse.

*1.5 The SCC Electrical Committee* consists of the Head(s) of Electrical, Assistant Head(s) of Electrical, and the members of the SCC electrical subcommittee.

*1.6 The Midway Coordinator* is the SCC member assigned to the coordinator desk at a given time. They are the first point of contact between builders and SCC and can always be found in the SCC trailer.

*1.7 The Rules Committee* consists of:

- Four Booth Representatives, one each from a participating fraternity, sorority, independent, and blitz organization. Each is nominated and elected by the Booth Chairs of that category, one vote per organization.
- The SCC Chair(s) and Head(s) of Booth, who together cast the same amount of votes as Booth Representatives present.
- The SCC Advisor or the Director of SIT, who does not vote except to break a tie.

Booth organizations and SCC hold the same number of votes no matter how many Chairs or Heads of Booth there are. How the Rules Committee decides is set out in §2.3.

*1.8 The Structural Oversight Committee (SOC)* consists of faculty and staff representatives responsible for reviewing the Carnival Construction Standards and ensuring safety during Spring Carnival. Members include:

- The SCC Advisor
- Any representative of Environmental Health & Safety (EH&S), including the Director of EH&S and the Fire Safety Manager
- Any representative of Facilities Management Services (FMS), including the Electrical Supervisor and Structure/Construction Supervisor(s)
- Faculty reviewer(s) of organization booth plans (architectural, engineering, or other disciplines as required)

*1.9 Authorized Midway Officials (AMOs)* refers collectively to:
- SCC Chair(s)
- Assistant Chair(s)
- Head(s) of Booth
- Assistant Head(s) of Booth
- Midway Coordinator
- Director of SIT
- SCC Advisor
- Any designated safety representative of the university.

Where these Terms grant authority to "Authorized Midway Officials," any one or more members of this group may act unless a specific number is stated.

*1.10 An Organization* is any student group that has registered to participate in Spring Carnival. Each is classified as one of the following:

*1.10.1 Fraternity* builds a full-size booth (one-story or two-story) on an 18' × 18' plot.

*1.10.2 Sorority* builds a full-size booth (one-story or two-story) on an 18' × 18' plot.

*1.10.3 Independent* builds a full-size booth (one-story or two-story) on an 18' × 18' plot.

*1.10.4 Blitz* builds a blitz booth on a 9' × 18' plot.

*1.10.5 Doghouse* builds a doghouse booth on a 4' × 4' plot to be placed on the UC walkway.

*1.11 A New Organization* is an organization that has not built a booth in any of the three Spring Carnivals immediately preceding the current year.

*1.12 Booth Chair(s)* are the designated representative(s) of an organization responsible for knowing and disseminating the Carnival Construction Standards and these Terms, and for executive decisions regarding their booth. Up to five Booth Chairs per organization will receive a red hard hat during Build Week and serve as the primary points of contact for SCC and University stakeholders.

*1.13 Downtime* is a period during which part or all of a booth is closed to the public during Hours of Operation.

*1.14 Disqualification* is the loss of eligibility for all awards. Disqualification does not waive an organization's obligation to follow these Terms. Disqualified booths may still be judged upon request.

*1.15 A Height-Restricted Booth* is a booth located directly in front of the College of Fine Arts. No part of such a booth may exceed the height restriction defined on the Midway map prior to plot selection.

*1.16 A Midway Watch Shift* is a scheduled Midway coverage period that organizations are required to staff as assigned by the Spring Carnival Committee.

= §2 Governance & Authority

== 2.1 SCC Duties and Powers

*2.1.1* SCC will furnish each participating organization with a plot space of the size corresponding to its classification as defined in §1.10.

*2.1.2* SCC reserves the right to add to or modify these Terms in the case of an emergency. Changes take effect upon written notification to Booth Chairs. Email constitutes written notification.

*2.1.3* SCC may amend these Terms at any time. Upon any such amendment, all organizations may withdraw their booth and receive a full refund of the entry fee. Fines, fees, and penalties incurred before the amendment must still be paid.

*2.1.4* The Head(s) of Booth reserve the right to reassign plots until booths are brought onto Midway, subject to the consent of the affected organizations.

*2.1.5* SCC is not responsible for valuables left on Midway. Valuables not integral to the structure of the booth may be removed when Midway is closed per the closing procedure in §8.4.

== 2.2 Emergency Authority

*2.2.1* Authorized Midway Officials may close and clear all persons from Midway due to extenuating circumstances, including but not limited to severe weather, lightning, or other safety hazards.

*2.2.2* If any Authorized Midway Official determines that the actions or circumstances of a booth warrant its shutdown, the booth will be shut down immediately. An emergency Rules Committee meeting will be called promptly, with a representative of the affected organization present. That representative may present a defense but does not vote.

== 2.3 Rules Committee

*2.3.1* The Rules Committee adjudicates violations of these Terms for which no explicit penalty is defined herein, and reviews penalties involving exceptional circumstances.

*2.3.2* A vote may only be held when at least three Booth Representatives are present. A decision requires a simple majority of members present. Reasonable efforts must be made to notify all members before any vote.

*2.3.3* The Rules Committee may modify any penalty in these Terms, apply additional penalties, or replace judging or disqualification penalties with monetary fines, by majority vote. Any disqualification or judging penalty must be discussed by the Rules Committee before the Awards Ceremony.

*2.3.4* A Booth Representative whose own organization is a party to a decision, such as a fine, appeal, or dispute involving that organization, shall not vote on it. The Booth Committee shall appoint a substitute from another organization in the same category for that vote. Decisions that apply to every organization, such as changes to these Terms, shall be voted on normally.

*2.3.5* Changes to these Terms for the upcoming Spring Carnival are presented to and approved by the Rules Committee before organizations sign. Changes after signing follow §2.1.2 and §2.1.3.

== 2.4 General Obligations

*2.4.1* Each organization must comply with all applicable federal, state, and local laws in connection with constructing, operating, and maintaining its booth. Each organization shall be responsible for securing any and all third-party consents that may be needed by such organization.

*2.4.2* Organizations are bound by these Terms and all SCC-established supplementary rules and regulations, including the Carnival Construction Standards, Tear-Down Schedule, Move-On Schedule, and Build Week Operation Standards. These Terms prevail in any conflict.

*2.4.3* All organizations and their members must be respectful of the general public, other organizations, and committee members. Attempts to damage the reputation of another organization or SCC, or any unsportsmanlike conduct, may result in penalties as determined by the Rules Committee.

*2.4.4* Any action by one organization that affects the construction, operation, or physical appearance of another booth, including theft, vandalism, or sabotage, is subject to Rules Committee review.

*2.4.5* Organizations must follow the directions of the Spring Carnival Committee. Failure to comply may result in penalties, including fines as determined by the Rules Committee, or required changes to design and construction plans.

*2.4.6* The SCC, the University, committees and/or organizations shall be excused from any delay in performance hereunder caused by an occurrence or contingency beyond their reasonable control and despite their best efforts. The affected party shall give the other party prompt written notice of any such delay.

= §3 Registration & Eligibility

== 3.1 Entry Fees

*3.1.1* All organizations must pay a non-refundable entry fee upon registration:

- Doghouse booth: #usd(fee.entry.doghouse)
- Blitz booth: #usd(fee.entry.blitz)
- One-story or two-story booth: #usd(fee.entry.full)

*3.1.2* The entry fee will be debited from the organization's University Account in conjunction with an organization’s booth fines.

== 3.2 Cancellation Policy

*3.2.1* The entry fee is forfeited upon cancellation regardless of timing.

*3.2.2* If cancellation occurs between the first day of fall classes and the Start of Spring Break, an additional cancellation fine is assessed on top of the forfeited entry fee:

- Doghouse booth: #usd(fee.cancel.doghouse)
- Blitz booth: #usd(fee.cancel.blitz)
- One-story or two-story booth: #usd(fee.cancel.full)

*3.2.3* If cancellation occurs after the Start of Spring Break, the cancellation fine from §3.2.2 is #times(fee.cancel-late-multiplier).

*3.2.4* An organization that cancels after Watch Shifts have been assigned remains responsible for completing those shifts or will face the Watch Shift penalties defined in §8.5.

*3.2.5* Upon cancellation, any fines accrued up to that point, including cancellation fines, will be invoiced at the time of cancellation or at the same time as all other organizations, as decided by the SCC Head of Finance.

== 3.3 Organization Restrictions

*3.3.1* A New Organization (as defined in §1.11) is limited to a doghouse booth, blitz booth, or single-story full-size booth, as determined by the Booth Committee.

*3.3.2* Any organization that participated in the most recent Spring Carnival but failed to open its booth for Operations, or failed to complete Tear-Down, may be downsized by one booth size for the following Spring Carnival (two-story to one-story, one-story to blitz, blitz to doghouse), as decided by the Rules Committee.

== 3.4 Member Eligibility

*3.4.1* Only current students who have completed all required training, as determined by EH&S, have been registered with SCC by an organization, and have signed the Spring Carnival Midway Release of Liability may participate in the construction and decoration of a booth.

*3.4.1.1* The organization that registers an individual is responsible for all of that individual's actions on Midway.

*3.4.1.2* In case an individual is a member of multiple organizations, the SCC Chair(s) shall decide the split of responsibility. In making this decision, they should consider which organization they were working for in the incident, if known, and what is the individual’s primary organization, if known.

*3.4.2* Registered builders may help build or tear down other organizations' booths. SCC members may assist any organization with repair, construction, or Tear-Down.

== 3.5 Collaborative Booths

*3.5.1* Two or more organizations may build one booth together, provided plots and themes have not yet been assigned and the Head(s) of Booth give express consent before plots are selected.

*3.5.2* A jointly built booth competes in the same category as a single organization.

*3.5.3* Collaborating organizations must submit an addendum to these Terms by the T&C submission deadline detailing how fines and responsibilities are divided. Any fine not addressed in the addendum will be split evenly among all collaborating organizations.

= §4 Pre-Carnival Requirements

== 4.1 Booth Chair Meetings

*4.1.1* All organizations must send at least one representative to every regularly scheduled Booth Chair meeting from the date of signing these Terms. SCC will provide reasonable advance notice of all meetings.

*4.1.2* Failure to attend any scheduled Booth Chair meeting shall result in a *#usd(fee.meeting) fine per missed meeting.*

== 4.2 Safety Training

*4.2.1* All organizations must supply the required number of representatives to the following mandatory training sessions. Failure to meet attendance requirements results in a fine ranging from *#usd(fee.training) per person* not in attendance, up to and including *denial of Move-On privileges*.

#table(
  columns: 4,
  [Training], [Blitz], [1 Story], [2 Story],
  [Structural], [1 person (min)], [2 people], [2 people],
  [Electrical], [1 person (min)], [2 people], [2 people],
  [Power Tool], [1 person (min)], [2 people], [2 people],
  [Scissor Lift], [Optional], [Optional], [6 people (min)],
  [Fire Extinguisher], [All listed Booth Chairs], [All listed Booth Chairs], [All listed Booth Chairs],
)

== 4.3 Construction Plans

*4.3.1* Organizations must submit construction plans to the Booth Committee by the deadline set by the Booth Committee. Plans must include building, electrical, structural, Move-On, and Tear-Down plans. Plans must meet the quality and detail required by the Booth Committee and SOC.

== 4.4 Booth Theme & Game Design

*4.4.1* All booths must adhere to the overall theme of Spring Carnival. The Spring Carnival Committee shall decide whether an individual booth theme fits within the overall theme. Individual booth themes and games must be family-friendly.

*4.4.2* Any game involving projectiles must ensure all projectiles remain contained within the booth at all times.

== 4.5 Financing

*4.5.1* All booths must be financed by the organization, through Student Activities funds, dues, donations, or fundraisers.

*4.5.2* Corporate logos, names, and promotional items may not be displayed at the booth or awarded as prizes in exchange for receipt of any funds.

= §5 Midway Conduct & Safety

The rules in this section apply throughout Move-On (§6), Build Week (§7), and Tear-Down (§10) unless a specific section states otherwise.

== 5.1 Personal Protective Equipment

*5.1.1* All persons on Midway must wear a hard hat, safety glasses, and closed-toe shoes. They must also be wearing a Builder, Observer, or Non-Building Member wristband issued personally to them by SCC.

*5.1.2* Wristbands, hard hats, and safety glasses, collectively referred to as PPE, can be obtained from SCC by any member eligible to construct a booth as defined in §3.4. Members are encouraged to collect their PPE during PPE Distribution times, but may collect it from the SCC trailer any time during Build Week and Tear-Down.

*5.1.3* Doghouse members should obtain temporary PPE from the SCC trailer anytime they want to be present on Midway.

*5.1.4* Failure to return an SCC-issued hard hat at the end of Spring Carnival shall result in a *#usd(fee.hardhat-lost) fine per hard hat*.

*5.1.5* Returning a defaced hard hat at the end of Spring Carnival shall result in a *#usd(fee.hardhat-defaced) fine per hard hat*. A hard hat is considered defaced if it bears any residue, paint, or color applied after issuance.

== 5.2 Wristband Classifications

*5.2.1 Builder Wristband (Red):* Issued to organization members who have completed all eligibility steps (§3.4). Authorizes the holder to build on Midway.

*5.2.2 Observer Wristband (Yellow):* Issued to non-members (alumni, visitors) who have signed the Spring Carnival Midway Release of Liability. Permits presence on Midway but not participation in any build activity. All observers must be registered by a participating organization, which assumes full organizational responsibility for their conduct.

*5.2.3 Scissor Lift Wristband (Green):* Issued to organization members who have completed Scissor Lift Training (§4.2). Required to check-out and operate a scissor lift.

*5.2.4 Non-Building Member Wristband (Blue):* Issued to members of a non-building organization who have completed the same eligibility steps as an organization member.

== 5.3 PPE Enforcement

*5.3.1* SCC reserves the right to inspect all persons on Midway at any time for PPE and safety.

*5.3.2* Any Authorized Midway Official can remove a member from Midway and revoke their building rights for PPE or safety violations.

*5.3.3* For every occurrence of a person on Midway not wearing proper PPE, a *#usd(fee.ppe) fine per person* shall be assessed.

*5.3.4* For every occurrence of an observer found performing build activities, a *#usd(fee.observer-building) fine* shall be assessed to the organization that registered the observer.

== 5.4 Scissor Lift Rules

*5.4.1* Only builders who have completed Scissor Lift Training (§4.2) and have a green wristband may operate a scissor lift. One untrained builder may be on a scissor lift if accompanied by a trained builder with a green wristband.

*5.4.2* In case of a violation of §5.4.1, the infringing organization shall have all scissor lifts confiscated, and will not be allowed to rejoin the scissor lift queue for 15 minutes. The wait doubles with each further violation (30 minutes, then 60 minutes, and so on).

*5.4.3* Scissor lifts are assigned through the SCC scissor lift queue. Organizations must follow the queue, and SCC may reassign a scissor lift at any time to keep the queue moving. When an organization checks out a scissor lift, SCC will tell the organization how long it may keep the lift. At the end of that time, the organization must return the scissor lift and rejoin the queue. The organization may instead renew the scissor lift with SCC only if no other organization is waiting in the queue.

== 5.5 Prohibited Conduct

*5.5.1* The following are prohibited on Midway at all times during construction phases:

- Smoking or vaping.
- Bicycles, skateboards, scooters, and unauthorized automobiles.
- Open-toe shoes, sandals, slippers, or rollerblades.
- Consumption of alcohol or visible intoxication from alcohol or any impairing substance, including impairing prescription medications

*5.5.2* Any person found on Midway while intoxicated or impaired must leave immediately. The sponsoring organization is subject to penalties as determined by the Rules Committee.

== 5.6 Vehicles on Midway

*5.6.1* No vehicles may be on Midway unless authorized by SCC or the University, such as transport trucks during Move-On, SCC golf carts, or dumpster pickup. No vehicle may be used for construction, demolition, or any booth-related purpose other than transport.

*5.6.2* An organization member found in an unauthorized vehicle on Midway shall receive a *#usd(fee.vehicle) fine per occurrence*.

*5.6.3* Using or attempting to use a vehicle to demolish a booth may result in revoked booth-building privileges and/or additional fines as determined by the Rules Committee.

== 5.7 Property, Cleanliness, and Damage

*5.7.1* Organizations must use proper care and follow all safety protocols during construction, Tear-Down, and related activities. Organizations are responsible for property damage to Midway and to third parties resulting from their negligence or intentional misconduct.

*5.7.2* Light posts, parking meters, and trees may not be used for booth anchorage.

*5.7.3* No permanent marks may be left on the pavement, including nails, paint, or solvents. The fines assessed will be:

- Nails, small paint spill, small solvent spill: *#usd(fee.spill.small)*
- Medium paint spill, medium solvent spill: *#usd(fee.spill.medium)*
- Large paint spill: *#usd(fee.spill.large)*

*5.7.4* Painting, fireproofing, and construction of the booth or booth components are permitted only at the CFA Parking Lot and the organization's designated makerspace area.

*5.7.5* Organizations that damage light posts, parking meters, trees, CFA Parking Lot elements, or SCC property will be assessed a fine equal to the replacement cost. Willful or repeated damage is subject to additional fines as determined by the Rules Committee. CMU Police and relevant university affiliates may assess further penalties independently.

*5.7.6* Any unattributable paint spill damage costs will be shared equally among all organizations using the space where the spill occurred.

*5.7.7* Organizations must keep their plots clean throughout all construction phases. A clean plot means:

- All materials are kept within the organization's plot.
- No excess screws or nails are left on the ground.
- Nothing is stacked against the Midway fence.
- No trash or food is left around the plot.
- Any other reasonable request from SCC is followed.

Failure to maintain daily plot cleanliness shall result in a fine of *#usd(fee.plot-clean) per occurrence.*

*5.7.8* Failure to correctly fill a dumpster at any point during Spring Carnival, including overfilling it past its rim, will result in a fine of *#usd(fee.dumpster) per occurrence*.

== 5.8 Fire Safety

*5.8.1* Fire extinguishers placed throughout Midway by EH&S must remain accessible and in good working order at all times. Any damage or malfunction must be immediately reported to the Watch Shift on duty, a member of SCC, or a University Official.

*5.8.2* Designated fire lanes must be kept clear of obstructions at all times. The only exception is an organization actively working on part of its booth in a fire lane, provided it has enough people present to move that part and all related tools out of the fire lane within a reasonable amount of time. Obstruction of a fire lane shall result in a fine of *#usd(fee.fire-lane) per occurrence.*

== 5.9 Evacuation

*5.9.1* In the event of an SCC-issued or University-issued evacuation order, all persons on Midway must leave promptly. Failure to comply will result in disciplinary action as determined by the Rules Committee.

== 5.10 Tool Accountability

*5.10.1* Missing SCC tools will be fined at #fee.tool-missing-pct% of the current market replacement cost. Organizations may replace a missing tool in lieu of a fine, subject to SCC approval on a case-by-case basis.

*5.10.2* Damaged SCC tools will be fined at amounts determined by SCC based on a percentage of the current market replacement cost. Organizations may replace a damaged tool in lieu of a fine, subject to SCC approval on a case-by-case basis.

= §6 Move-On

The general safety, conduct, and PPE requirements of §5 apply throughout Move-On, except for the PPE exception in §6.3.1. This section covers rules specific to the Move-On period.

== 6.1 Move-On Eligibility

*6.1.1* Only organizations that have had all required paperwork approved, including building plans, may move onto Midway.

*6.1.2* No organization may begin moving onto Midway without approval of an SCC representative present at the site of departure.

== 6.2 Transport Requirements

*6.2.1* No member of an organization may handle or transport booth materials before obtaining a wristband. Members without wristbands must obtain a wristband, which is traditionally available in the UC, before joining the move.

*6.2.2* Organizations must be loaded and ready to move 30 minutes before their assigned wave start time.

*6.2.3* All persons must use sidewalks and crosswalks during transport. Organizations may not cross Forbes Avenue unless a designated traffic controller (CMU Police or SCC-assigned crossguard) is present and signals to proceed.

*6.2.4* No more than 8 people may carry a single item at one time during transport. No more than 6 people may roll a single item at one time during transport.

*6.2.5* Trucks must display the SCC-issued number card on the front windshield at all times during an organization’s Move-On wave. Trucks may only be unloaded in the location designated by the Booth Committee, may not be parked there, and must clear Midway when directed by the truck escort, regardless of whether the truck has been fully unloaded.

*6.2.6* From the end of an organization's Move-On window until the conclusion of the overall Move-On period, the organization's materials must not impede designated fire lanes or other organizations' designated spillover space. Violations shall result in a *#usd(fee.spillover) fine per occurrence.*

== 6.3 Safety During Move-On

*6.3.1* During Move-On, only a wristband is required on Midway, not the full PPE requirements of §5.1. Full PPE is required whenever lifting or carrying materials overhead, on Midway or during transport.

*6.3.2* If Authorized Midway Officials determine that an organization is being unsafe during Move-On, they may require changes to the organization's installation plan to ensure safety on Midway.

= §7 Construction & Build Week

The general safety, conduct, and PPE requirements of §5 apply throughout Build Week. This section covers construction-specific rules.

== 7.1 Construction Standards

*7.1.1* All construction must comply with the Environmental Health and Safety Carnival Construction Standards.

== 7.2 Construction Plans and Deviations

*7.2.1* Organizations must build in strict accordance with their approved construction plans.

*7.2.2* Changing structural or building plans without prior approval shall result in a fine of *up to #usd(fee.plan-change-max) per occurrence*. (as determined by the Rules Committee)

*7.2.3* Failure to comply with an SCC or SOC request to structurally alter a booth shall result in a fine of *up to #usd(fee.structural-max) per occurrence*, and in disqualification and closing of the booth unless it is corrected.

== 7.3 Plot and Space

*7.3.1* All booths must remain within their assigned plot and comply with all height guidelines in the Carnival Construction Standards.

*7.3.2* Plot exchanges must be arranged through and approved by the Head(s) of Booth.

== 7.4 Materials

*7.4.1* The presence of materials constituting a fire hazard, as defined by the Pittsburgh Fire Marshal or EH&S in a booth, may result in disqualification and/or booth closure. All materials must comply with the Fire Safety section of the Construction Standards.

*7.4.2* Any material that becomes detached from the booth shall make the booth subject to investigation by the Booth Committee, the SCC Chair(s), or a designated University representative, and may result in disqualification and/or booth closure.

*7.4.3* Booths are prohibited from having live animals.

*7.4.4* Booths that use water must have their water plan approved by the Booth Committee and SCC Electrical Committee on a case-by-case basis. No water may leave the perimeter of the plot. Leakage deemed excessive will result in disqualification and/or booth closure.

== 7.5 Quiet Hours

*7.5.1* Quiet hours are 10:00 pm to 7:00 am, consistent with the CMU Noise Policy. During quiet hours, no organization may produce noise audible more than 20 feet from their booth.

*7.5.2* Repeated violation of the quiet hours shall result in a *#usd(fee.quiet-hours) fine per occurrence*.

== 7.6 Power and Electrical

*7.6.1* SCC will supply each booth with a 20-ampere GFCI-protected circuit. The maximum draw during construction is 20 amps. Operating current must fall within limits set by the Construction Standards.

*7.6.2* Organizations with non-standard power requirements must discuss them with the SCC Head(s) of Electrical at least two weeks before the first plan review round.

*7.6.3* All wiring must comply with the Carnival Construction Standards as established by the SOC and SCC Electrical Committee.

*7.6.4* All wiring must be inspected and approved by the SCC Electrical Committee before being connected to power. Any subsequent change to wiring must be re-inspected and approved before reconnection.

*7.6.5* Connecting wiring to power or wiring an input plug without prior approval shall result in a *#usd(fee.wiring) fine per occurrence*.

*7.6.6* Actions resulting in an unsafe electrical condition shall result in an up to *#usd(fee.electrical-max) fine* (as determined by SCC Electrical Committee, appealable to Rules Committee).

*7.6.7* All organizations will be supplied with an outlet box no later than 9:00 am on Day 2, and it will not be removed before 10:00 pm on Day 9. Organizations are responsible for their outlet box and will be charged the replacement cost for any damage.

*7.6.7.1* If a power box is damaged and no organization can be shown to be solely at fault, all organizations sharing it will be charged #usd(fee.power-box).

*7.6.8* Any organization that causes a circuit breaker to trip through willful or repeated misuse will be fined *#usd(fee.breaker) per occurrence* (as determined by SCC Electrical Committee).

*7.6.9* Cables may be run by the SCC Electrical Committee along any and all edges of booths and must remain accessible at all times. No material may be stored on or above cables.

*7.6.10* SCC will make best efforts to maintain continuous power to all booths. The SCC Electrical Committee may disconnect power to any booth for safety or emergency reasons.

*7.6.11* Organizations may not tamper with SCC power distribution system connectors, cables, or devices other than their own outlet box unless an emergency requires disabling them to protect persons or property.

*7.6.12* Organizations must maintain a 36-inch clear space at either end of all power distribution units at all times, per NEC panel clearance requirements. Items may not be placed on top of power distribution units. Repeated violations may result in fines as determined by SCC Chair(s) and Head(s) of Electrical.

== 7.7 Inspections

*7.7.1* All inspections by the Booth Committee, SCC Electrical Committee, FMS, EH&S, or the SOC are mandatory, whether scheduled or not, and may happen at any time during Build Week.

*7.7.2* Each booth must pass all inspections before being cleared for Operations. Failure of any inspection may result in loss of operating privileges and additional Rules Committee penalties until all deficiencies are resolved.

== 7.8 Pre-Opening Ceremony Deadline

*7.8.1* All booth construction and decoration must stop by 12:00 pm on Day 7. Plots must be cleaned by 1:00 pm on Day 7. No extensions will be permitted.

*7.8.2* Organizations that continue building after Midway closes for the Opening Ceremony on Day 7 will be disqualified.

*7.8.3* After 1:00 pm on Day 7, no material (except tools) may be moved onto Midway without the explicit approval of SCC Chair(s), SCC Assistant Chair(s) or Head(s) of Booth.

*7.8.4* Organization members may remain on Midway after 1:00 pm on Day 7 for last-minute fixes and clearing of their plots. Organization members must be fully clear of their plot, with all tools and materials completely out of sight, no later than 1 hour before the Opening Ceremony.

= §8 Carnival Operations

== 8.1 Hours of Operation

*8.1.1* Booths must be open and staffed during the following hours:

- Day 7 (Thursday): 3:00 pm\* to 11:00 pm (\*Opening time to be determined by SCC Chairs and University Stakeholders)
- Day 8 (Friday): 11:00 am to 11:00 pm
- Day 9 (Saturday): 11:00 am to 11:00 pm

*8.1.2* Any booth not cleared for Operations by the Opening Ceremony will be disqualified.

*8.1.3* All booths must be closed and vacated during the Awards Ceremony.

== 8.2 Staffing

*8.2.1* Blitz booths must be staffed by between one and two organization members during Operations. One-story and two-story booths must be staffed by exactly two organization members, one at the entrance and one at the exit. Doghouse booths are not required to be staffed.

*8.2.2* Organization members may not be inside their booth outside of operational hours, except for during a 15-minute window before and after each operational period for opening and closing purposes.

*8.2.3* People staffing booths are responsible for ensuring that posted occupancy limits are observed at all times:

- 1st violation: #usd(fee.occupancy.at(0)) fine
- 2nd violation: #usd(fee.occupancy.at(1)) fine
- 3rd violation: Disqualification

== 8.3 Downtime

*8.3.1* Each booth is permitted up to four hours of downtime per operational day (Thursday, Friday, and Saturday). The Midway Coordinator must be notified before any downtime period begins and ends. The Midway Coordinator is not responsible for proactively informing an organization about their remaining downtime.

*8.3.2* Downtime may not be taken during the first hour following the Opening Ceremony. Taking downtime during that hour results in disqualification. Organizations that take downtime during scheduled judging hours may choose to be judged, if two people are present, or to lose judging points as specified in the judging rubric.

*8.3.3* Exceeding four hours of downtime in a single operational day shall result in disqualification or a fine as determined by the Rules Committee.

*8.3.4* Taking downtime without notifying the Midway Coordinator shall result in a fine as defined below:

- 1st violation: #usd(fee.downtime-notice.at(0))
- 2nd violation: #usd(fee.downtime-notice.at(1))
- 3rd and subsequent: #usd(fee.downtime-notice.at(2))

*8.3.5* If a booth must take downtime but has no downtime remaining, the organization will be disqualified or face a fine as determined by the Rules Committee, in addition to any penalty under §8.3.4.

*8.3.6* Bringing material onto or removing material from Midway requires downtime to be declared before movement begins. The only exception is consumable operating items (prizes, batteries, etc.).

== 8.4 Night Closing Procedure

*8.4.1* At closing time each night (Days 7, 8, and 9), Midway will be cleared of all persons except two members per organization. Those two members will have 15 minutes to remove items designated as valuables per §2.1.5.

*8.4.2* Members found on Midway without permission from SCC Chair(s) or Assistant Chair(s) during closed hours (Day 7 through Day 10) shall result in a *#usd(fee.closed-hours) fine per person* to the booth they were acting on behalf of, or their primary organization.

== 8.5 Midway Watch Shifts

*8.5.1* The Booth Committee will assign Watch Shifts to all organizations. Blitz booths shall be assigned half the number of Watch Shifts as a full-size organization. Doghouses shall be assigned a quarter of the number of Watch Shifts as a full-size organization.

*8.5.2* All organizations must staff their assigned Watch Shift with at least two members who are eligible to build. Watch Shift participants must arrive sober and before their assigned start time, and must remain at their post until formally dismissed by the Midway Coordinator.

*8.5.3* Watch Shift participants are directly responsible for all duties assigned by the Midway Coordinator, including reporting any suspicious activity. A Watch Shift Responsibility document will be distributed to all organizations prior to Build Week.

*8.5.4* An organization that cancels its booth after Watch Shifts have been assigned remains responsible for completing those shifts or will face the associated penalties below.

*8.5.5* Failure to comply with duties listed in the Watch Shift Responsibility document or assigned by the Midway Coordinator shall result in a *minimum #usd(fee.watch-duty-min) fine per violation.*

*8.5.6* Leaving an assigned Watch Shift post before being dismissed by the Midway Coordinator shall result in a *#usd(fee.watch-leave) fine per person.*

*8.5.7* Organizations may volunteer for early morning Watch Shifts and are eligible for incentives as determined by SCC.

*8.5.8* Watch Shift fines (violations are counted per Watch Shift):

#table(
  columns: 3,
  [Violation \#], [Tardiness (\<15 min)], [Missed (\>15min)],
  ..range(3)
    .map(i => (
      [#("1st", "2nd", "3rd").at(i)],
      [#usd(fee.watch-late.at(i)) / person],
      [#usd(fee.watch-missed.at(i)) / person],
    ))
    .flatten(),
  [4th+],
  [Rules Committee (min #usd(fee.watch-late-min-4th) / person)],
  [Rules Committee (min #usd(fee.watch-missed-min-4th) / person)],
)

*8.5.9* If an organization arrives more than 15 minutes late but still completes at least half of the shift, the missed-shift fines for that violation are halved.

*8.5.10* Any Watch Shift that the Midway Coordinator determines reported intoxicated will be sent home. The organization must promptly send a sober replacement. If no replacement is sent, the organization will be fined as if the shift was entirely missed.

== 8.6 Food and Prizes

*8.6.1* No organization may prepare or sell food on Midway at any time during Carnival. Any food or consumable item given to visitors must be approved in advance by the Head(s) of Booth. A separate concessions contract may override this clause.

*8.6.2* All booths are prohibited from awarding money as a prize.

== 8.7 Intoxicated Booth Staffing

*8.7.1* Any booth found staffed by an intoxicated person must immediately take downtime until a sober replacement arrives. Fines:

- 1st violation: #usd(fee.intox-staff.at(0))
- 2nd violation: #usd(fee.intox-staff.at(1))
- 3rd and subsequent: Rules Committee

= §9 Judging

== 9.1 General

*9.1.1* All booths will be judged according to scoring rubrics developed by the Booth Committee and approved by the Rules Committee. Rubrics will be distributed to all organizations before the start of the spring semester.

*9.1.2* Judges will be CMU faculty, staff, alumni, or others deemed qualified by the Head(s) of Booth.

== 9.2 Schedule and Scoring

*9.2.1* All booth judging takes place on Day 8 (Friday). SCC is not responsible for providing organizations with a specific judging time; a published date and judging window constitute sufficient notice.

*9.2.2* Booths are judged twice on Day 8: daytime judging in daylight, and nighttime judging after dark, when lighting and night effects are evaluated. Nighttime judging accounts for *30%* of the total score; daytime judging accounts for *70%*.

*9.2.3* Visible construction equipment or unsightly elements present during Operations shall result in a *1% judging point deduction per occurrence*. This shall be decided by the Rules Committee.

== 9.3 Downtime During Judging

*9.3.1* If a booth is on downtime when judges arrive, the organization may choose either to be judged in its current condition or to waive judging for that visit.

*9.3.2* If no members of an organization are present, it will be assumed that the organization accepts receiving no points for that judging slot.

== 9.4 Doghouse Judging

*9.4.1* The Doghouse judging format will be determined by the Head(s) of Booth and the SCC Chair(s) and announced at the final Doghouse Booth Chair meeting.

= §10 Tear-Down

The general safety, conduct, and PPE requirements of §5 apply throughout Tear-Down. This section covers Tear-Down-specific rules.

== 10.1 Schedule and Staffing

*10.1.1* All organizations must begin tearing down between 8:00 am and 10:00 am on Day 10. All plots must be completely clean by 6:00 pm on Day 10.

*10.1.2* Full-size booths must have at least 5 members present on Midway until demolition is complete. Failure to have 5 members present by 10:00 am shall result in a *#usd(fee.teardown-crew-full) fine per missing person*.

*10.1.3* Blitz booths must have at least 2 members present until demolition is complete. Failure to have 2 members present by 10:00 am shall result in a *#usd(fee.teardown-crew-blitz) fine per missing person*.

== 10.2 Late Tear-Down Fines

*10.2.1* Organizations whose plots are not clean by 6:00 pm on Day 10 will be fined:

- *#usd(fee.late-teardown.at(0)) per minute* from 6:00 pm to 7:00 pm
- *#usd(fee.late-teardown.at(1)) per minute* from 7:00 pm to 8:00 pm
- *#usd(fee.late-teardown.at(2)) per minute* after 8:00 pm

*10.2.2* Organizations remaining after 8:00 pm will be considered for disqualification from awards and may be downsized the following year under §3.3.2, as decided by the Rules Committee.

== 10.3 Demolition and Disposal

*10.3.1* Each booth must be completely demolished. No vehicle may be used to demolish a booth; vehicles may only transport supplies.

*10.3.2* All non-salvageable building material must be disposed of in the appropriate dumpster by 4:00 pm on Day 10. Dumpsters are removed from Midway starting at 4:30 pm.

*10.3.3* At the conclusion of Tear-Down, no booth materials may remain on Midway, in any material overflow areas, or anywhere on campus outside the organization's designated storage facility.

== 10.4 Plot Inspection

*10.4.1* Organizations must notify a Booth Committee member upon completing demolition to have a final plot inspection. Leaving Midway without passing a plot inspection will result in fines determined by the Rules Committee.

== 10.5 Safety During Tear-Down

*10.5.1* If Authorized Midway Officials determine that an organization is being unsafe during Tear-Down, they may require changes to the organization's Tear-Down plan to ensure safety.

= §11 Penalties & Appeals

== 11.1 Purpose

*11.1.1* The purpose of penalties is to provide restitution for costs associated with violations, discourage unsafe or unsportsmanlike behavior, and ensure the appropriate operation of Spring Carnival.

== 11.2 Invoicing

*11.2.1* All fines, together with the entry fee, will be invoiced no more than 2 weeks after Tear-Down. Fines resulting from cancellation may be invoiced at the time of cancellation.

*11.2.2* Upon incurring a fine, the organization's Booth Chair or designated representative shall be notified promptly via Binder. The organization may add any additional details about the fine in Binder, which SCC will consider when reviewing fines and appeals.

*11.2.3* Organizations with outstanding fines are prohibited from participating in future Spring Carnivals until all fines are resolved.

== 11.3 Payment

*11.3.1* All payments are made via the organization's University Account. No additional action is required for organizations housed in Student Affairs (SIT, Greek Life, Student Life).

*11.3.2* Organizations housed outside Student Affairs must provide an oracle string to the SCC Treasurer.

*11.3.3* 14 days after the invoice date, SIT Finance will debit the organization's University Account on behalf of SCC without further approval.

== 11.4 Appeals

*11.4.1* Organizations have *14 days* from the date of their invoice to submit a written appeal to the SCC Chairs. Email constitutes a written appeal.

*11.4.2* If an organization is unable to fund a fine, it will face alternative disciplinary action as determined by the Rules Committee.

*11.4.3* The SCC Chair(s) review each appeal and respond in writing before the debit date. If the organization disagrees with the response, it may ask the Rules Committee to decide. The Rules Committee's decision is final.

== 11.5 Missed Deadlines

*11.5.1* For each submission deadline missed an organization shall be fined as follows:

- Less than 24 hours late: #usd(fee.deadline.at(0))
- 24 to 48 hours late: #usd(fee.deadline.at(1))
- More than 48 hours late: #usd(fee.deadline.at(2)) per day

== 11.6 Fine Schedule

_All fines in these Terms are consolidated below for reference. In the event of any conflict between this table and the relevant section, the relevant section governs._

#table(
  columns: (auto, 1fr, 1fr),
  [*Section*], [*Violation*], [*Fine*],
  [§3.2.2],
  [Cancellation, first day of fall classes to the Start of Spring Break],
  [#usd(fee.cancel.doghouse) doghouse, #usd(fee.cancel.blitz) blitz, #usd(fee.cancel.full) one- or two-story, plus forfeited entry fee],

  [§3.2.3], [Cancellation after the Start of Spring Break], [The §3.2.2 fine, #times(fee.cancel-late-multiplier)],
  [§3.5.3], [Collaboration fines not covered by the addendum], [Split evenly],
  [§4.1.2], [Missed Booth Chair meeting], [#usd(fee.meeting) per meeting],
  [§4.2.1], [Missing required trainee], [#usd(fee.training) per person, up to denial of Move-On],
  [§5.1.4], [Hard hat not returned], [#usd(fee.hardhat-lost) per hard hat],
  [§5.1.5], [Defaced hard hat], [#usd(fee.hardhat-defaced) per hard hat],
  [§5.3.3], [Person on Midway without proper PPE], [#usd(fee.ppe) per person],
  [§5.3.4], [Observer doing build activities], [#usd(fee.observer-building) per occurrence],
  [§5.4.2], [Untrained scissor lift operator], [Lifts confiscated, 15 min queue ban, doubling],
  [§5.6.2], [Member in an unauthorized vehicle on Midway], [#usd(fee.vehicle) per occurrence],
  [§5.7.3], [Nails, small paint or solvent spill], [#usd(fee.spill.small)],
  [§5.7.3], [Medium paint or solvent spill], [#usd(fee.spill.medium)],
  [§5.7.3], [Large paint spill], [#usd(fee.spill.large)],
  [§5.7.5], [Damage to Midway or SCC property], [Replacement cost; more if willful or repeated],
  [§5.7.6], [Unattributed paint spill damage], [Shared among organizations using the space],
  [§5.7.7], [Plot not kept clean], [#usd(fee.plot-clean) per occurrence],
  [§5.7.8], [Dumpster filled incorrectly, any time during Spring Carnival], [#usd(fee.dumpster) per occurrence],
  [§5.8.2], [Fire lane obstructed], [#usd(fee.fire-lane) per occurrence],
  [§5.10.1], [Missing SCC tool], [#fee.tool-missing-pct% of replacement cost],
  [§5.10.2], [Damaged SCC tool], [Percentage of replacement cost],
  [§6.2.6], [Blocking fire lanes or spillover space after your Move-On window], [#usd(fee.spillover) per occurrence],
  [§7.2.2], [Changing structural or building plans without approval], [Up to #usd(fee.plan-change-max) per occurrence],
  [§7.2.3],
  [Ignoring an SCC or SOC structural change request],
  [Up to #usd(fee.structural-max) per occurrence, closure until fixed],

  [§7.5.2], [Repeated quiet hours violation], [#usd(fee.quiet-hours) per occurrence],
  [§7.6.5], [Unapproved wiring connected to power], [#usd(fee.wiring) per occurrence],
  [§7.6.6], [Unsafe electrical condition], [Up to #usd(fee.electrical-max)],
  [§7.6.7.1], [Damaged shared power box, no one at fault], [#usd(fee.power-box) per organization],
  [§7.6.8], [Willful or repeated breaker trip], [#usd(fee.breaker) per occurrence],
  [§7.6.12], [Repeated power distribution clearance violation], [Set by SCC Chair(s) and Head(s) of Electrical],
  [§8.2.3], [Occupancy limit violation], [#usds(fee.occupancy, sep: ", then "), then disqualification],
  [§8.3.3], [More than four hours of downtime in a day], [Disqualification or Rules Committee fine],
  [§8.3.4], [Downtime without notifying the Midway Coordinator], [#usds(fee.downtime-notice, sep: ", then ")],
  [§8.3.5], [Downtime with none remaining], [Disqualification or Rules Committee fine],
  [§8.4.2], [On Midway during closed hours without permission], [#usd(fee.closed-hours) per person],
  [§8.5.5], [Not doing Watch Shift duties], [Minimum #usd(fee.watch-duty-min) per violation],
  [§8.5.6], [Leaving Watch Shift post early], [#usd(fee.watch-leave) per person],
  [§8.5.8],
  [Late to Watch Shift (under 15 min)],
  [#usds(fee.watch-late), then min #usd(fee.watch-late-min-4th) per person],

  [§8.5.8],
  [Missed Watch Shift (over 15 min late)],
  [#usds(fee.watch-missed), then min #usd(fee.watch-missed-min-4th) per person],

  [§8.5.10], [Intoxicated Watch Shift, no replacement sent], [Same as a missed shift],
  [§8.7.1], [Intoxicated booth staff], [#usds(fee.intox-staff, sep: ", then "), then Rules Committee],
  [§10.1.2],
  [Fewer than 5 members at Tear-Down by 10 am (full-size)],
  [#usd(fee.teardown-crew-full) per missing person],

  [§10.1.3], [Fewer than 2 members at Tear-Down by 10 am (blitz)], [#usd(fee.teardown-crew-blitz) per missing person],
  [§10.2.1],
  [Plot not clean by 6 pm on Day 10],
  [#usd(fee.late-teardown.at(0))/min to 7 pm, #usd(fee.late-teardown.at(1))/min to 8 pm, #usd(fee.late-teardown.at(2))/min after],

  [§11.5.1],
  [Missed submission deadline],
  [#usd(fee.deadline.at(0)) under 24 h, #usd(fee.deadline.at(1)) at 24 to 48 h, #usd(fee.deadline.at(2)) per day after],

  [§A.1.2], [Concessions stand closed during approved hours], [#usd(fee.concessions-hour) per hour],
  [§A.2.4], [Listed concessions item not available], [Up to the concessions fee],
  [§A.3.2], [Health permit not submitted on time], [#usd(fee.permit)],
)

= CONCESSIONS SUPPLEMENT TERMS AND CONDITIONS OF PARTICIPATION

The following terms apply to each student organization operating a concessions stand at Carnegie Mellon Spring Carnival. By signing below, the organization agrees to be bound by these terms in addition to the main Booth Terms and Conditions.  The Head(s) of Booth are the primary liaison between the concessions organization and SCC. The sections listed in §A.7 do not apply to concessions stands.

*This organization, \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ , hereby declares itself:*

*\_\_\_\_\_\_ Fraternity              \_\_\_\_\_\_ Sorority              \_\_\_\_\_\_ Independent*

*\_\_\_\_\_\_ Blitz              \_\_\_\_\_\_ Doghouse*

*This organization hereby agrees to comply with the Terms and Conditions of Participation set forth below as well as any and all applicable federal, state and local laws. One or more of the signers has authority to sign documents on behalf of the organization.*

#signatures("Booth Chair", "Booth Chair", "Booth Chair", "Head(s) of Booth")

#page-breaks(false)

= §A.1 Operations

*A.1.1* A concessions stand is considered "in operation" if it is sufficiently staffed and supplied to serve at least half of its listed menu items.

*A.1.2* Organizations must choose their hours of operation and obtain approval from SCC and the Head(s) of Booth by the Start of Spring Break. Organizations must operate for the entirety of their chosen hours. Failure to operate during approved hours: *#usd(fee.concessions-hour) fine per hour not in operation.*

*A.1.3* Organizations may optionally operate during the hour directly before and/or after their designated hours each day. No stand may begin operation before Midway opens.

*A.1.4* The three hours before the stand opens on Days 7, 8, and 9 are designated as set-up time. This does not supersede any construction or general Midway requirements.

= §A.2 Product Exclusivity

*A.2.1* SCC grants organizations partial exclusivity on approved items. A complete product list must be submitted to SCC by the Start of Spring Break. If two organizations list the same product, exclusivity is granted by: (1) the organization that sold the product the previous year; (2) the organization that submitted its list first. SCC has final say on whether two items are the same.

*A.2.2* Organizations may add items to their product list at any time, provided no other organization already holds exclusivity for that item.

*A.2.3* Removing a product from the list after the Start of Spring Break requires SCC approval. Removal without approval will result in forfeiture of the concessions fee and security deposit.

*A.2.4* Organizations must make a reasonable effort to have all listed items available for the full duration of their operations. Failure without prior SCC approval: fine up to the amount of the concessions fee, at SCC's discretion.

= §A.3 Health and Safety Compliance

*A.3.1* Organizations must obtain a food permit from the Allegheny County Health Department (ACHD). The permit must be displayed visibly at all times while the stand is operating. The stand is subject to ACHD inspection at any time.

*A.3.2* A copy of all required health permits must be submitted to the Head(s) of Booth and EH&S no later than Day 6 at 5:00 pm. Failure to submit the permit shall result in a *#usd(fee.permit) fine.*

*A.3.3* If an organization fails an ACHD inspection, it must immediately fix all deficiencies or shut down the stand.

*A.3.4* If found non-compliant with ACHD regulations by ACHD or SCC, the organization must close until all issues are resolved.

*A.3.5* ACHD requirements take precedence over these Terms in any conflict. The organization must immediately notify SCC of any such conflict. SCC assumes no responsibility for ACHD requirements.

= §A.4 Plot and Utilities

*A.4.1* Parking provisions by plot size are:

- *Double-size plot:* parking for a storage trailer and vehicle.
- *Full-size plot:* one parking space for a vehicle or storage trailer.
- *Blitz-size plot:* a parking space may be purchased for #usd(fee.parking-blitz).
- *Table-size plot:* no parking provided.

*A.4.2* Organizations will be provided a water hook-up from 8:00 am on Day 2 until 5:00 pm on Day 10, unless alternative arrangements are made with FMS and/or SCC in advance.

= §A.5 Cancellation

*A.5.1* If the organization cancels its stand without SCC Chair approval at any time, the concessions fee is forfeited.

*A.5.2* If cancellation is reported fewer than three weeks before Move-On without SCC Chair approval, the security deposit is also forfeited.

= §A.6 Night Closing Procedure

*A.6.1* At closing time on Days 7, 8, and 9, power to the stand will remain on, and cleanup may begin. All persons associated with the organization must vacate the plot within three hours of the stand's closing time.

= §A.7 Inapplicable Sections

*A.7.1* The following sections of the main Terms do not apply to concessions stands: §9 (Judging), §7.4.4 (water use rules), §8.3.6 (downtime for material transport), and §8.2.1 (staffing limits).

*A.7.2* The Head(s) of Booth are the primary liaison between the concessions organization and SCC. All sections not listed in §A.7.1 apply in full.
