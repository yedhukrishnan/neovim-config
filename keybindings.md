# Keybindings

Leader key: `Space`. Local leader (used by vimtex): `\` (the default).

Press `<leader>` and wait to see these in which-key, or use `<leader>fk` to search every keymap.

- [Custom keybindings](#custom-keybindings) — set in `init.lua`
- [Plugin defaults](#plugin-defaults) — come with the plugins, not set in `init.lua`
- [Built into Neovim](#built-into-neovim) — useful defaults from Neovim 0.12

---

## Custom keybindings

### General

| Key | Mode | Action |
|-----|------|--------|
| `jk` | Insert | Exit insert mode |
| `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` | Normal | Move to window left / below / above / right |
| `<C-s>` | Normal | Clear search highlights |
| `[b` / `]b` | Normal | Previous / next buffer |
| `<leader>r` | Normal | Toggle relative line numbers |
| `%%` | Command | Expands to the current file's directory |

### Find (snacks picker)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>p` | Normal | Find files |
| `<leader><space>` | Normal | Smart find (recent + project files) |
| `<leader>fg` | Normal | Live grep |
| `<leader>fw` | Normal, Visual | Grep word under cursor / selection |
| `<leader>f/` | Normal | Search lines in current buffer |
| `<leader>b` | Normal | Buffers |
| `<leader>fr` | Normal | Recent files |
| `<leader>fh` | Normal | Help tags |
| `<leader>ft` | Normal | Themes (with live preview) |
| `<leader>fd` | Normal | Diagnostics |
| `<leader>fs` | Normal | LSP symbols (current file) |
| `<leader>fS` | Normal | LSP symbols (workspace) |
| `<leader>fk` | Normal | Keymaps |
| `<leader>fc` | Normal | Command history |
| `<leader>fu` | Normal | Undo history |
| `<leader>fl` | Normal | Git log |
| `<leader>fq` | Normal | Quickfix list |
| `<leader>f.` | Normal | Resume last picker |

### File tree (nvim-tree)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>nf` | Normal | Reveal current file in tree |

Use `:NvimTreeToggle` to open/close the tree.

### LSP (active when a language server attaches)

| Key | Mode | Action |
|-----|------|--------|
| `gd` | Normal | Go to definition |
| `gD` | Normal | Go to declaration |
| `gi` | Normal | Go to implementation |
| `gy` | Normal | Go to type definition |
| `grr` | Normal | Find references (Neovim built-in, see below) |
| `K` | Normal | Hover documentation |
| `<C-k>` | Insert | Signature help |
| `<leader>lr` | Normal | Rename symbol |
| `<leader>la` | Normal, Visual | Code action |
| `<leader>lf` | Normal | Format buffer (LSP) |
| `<leader>ld` | Normal | Line diagnostics |
| `[d` / `]d` | Normal | Previous / next diagnostic |
| `<leader>lq` | Normal | Diagnostics to location list |
| `<leader>lwa` | Normal | Add workspace folder |
| `<leader>lwr` | Normal | Remove workspace folder |
| `<leader>lwl` | Normal | List workspace folders |

### Formatting (conform)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>cf` | Normal | Format with conform |

### Git (gitsigns)

| Key | Mode | Action |
|-----|------|--------|
| `]c` / `[c` | Normal | Next / previous hunk |
| `<leader>gs` | Normal, Visual | Stage hunk / selected lines |
| `<leader>gr` | Normal, Visual | Reset hunk / selected lines |
| `<leader>gS` | Normal | Stage buffer |
| `<leader>gp` | Normal | Preview hunk |
| `<leader>gb` | Normal | Blame line (full) |
| `<leader>gd` | Normal | Diff against index |

### Treesitter

| Key | Mode | Action |
|-----|------|--------|
| `af` / `if` | Visual, Operator | Around / inside function |
| `ac` / `ic` | Visual, Operator | Around / inside class |
| `aa` / `ia` | Visual, Operator | Around / inside argument |
| `ab` / `ib` | Visual, Operator | Around / inside block |
| `]f` / `[f` | Normal, Visual, Operator | Next / previous function |
| `]k` / `[k` | Normal, Visual, Operator | Next / previous class |
| `<leader>sn` | Normal | Swap argument with next |
| `<leader>sp` | Normal | Swap argument with previous |
| `[x` | Normal | Jump up to context (enclosing function/class) |

### Claude Code (claudecode.nvim)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>ac` | Normal | Toggle Claude |
| `<leader>af` | Normal | Focus Claude |
| `<leader>ar` | Normal | Resume Claude |
| `<leader>aC` | Normal | Continue Claude |
| `<leader>am` | Normal | Select Claude model |
| `<leader>ab` | Normal | Add current buffer |
| `<leader>as` | Visual | Send selection to Claude |
| `<leader>aa` | Normal | Accept diff |
| `<leader>ad` | Normal | Deny diff |

---

## Plugin defaults

### Snacks picker (inside a picker)

| Key | Action |
|-----|--------|
| `<CR>` | Open |
| `<C-j>` / `<C-k>`, `<C-n>` / `<C-p>` | Move down / up |
| `<C-d>` / `<C-u>` | Scroll list |
| `<C-f>` / `<C-b>` | Scroll preview |
| `<C-s>` / `<C-v>` / `<C-t>` | Open in split / vertical split / tab |
| `<S-CR>` | Pick a window to open in |
| `<Tab>` / `<S-Tab>` | Select and move down / up |
| `<C-a>` | Select all |
| `<C-q>` | Send to quickfix list |
| `<C-g>` | Toggle live grep (in input) |
| `<M-h>` / `<M-i>` | Toggle hidden / gitignored files |
| `<M-r>` | Toggle regex |
| `<M-p>` | Toggle preview |
| `<M-m>` | Toggle maximize |
| `<C-Up>` / `<C-Down>` | Previous / next search history |
| `/` | Switch between input and list |
| `<Esc>` / `<C-c>` | Close |
| `?` | Show all picker keys |

### File tree (nvim-tree, inside the tree)

| Key | Action |
|-----|--------|
| `<CR>` / `o` | Open |
| `<C-v>` / `<C-x>` / `<C-t>` | Open in vertical split / split / tab |
| `<Tab>` | Preview |
| `<BS>` | Close directory |
| `-` / `<C-]>` | Go up / cd into directory |
| `P` | Go to parent directory |
| `a` | Create file or directory (end with `/`) |
| `r` / `e` | Rename / rename basename |
| `d` / `D` | Delete / trash |
| `x` / `c` / `p` | Cut / copy / paste |
| `y` / `Y` / `gy` | Copy name / relative path / absolute path |
| `H` / `I` | Toggle dotfiles / gitignored |
| `f` / `F` | Start / clear live filter |
| `E` / `W` | Expand all / collapse all |
| `[c` / `]c` | Previous / next git change |
| `R` | Refresh |
| `q` | Close tree |
| `g?` | Help |

### mini.surround

| Key | Mode | Action |
|-----|------|--------|
| `sa{motion}{char}` | Normal, Visual | Add surrounding (e.g. `saiw"`) |
| `sd{char}` | Normal | Delete surrounding (e.g. `sd"`) |
| `sr{old}{new}` | Normal | Replace surrounding (e.g. `sr"'`) |
| `sf` / `sF` | Normal | Find surrounding right / left |
| `sh` | Normal | Highlight surrounding |

Add `n` / `l` after the action to target the next / previous surrounding (e.g. `sdn"`).

### mini.indentscope

| Key | Mode | Action |
|-----|------|--------|
| `ii` / `ai` | Visual, Operator | Inside indent scope / with border lines |
| `[i` / `]i` | Normal, Visual, Operator | Jump to top / bottom of scope |

### GitHub Copilot (copilot.vim)

| Key | Mode | Action |
|-----|------|--------|
| `<Tab>` | Insert | Accept suggestion |
| `<C-]>` | Insert | Dismiss suggestion |
| `<M-]>` / `<M-[>` | Insert | Next / previous suggestion |
| `<M-\>` | Insert | Request a suggestion |
| `<M-Right>` | Insert | Accept next word |
| `<M-C-Right>` | Insert | Accept next line |

### CopilotChat (inside the chat window)

Open with `:CopilotChat` or `:CopilotChatToggle`.

| Key | Action |
|-----|--------|
| `<CR>` (normal) / `<C-s>` (insert) | Submit prompt |
| `<Tab>` (insert) | Complete |
| `q` (normal) / `<C-c>` (insert) | Close |
| `<C-l>` | Reset chat |
| `<C-y>` | Accept diff |
| `gj` | Jump to diff |
| `gy` | Yank diff |
| `gd` | Show diff |
| `gqa` / `gqd` | Answers / diffs to quickfix |
| `gc` | Show info |
| `gh` | Help |

### vim-fugitive (in the `:Git` status window)

| Key | Action |
|-----|--------|
| `s` / `u` / `-` | Stage / unstage / toggle file or hunk |
| `X` | Discard change |
| `=` | Toggle inline diff |
| `dv` | Diff in vertical split |
| `<CR>` | Open file |
| `cc` / `ca` / `ce` | Commit / amend / amend without editing message |
| `g?` | Help |

`:GBrowse` (from vim-rhubarb) opens the current file or selection on GitHub.

### vimtex (LaTeX files)

| Key | Mode | Action |
|-----|------|--------|
| `\ll` | Normal | Toggle continuous compile |
| `\lv` | Normal | View PDF |
| `\lk` / `\lc` | Normal | Stop / clean build files |
| `\le` | Normal | Show errors |
| `\lt` | Normal | Table of contents |
| `ie` / `ae` | Visual, Operator | Inside / around environment |
| `i$` / `a$` | Visual, Operator | Inside / around math |
| `ic` / `ac` | Visual, Operator | Inside / around command |
| `dse` / `cse` | Normal | Delete / change surrounding environment |
| `tse` | Normal | Toggle starred environment |
| `]]` | Insert | Close current environment |

### vim-rails

| Key / command | Action |
|---------------|--------|
| `gf` | Go to the Rails file under cursor (partials, models, etc.) |
| `:A` | Alternate file (e.g. model ↔ test) |
| `:R` | Related file (e.g. controller action ↔ view) |
| `:Emodel`, `:Econtroller`, `:Eview`, … | Jump to a Rails file by type |

### nvim-autopairs / nvim-ts-autotag

No keys. Brackets, quotes and HTML/ERB/JSX tags close (and rename) automatically.

---

## Built into Neovim

| Key | Mode | Action |
|-----|------|--------|
| `gcc` / `gc{motion}` | Normal, Visual | Toggle comment |
| `grn` / `gra` / `grr` / `gri` / `grt` | Normal | LSP rename / code action / references / implementation / type definition |
| `gO` | Normal | Document symbols |
| `[D` / `]D` | Normal | First / last diagnostic |
| `<C-w>d` | Normal | Show diagnostics under cursor |
| `[q` / `]q` | Normal | Previous / next quickfix item |
| `:Undotree` | — | Visual undo tree |
| `:DiffTool` | — | Compare files or directories |
