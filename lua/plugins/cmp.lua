return {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-emoji',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'hrsh7th/cmp-nvim-lua',
        'rafamadriz/friendly-snippets',
        'roobert/tailwindcss-colorizer-cmp.nvim'
    },
    config = function()
        local cmp = require('cmp')

        cmp.setup{
          snippet = {
            expand = function(args)
              require'luasnip'.lsp_expand(args.body) -- Luasnip expand
            end,
          },

          -- Mappings for cmp
          mapping = {

            -- Autocompletion menu
            ['<S-Tab>'] = cmp.mapping(cmp.mapping.complete(), { 'i' }),
            ['<C-y>'] = cmp.config.disable,                      -- Turn off autocomplete on <CR>
            ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Turn on autocomplete on <C-y>

            -- Use <C-e> to abort autocomplete
            ['<C-e>'] = cmp.mapping({
              i = cmp.mapping.abort(), -- Abort completion
              c = cmp.mapping.close(), -- Close completion window
            }),

            -- Use <C-p> and <C-n> to navigate through completion variants
            ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
            ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
          },

          sources = cmp.config.sources({
            { name = 'nvim_lsp' },                -- LSP
            { name = 'nvim_lsp_signature_help' }, -- LSP for parameters in functions
            { name = 'nvim_lua' },                -- Lua Neovim API
            { name = 'luasnip' },                 -- Luasnip
            { name = 'buffer' },                  -- Buffers
            { name = 'path' },                    -- Paths
            --{ name = "emoji" },                   -- Emoji
          }, {
          }),
        }

        -- Add snippets from Friendly Snippets
        require("luasnip/loaders/from_vscode").lazy_load()
    end
}

