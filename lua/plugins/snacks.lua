-- Shared noise list. These are dirs you never want in a picker, even when
-- hidden/ignored are on (we keep those on so `.env`, `.github`, etc. are
-- searchable). Passed to rg/fd as --glob=!<pattern>.
local exclude = {
  ".git",
  ".hg",
  ".svn",
  "node_modules",
  "vendor",
  "dist",
  "build",
  "out",
  "target",
  ".next",
  ".nuxt",
  ".svelte-kit",
  ".turbo",
  ".cache",
  ".parcel-cache",
  "coverage",
  ".nyc_output",
  "playwright-report",
  "test-results",
  ".playwright",
  "blob-report",
  ".venv",
  "venv",
  "__pycache__",
  ".pytest_cache",
  ".mypy_cache",
  ".ruff_cache",
  "**/storage/framework",
  "**/bootstrap/cache",
  "*.min.js",
  "*.min.css",
  "*.map",
  "*.lock",
  "package-lock.json",
}

return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      formatters = {
        file = {
          -- Recent/grep lists mix several repos, and plenty of basenames
          -- collide (three different `Dockerfile.lambda`, several `Index.jsx`).
          -- Default `truncate = "center"` elides exactly the segment that
          -- tells them apart. Put the basename at the left margin where the
          -- eye lands, and drop the *leading* dirs instead of the middle.
          filename_first = true,
          truncate = "left",
        },
      },
      sources = {
        -- File explorer on the right. The `sidebar` preset is left-positioned;
        -- overriding `layout.position` is the documented way to flip it
        -- (top-level `opts.explorer` is the module config, not the picker win).
        explorer = {
          layout = { layout = { position = "right" } },
        },

        -- Grep literally, like telescope's grep_string. Snacks defaults to
        -- regex = true, so `$user->name`, `foo(bar)` and `arr[0]` silently
        -- match nothing. Toggle hidden/ignored in-picker with H / I.
        grep = {
          regex = false,
          hidden = true,
          ignored = true,
          exclude = exclude,
        },
        grep_word = {
          hidden = true,
          ignored = true,
          exclude = exclude,
        },
        files = {
          hidden = true,
          ignored = true,
          exclude = exclude,
        },
      },
    },
  },
}
