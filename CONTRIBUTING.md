Some guidelines you can follow while adding our changes to the repository:

### Branch
- Create one branch for each logical change.
- Make reasonable branch names. For example, feature/name-of-feature or bugfix/issue-number-or-description-of-bug.

### Commit
- If possible, stick to one commit per branch. (git commit --amend or interactive rebase can be handy)
- Make commit messages in the following format:
```
Summary Line - 72 characters wrapped and written in imperative form.
(Blank)
Explanation - Paragraph or bullets detailing the change, unless the change is trivial.
```
- If the commit fixes an issue, make the summary line as "Fix #NUM."

### Merge
- Either pull request directly into master branch or have a branch in between. For example, pull request is merged to the development branch and occasionally development branch is merged to the master branch.
- Merge a pull request when at least n people are ok with the change.
