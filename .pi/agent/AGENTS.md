# AGENTS.md

## Varied thinking: When making suggestions or brainstorming
Make suggetsions of many kinds, some conservative, others wild! Think outside the box, don't constrain your thinking to one approach. Be  
 varied! Avoid repitition. Break patterns of previous written chat, and suprising me!

## Consise Language (IMPORTANT)
Rules:
- Be concise: Sacrifice grammar for concision
- Be structured: sections, subsections, numeric lists.
- Prefer bullet points over wordy paragraphs: "1.2. A point: A short description for this point."
- When appropiate, be varied in your numeric lists to avoid confusion: numbers, letters(big and small), roman numerals(big and small).
- Be numeric in sections, lists and sub-lists when appropiate, example: "1.2.3.".
- Write bullet points as "1.2.3. <label>: <description>" when appropiate.
- Focus on the essentials.
- Don't elaborate on small details. I will ask if I want you to elaborate.
- Don't overextend when writting responses, focus on the user request.


Follow these rules when responding to me and when writting .md files.

## Planning Files
- `PROMPT.md`: Instructions fed to agents for creating small projects. Never modify, unless requested by user.
- `PLAN.md`: roadmap items, planned phases, multi-step features.
- `TODO.md`: bugs, cleanup tasks, deferred work, discovered follow-ups.
- Do not update `PLAN.md` / `TODO.md` for trivial one-step user requests.
  - Examples: rename file, fix typo, small local refactor, run command, answer question.
- Add new planning entries only when the user explicitly intends to do planning work.
- Do not opportunistically edit `PLAN.md` / `TODO.md` just because work is multi-step or a follow-up is discovered.
- If a plan/TODO update seems useful, suggest it in chat and wait for user approval.
- Use task checkboxes:
  - `[ ]` open
  - `[x]` complete
- For large tasks, add subtasks or short sublists.
- Check tasks off when complete.
- Do not remove completed tasks from `PLAN.md` or `TODO.md` unless explicitly requested.

## Code Comments
- Add concise comments when they clarify non-obvious why/tradeoffs, not just what code does.

## File Creation

- Source code files should start with a comment header containing:
  - `// © <human author> <year>`
  - `// Author: <author>`
  - `// File created: <time and date with time zone>`
- Use `date` command/tool.
- Use the target language's normal comment syntax.
- Do not add source-style header comments to Markdown, docs, config, data, or generated files unless explicitly requested.
- Files generated or mostly written by LLM should use `<model + version>` as author.
- `<human author>` is the person instructing the agent.
- The user on this system is: "John Emanuelsson".

## Git / Commits
- Commit messages for AI-assisted work should include:
  - `AI-Assisted: <model name>`
  - `Assisted-by: <model + version>`
  - `AI-Contribution: <minor|major>`
- `AI-Contribution` levels:
  - `minor`: mostly handwritten, with AI help.
  - `major`: mostly AI-written, with human direction and review.
