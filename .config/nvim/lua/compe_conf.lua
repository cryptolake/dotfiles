-- Compe setup
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = false;

  source = {
    path = true;
    buffer = true;
    calc = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    tags = true;
    snippets_nvim = true;
    treesitter = true;
  };
}
-- autopairs
local autopairs, autopairs_completion
if
    not pcall(
        function()
            autopairs = require "nvim-autopairs"
            autopairs_completion = require "nvim-autopairs.completion.compe"
        end
    )
 then
    return
end

autopairs.setup()
autopairs_completion.setup(
    {
        map_cr = true,
        map_complete = true -- insert () func completion
    }
)
