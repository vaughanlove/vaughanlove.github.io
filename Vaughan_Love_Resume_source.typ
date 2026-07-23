#set document(title: "Vaughan Love — Resume", author: "Vaughan Love")
#set page(
  paper: "us-letter",
  margin: (x: 1.5cm, y: 1.4cm),
)
#set text(font: "Liberation Sans", size: 9.5pt, fill: rgb("#222222"))
#set par(justify: false, leading: 0.55em)
#show link: it => underline(it)

// ---- Helpers ----
#let section(title) = {
  text(size: 11pt, weight: "bold", fill: black, upper(title))
  line(length: 100%, stroke: 0.6pt + black)
}

#let entry(role, org, place, dates) = {
  block(above: 6pt, below: 4pt)[
    #grid(
      columns: (1fr, auto),
      align: (left, right),
      [#text(weight: "bold")[#role] #h(3pt) | #h(3pt) #org #h(3pt) | #h(3pt) #emph(place)],
      [#text(fill: rgb("#555555"))[#dates]],
    )
  ]
}

#let bullets(..items) = {
  set list(indent: 4pt, body-indent: 5pt, marker: [•])
  for it in items.pos() [ #list.item(it) ]
}

// ---- Header ----
#align(center)[
  #text(size: 20pt, weight: "bold")[Vaughan Love] \
  #v(2pt)
  #text(size: 9pt)[
    London, England #h(4pt)|#h(4pt)
    #link("mailto:vaughan.e.love@gmail.com")[vaughan.e.love\@gmail.com] #h(4pt)|#h(4pt)
    #link("https://github.com/vaughanlove")[github.com/vaughanlove] #h(4pt)|#h(4pt)
    #link("https://vaughan.love/")[vaughan.love]
  ]
]

// ---- Objective ----
#section("Objective")
Founding/full-stack engineer who ships production AI products end-to-end, from GPU infra to frontend.

// ---- Experience ----
#section("Experience")

#entry("Founding Engineer", link("https://www.acuity-technologies.com/")[Acuity Technologies], "Cambridge, UK", "02/2026 – Present")
#bullets(
  [Collaborate directly with a cross-disciplinary team to design and implement novel biotech workflows integrating AI.],
  [Ownership across the entire stack.],
)

#entry("Software Engineer (Full Stack)", link("https://cumming.ucalgary.ca/centres/centre-health-informatics")[Centre for Health Informatics], "Calgary, Alberta", "01/2024 – Present")
#bullets(
  [Built the software platform that anchored a successful \$1M+ CAD grant application; contributed to and managed the technical budget.],
  [Created #link("https://recens.app")[recens.app], a qualitative research platform for AI-assisted policy document review with a strong design emphasis on human-in-the-loop. Reduced man-hours by 60% compared to legacy platforms, saving an estimated \$8–11K CAD per review. Self-hosted GPUs for document OCR and LLM hosting.],
  [Developed and maintained #link("https://atlas.mh2c.org")[atlas.mh2c.org], a global refugee health app. Frontend developed with Remix and React (TypeScript), hosted on Azure. Postgres backend.],
  [Interfaced directly with non-technical teams (internal, independent research teams, World Health Organization) to build products from ideation to deployment. Weekly collaboration with stakeholders to establish design, functionality, and timelines.],
  [Orchestrated external technical consultants to develop #link("https://mh2c.org")[mh2c.org].],
)

#entry("Quantitative Developer", "Feta Markets", "Remote", "05/2022 – 10/2022")
#bullets(
  [Cleaned and preprocessed hundreds of millions of rows of data using pandas (Python).],
  [Back-tested different options writing strategies to mitigate platform risk.],
)

#entry("Junior Data Analyst", "Global Predictions", "San Francisco", "06/2021 – 01/2022")
#bullets(
  [Programmatic data analysis of a massive set of macroeconomic features using Python.],
)

#entry("Undergraduate Researcher", "University of Calgary", "Calgary, Alberta", "05/2021 – 08/2021")
#bullets(
  [Analyzed 3D robotics data from the KINARM exoskeleton to research the impact of vision on proprioception recovery in stroke patients. Analysis in MATLAB and Python.],
)

// ---- Education ----
#section("Education")
#block(above: 4pt)[
  #text(weight: "bold")[Queen's University], BASc Applied Mathematics Engineering \
  Major: Applied Mathematics #h(3pt)|#h(3pt) Minor: Computing
]

// ---- Activities ----
#section("Activities")

#grid(
  columns: (1fr, auto),
  align: (left, right),
  [#text(weight: "bold")[Personal Projects] — all available at #link("https://github.com/vaughanlove")[github.com/vaughanlove]],
  [#text(fill: rgb("#555555"))[2019 – Present]],
)
#v(3pt)
#bullets(
  [*Currently:* Sigil, a consent layer to facilitate moving health records P2P while staying compliant.],
  [#link("https://github.com/vaughanlove/stsr")[strongly typed symbolic regression] — project. *Jul 2025*],
  [#link("https://github.com/vaughanlove/zk-sudoku")[Zero Knowledge Sudoku] — project, prove a board is complete without exposing the user's input. *Jan 2025*],
  [#link("https://www.linkedin.com/posts/crossmint-io_a-glimpse-into-the-future-of-ai-agents-activity-7259244986221621248-hQoE")[BetMore] — rabbit capital hackathon, wager app for trivia questions using LLMs and stablecoins. *Nov 2024*],
  [#link("https://www.youtube.com/watch?v=j5EfYJh91fI")[malaconnect] — founding engineer, healthcare navigation for elders. *Apr 2024*],
  [pintxo — founding engineer, API for developers to execute on-chain functions from language. *Feb 2024*],
  [gecover — hackathon, a cover letter generator from LinkedIn URLs. *Nov 2023*],
  [#link("https://github.com/vaughanlove/promptbreeder")[promptbreeder] — project, google deepmind prompt optimization paper implemented in python. Used by Cambridge researchers. *Oct 2023*],
  [#link("https://www.youtube.com/watch?v=wVjsfjDe14o")[ezserve] — Square + Google hackathon, embedded AI tableside restaurant waiter built to run on a Raspberry Pi. *Sep 2023*],
  [#link("https://github.com/vaughanlove/MojoDAO")[mojodao] — project, subscription program for the Solana blockchain. *Aug 2021*],
)

#grid(
  columns: (1fr, auto),
  align: (left, right),
  [#text(weight: "bold")[Breakpoint Global Fellow]],
  [#text(fill: rgb("#555555"))[11/2021]],
)
#v(3pt)
#bullets(
  [Developed subscription infrastructure for the Solana developer ecosystem and was sponsored to attend breakpoint 2021.],
)

#grid(
  columns: (1fr, auto),
  align: (left, right),
  [#text(weight: "bold")[Tech Lead]],
  [#text(fill: rgb("#555555"))[08/2020 – 03/2021]],
)
#v(3pt)
#bullets(
  [Developed NOTIFAI, an AI notification manager while in QMIND. Presented nationally at CUCAI.],
)

// ---- Skills ----
#section("Skills & Abilities")
#block(above: 4pt)[
  *Languages:* Python, TypeScript, JavaScript, Rust \
  *Frameworks:* React, TanStack, Remix, Flask, FastAPI, Pydantic \
  *Infrastructure & Tools:* Docker, AWS, Azure, Cloudflare, Railway, PlanetScale, Postgres, Redis, vLLM \
  *AI/ML:* Language models, OCR, self-hosted GPU inference, pgvector
]
