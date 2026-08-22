---
name: process-inbox
description: Sort files out of "00 Inbox" into the right topic folder and generate/update flashcards for them. Use when the user says "process my inbox", "clear the inbox", "sort the inbox", or names specific inbox files to file away.
---

# Process Inbox

Takes files sitting in `00 Inbox/` — the output of a research session (source
PDFs the user read and annotated) — and:

1. Files each one into the right subfolder under the right subject.
2. Writes flashcards for the concepts covered, into the centralized
   `50 Flashcards/` deck for that topic.

This is always run manually and always confirmed before it writes anything.
Never invoked automatically, never runs unattended.

## Vault model (read this before doing anything else)

- **Subjects** are the five numbered top-level folders: `05 Coding`,
  `07 Math`, `10 ML`, `20 Finance`, `30 Platforms`. This list is fixed and
  deliberate — do not add a sixth without asking (see Step 2).
- **Topics** are subfolders (sometimes one level under a grouping folder,
  e.g. `07 Math/Statistics/p-values`, `20 Finance/data analysis/sample
  weights`) named after the concept, lowercase, space-separated
  (`cross validation`, `gradient boosting`, `dimensionality reduction`).
  A topic folder holds the source PDF(s)/notes for that one concept only.
- **Flashcards live centrally**, not next to the source files: one file per
  topic in `50 Flashcards/<Subject Label> - <topic>.md`, where `<Subject
  Label>` is the Title-Case subject name matching the `subject:` frontmatter
  used elsewhere (`ML Concepts`, `Math`, `Finance`, `Coding`, `Platforms`).
- **Deck format**, matching every existing file in `50 Flashcards/`:

  ```
  ---
  subject: <Subject Label>
  topic: <topic folder name>
  ---

  #flashcards/<subject-slug>/<topic-slug>

  <Question>
  ?
  <Answer>

  ---

  <Question>
  ?
  <Answer>
  ```

  Do not add `<!--SR:...-->` lines yourself — the spaced-repetition plugin
  adds those the first time a card is reviewed.
- **`50 Flashcards/00 Index.md`** has a live dataviewjs coverage table
  (topic folders vs. decks that exist for them) — no action needed from you,
  it updates itself, but it's a useful sanity check after a run.
- **`40 Sources/`** (`Books/`, `Papers/`, `Notes/`) is a *citation library*
  for whole external documents (a full book, a full paper) that aren't
  specific to one topic. It is a different naming convention (Author Title,
  proper casing preserved) and out of scope for the naming rules below.

## Naming conventions (for anything this skill creates or moves)

- **New topic folder names**: lowercase, space-separated, acronyms
  lowercased too (`hmm`, not `HMM`; `pca`, not `PCA`) — matches every
  existing topic folder.
- **Moved file names**: normalize to the same rule — lowercase, spaces
  (`HMM Pb1.pdf` → `hmm pb1.pdf`, `Log Loss.pdf` → `log loss.pdf`). This
  applies only to files this skill moves; never touch filenames elsewhere
  in the vault as a side effect of an unrelated run.
- **Flashcard tag slug**: `#flashcards/<subject-slug>/<topic-slug>`, both
  segments lowercase, hyphen-separated, acronyms lowercased. Subject-slug
  comes from the *subject* the file lives under, never from a grouping
  folder (e.g. a Finance topic gets `finance/...`, not `data-analysis/...`).
  Subject-slug table: `05 Coding`→`coding`, `07 Math`→`math`,
  `10 ML`→`ml`, `20 Finance`→`finance`, `30 Platforms`→`platforms`.
- **No prose concept notes.** Some older topics have hand-written `.md`
  concept notes with `[[wikilinks]]` between them (e.g. `bagging.md`) —
  that practice is discontinued. This skill produces flashcards only.

## Step 1 — Resolve the batch

- No argument: process every file currently in `00 Inbox/`.
- Free-text argument (e.g. `/process-inbox the HMM files`): match it against
  the actual filenames in `00 Inbox/` and confirm you've got the right
  subset before continuing (list what matched).
- If the inbox is empty (or the filter matches nothing), say so and stop.

## Step 2 — Draft one plan for the whole batch

For the resolved batch:

1. Group files that belong together (e.g. `HMM.pdf` + `HMM Pb1/2/3.pdf` are
   one topic; unrelated PDFs are separate groups). Use filename and content
   to judge grouping — open each PDF if the filename alone doesn't make the
   grouping obvious.
2. For each group, decide the target subject + topic folder:
   - Search existing topic folders (and `50 Flashcards/00 Index.md` for a
     second signal) for a fuzzy/semantic match first — e.g. a new file
     about early-stopping belongs in an existing `regularization` topic,
     not a new one.
   - If a strong existing match exists, propose adding to it.
   - If no existing topic fits, propose a new topic folder (name per the
     convention above) under the subject you judge correct.
   - If a group doesn't fit any of the five existing subjects at all,
     **stop and ask the user** which subject it belongs under (or whether
     to create a new one) — do not create a sixth top-level subject
     unilaterally.
3. Assemble the full plan: for every group, show source file(s) → target
   folder (existing or new, and which) → subject. Only ask the user about
   individual groups where the match is genuinely ambiguous (multiple
   plausible existing topics, or unclear whether it's a new topic vs. an
   addition to an existing one) — don't ask about groups that are obvious.
4. Present the complete plan and get one confirmation/edit pass before
   moving anything.

## Step 3 — Execute the plan

Once confirmed, for each group:

1. Create the topic folder if it's new (lowercase, space-separated name).
2. Move each source file into it, filename normalized per convention.
   (If a file is judged to be a whole external book/paper rather than a
   single-topic note, route it to the appropriate `40 Sources/` subfolder
   instead, keeping its original citation-style name.)
3. Generate flashcards for the concepts in the group's file(s):
   - If `50 Flashcards/<Subject Label> - <topic>.md` doesn't exist yet,
     create it with the frontmatter/tag header above, then the cards.
   - If it exists, read it first. Generate candidate cards, then compare
     against existing questions — skip any that are near-duplicates of a
     card already in the deck (same underlying question, reworded). Append
     the rest, separated by `---` like the existing cards.
   - Card scope: cover the concepts actually introduced by the new
     material, at the same granularity as existing decks in this vault
     (one card per distinct fact/mechanism/definition — see any file in
     `50 Flashcards/` for calibration).

## Step 4 — Report

Summarize what happened: files moved and where, new topics/subjects
created, cards added per deck, and cards skipped as duplicates (with the
question they duplicated, so the user can double check the call).
