# Petrol Noir

> *Late nights, long commits, quiet focus.*
> Bone highlights. Blood keywords. Copper functions. No neon. No noise.

Petrol Noir is designed for focus and restraint.
It emphasizes hierarchy over brightness, with carefully controlled accents and deep contrast that stays readable at 3am.

Built for:

* Neovim ≥ 0.9
* Treesitter
* LSP semantic tokens
* Telescope, nvim-cmp, GitSigns, WhichKey, Neo-tree / Nvim-tree

---

## Features

* **Carefully tuned palette** — oil indigo, copper, ash gold, blood red
* **Optional transparency** (terminal-friendly)
* **Full Treesitter coverage**
* **LSP semantic tokens**
* **Polished plugin support** (Telescope, CMP, GitSigns, WhichKey, file explorers)
* **Low eye strain** — no neon, no harsh whites

---

## Installation

### lazy.nvim (recommended)

```lua
{
  "connormxfadden/petrolnoir.nvim",
  priority = 1000, -- load before other UI plugins
  config = function()
    vim.cmd.colorscheme("petrolnoir")
  end,
}
```

### packer.nvim

```lua
use {
  "connormxfadden/petrolnoir.nvim",
  config = function()
    vim.cmd.colorscheme("petrolnoir")
  end
}
```

---

## Usage

The simplest way:

```vim
:colorscheme petrolnoir
```

Or in Lua:

```lua
vim.cmd.colorscheme("petrolnoir")
```

---

## Configuration

Petrol Noir supports a small but intentional configuration surface.

### Default configuration

```lua
require("petrolnoir").setup({
  transparent = true,
})
```

> `setup()` **does not** apply the colorscheme by itself.
> You still call `:colorscheme petrolnoir` (this matches how most modern themes behave).

### Options

| Option        | Type    | Default | Description                                                           |
| ------------- | ------- | ------- | --------------------------------------------------------------------- |
| `transparent` | boolean | `true`  | Use terminal background (`NONE`) instead of a solid editor background |

### Example: solid background (no transparency)

```lua
require("petrolnoir").setup({
  transparent = false,
})

vim.cmd.colorscheme("petrolnoir")
```

This will give you a consistent dark background across:

* Normal buffers
* Sidebars
* Floating windows
* Telescope

---

## Design Philosophy

Petrol Noir avoids:

* Neon accents
* Rainbow syntax
* Excessive contrast

Instead it focuses on:

* **Hierarchy** (what matters stands out)
* **Material feel** (oil, steel, copper, ash)
* **Long-session comfort**

---

## Supported Plugins

Out of the box support for:

* Treesitter
* LSP diagnostics & semantic tokens
* Telescope
* nvim-cmp
* GitSigns
* WhichKey
* Neo-tree
* Nvim-tree

(Other plugins will fall back gracefully to core highlight groups.)

---

## Neovim Version

* Tested on **Neovim 0.9+**
* Designed for **0.10+** semantic token behavior

---

## License

MIT

---

## Final Note

This theme was built for:

* late nights
* long commits
* quiet focus

If it ever feels loud, something’s wrong.

---
