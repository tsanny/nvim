this document lists pain points that needs to be solved so that using nvim is less painfull than using vscode
[x] python lsp auto-formats on save even though i dont want it to format on save
[x] not as easy as vscode to see git changes and diffs
[x] no git blame
[x] cant autofix eslint problems
[x] no vscode style quickfix

changelog
- disabled python lsp formatting capability on attach so it won't auto-format on save
- added gitsigns for inline git diffs, hunk navigation, and blame actions
- wired eslint via conform (eslint_d) and ensured eslint lsp install
- added trouble toggles for diagnostics and quickfix lists
- mapped <leader>f to conform format and <leader>ca to code actions
- configured pylsp to disable formatters and disable pyflakes/mccabe/pycodestyle
- enabled gitsigns inline blame with author/time/summary/sha
- verified pain point #2 by adding gitsigns for inline diffs and hunk actions
