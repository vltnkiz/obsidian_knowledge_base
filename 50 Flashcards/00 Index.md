Central index for all flashcards in the vault. Every flashcard deck lives directly in this folder now, tagged with `#flashcards/...` for the spaced-repetition plugin.

## Coverage check — every subtopic vs. its flashcard deck

```dataviewjs
// Subjects to check. Add an entry here when a genuinely new top-level
// subject area is created (this list is stable; subtopics are scanned live).
const subjects = {
  "Coding": "05 Coding",
  "Math": "07 Math",
  "ML Concepts": "10 ML",
  "Finance": "20 Finance",
};

// Topics that already have a flashcard deck, as "Subject|Topic" pairs.
const existing = new Set(
  dv.pages('"50 Flashcards"')
    .where(p => p.file.name !== "00 Index")
    .map(p => `${p.subject}|${p.topic}`)
    .values
);

// A folder counts as a "topic" if it contains at least one file directly,
// of any type (this skips pure grouping folders like "Statistics" or
// "21 data analysis" and lands on the real leaf topic folder). Checking
// any file, not just .md, matters because a topic's only markdown file
// used to be its flashcard deck, now moved out to 50 Flashcards — a
// companion PDF is often all that's left to mark the folder as real.
// Duck-typing: a TFolder has a `children` array, a TFile doesn't.
function findTopicFolders(folder) {
  const results = [];
  const ownFiles = folder.children.filter(c => c.children === undefined);
  const ownFolders = folder.children.filter(c => c.children !== undefined);
  const hasOwnFile = ownFiles.length > 0;
  if (hasOwnFile) {
    results.push(folder);
  }
  for (const child of ownFolders) {
    results.push(...findTopicFolders(child));
  }
  return results;
}

let rows = [];
for (const [subject, folderPath] of Object.entries(subjects)) {
  const folder = app.vault.getAbstractFileByPath(folderPath);
  if (!folder) continue;
  const topicFolders = findTopicFolders(folder).sort((a, b) => a.name.localeCompare(b.name));
  for (const tf of topicFolders) {
    const has = existing.has(`${subject}|${tf.name}`);
    rows.push([subject, tf.name, has ? "✅" : "❌"]);
  }
}

dv.table(["Subject", "Topic", "Has deck?"], rows);
```
