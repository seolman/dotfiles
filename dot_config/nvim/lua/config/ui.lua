-- ============================================================================
-- Neovim Experimental UI2 (:h ui2)
-- ============================================================================
-- Replaces the traditional command-line and message area with managed
-- windows, eliminating "Press ENTER" / "-- More --" prompts and allowing
-- `cmdheight = 0` without losing messages.
--
-- Notes (Neovim 0.13):
--   - Press `g<` to open the message pager for past output.
--   - Configure message behavior via `:h 'messagesopt'`.
--   - Wrapped in `pcall` because `vim._core.ui2` is an internal/experimental API.
-- ============================================================================

local ok, ui2 = pcall(require, "vim._core.ui2")
if ok then
  ui2.enable({
    enable = true,
    msg = {
      targets = "msg", -- Show messages in a floating window when cmdheight = 0
    },
  })
end
