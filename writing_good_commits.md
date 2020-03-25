# Writing Commit Messages

## TOC
<!-- vim-markdown-toc GFM -->

* [Intro](#intro)
* [Changing your git Config](#changing-your-git-config)
    * [Editor](#editor)
* [Points to Remember](#points-to-remember)
        * [Eample Commit Message Shown Below:](#eample-commit-message-shown-below)

<!-- vim-markdown-toc -->

## Intro
This document contains a guideline for writing good commit messages.

## Changing your git Config

### Editor

Use the following to update to current editor with that of your own preference

```bash
git config --global core.editor nano
```

## Points to Remember

1.  Specify the type of commit:
  - feat: The new feature you're adding to a particular application
  - fix: A bug fix
  - style: Feature and updates related to styling
  - refactor: Refactoring a specific section of the codebase
  - test: Everything related to testing
  - docs: Everything related to documentation
  - chore: Regular code maintenance.[ You can also use emojis to represent commit types]
2.  Separate the subject from the body with a blank line
3.  Your commit message should not contain any whitespace errors
4.  Remove unnecessary punctuation marks
5.  Do not end the subject line with a period
6.  Capitalize the subject line and each paragraph
7.  Use the imperative mood in the subject line
8.  Use the body to explain what changes you have made and why you made them.
9.  Do not assume the reviewer understands what the original problem was, ensure you add it.
10. Do not think your code is self-explanatory
11. Follow the commit convention defined by your team

#### Eample Commit Message Shown Below:

```viml
Capitalized, short (50 chars or less) summary

More detailed explanatory text, if necessary.  Wrap it to about 72
characters or so.  In some contexts, the first line is treated as the
subject of an email and the rest of the text as the body.  The blank
line separating the summary from the body is critical (unless you omit
the body entirely); tools like rebase can get confused if you run the
two together.

Write your commit message in the imperative: "Fix bug" and not "Fixed bug"
or "Fixes bug."  This convention matches up with commit messages generated
by commands like git merge and git revert.

Further paragraphs come after blank lines.

- Bullet points are okay, too

- Typically a hyphen or asterisk is used for the bullet, followed by a
  single space, with blank lines in between, but conventions vary here

  - Use a hanging indent

  If you use an issue tracker, add a reference(s) to them at the bottom,
  like so:

  Resolves: #123
```

@also: https://github.com/plasticboy/vim-markdown
@also: https://github.com/elzr/vim-json
@also: https://github.com/mzlogin/vim-markdown-toc
