
# VersionOne Git Hook (node.js version)

So you can be lazy and make the computer do the boring stuff!

Adds a prepare-commit-message hook to prepend commit messages with [VersionOne ID](#versionone-id).


## Installation

Requires node.js.

Currently you need to download both the [`prepare-commit-message`](https://github.com/versionone/git-hooks/blob/master/add_asset_number_to_commit_message/prepare-commit-msg)
hook, place into the 
`.git/hooks/` directory of each repository you want to use the hooks with.

If you trust us, in your shell `cd your/git/repo/root` and execute the following:

    (cd .git/hooks && curl -LsSfO "https://github.com/versionone/git-hooks/raw/master/add_asset_number_to_commit_message/prepare-commit-msg")

    
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
