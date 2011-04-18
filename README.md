# VersionOne Git Hooks
So you can be lazy and make the computer do the boring stuff!

## Current Hooks

-   **Auto-reference Asset ID in Commit Message**: [prepare-commit-message](http://www.kernel.org/pub/software/scm/git/docs/githooks.html#_prepare_commit_msg)

    When you `git commit`, this hook will inspect the current branch name looking for a [VersionOne ID](#versionone-id). 
    If it finds one, I'll will append it to the commit message for you, magically! You'll have an opportunity to edit 
    or remove it if you like (assuming you did't do `git commit -m "..."`).
    
    Also, if you've already mentioned the asset in your commit message, the hook leaves things exactly as they are.

    **Examples**: 

    - branch named `user_profile_autosaves_S-12345` will add `S-12345` to you commit message
    - branch named `D-11223` will add `D-11223` to your commit message
    - branch named `S-98765-allow-multiple-owers` will add `S-98765` to your commit message


Have some hooks you'd like to see? Let us know. Or better yet, fork, add your hook, and send us a Pull Request!

## Installing
Currently you need to download both the [`prepare-commit-message`](https://github.com/versionone/git-hooks/blob/master/prepare-commit-msg)
hook and supporting [`lib/`](https://github.com/versionone/git-hooks/blob/master/lib/) directory, putting them in the 
`.git/hooks/` directory of each repository you want to use the hooks with. We'll make this a whole lot easier, real soon!

## License
VersionOne Git Hooks are covered under the MIT License. See [LICENSE](https://github.com/versionone/git-hooks/blob/master/LICENSE) for more information.

### VersionOne ID
Current ID's look like

- Acceptance Test : `AT-01234`
- Defect : `D-01234`
- Environment : `ENV-01234`
- Goal : `G-01234`
- Issue : `I-01234`
- Regression Plan : `RP-01234`
- Regression Suite : `RS-01234`
- Regression Test : `RT-01234`
- Request : `R-01234`
- Story : `S-01234`
- Task : `TK-01234`
- Test Set: `TS-01234`
- Theme : `TH-01234`

