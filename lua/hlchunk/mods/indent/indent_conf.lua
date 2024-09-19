local class = require("hlchunk.utils.class")
local BaseConf = require("hlchunk.mods.base_mod.base_conf")

---@class HlChunk.UserIndentConf : HlChunk.UserBaseConf
---@field chars? string[]
---@field use_treesitter? boolean
---@field ahead_lines? number
---@field delay? number

---@class HlChunk.IndentConf : HlChunk.BaseConf
---@field use_treesitter boolean
---@field chars table<string, string>
---@field ahead_lines number
---@field delay number default 50ms
---@field filter_list table<number, function>
---@overload fun(conf?: HlChunk.UserIndentConf): HlChunk.IndentConf
local IndentConf = class(BaseConf, function(self, conf)
    local default_conf = {
        style = { vim.api.nvim_get_hl(0, { name = "Whitespace" }) },
        priority = 10,
        use_treesitter = false,
        chars = { "│" },
        ahead_lines = 5,
        delay = 100,
        filter_list = {},
    }
    conf = vim.tbl_deep_extend("force", default_conf, conf or {}) --[[@as HlChunk.IndentConf]]
    BaseConf.init(self, conf)

    self.style = conf.style
    self.priority = conf.priority
    self.use_treesitter = conf.use_treesitter
    self.chars = conf.chars
    self.ahead_lines = conf.ahead_lines
    self.delay = conf.delay
    self.filter_list = conf.filter_list
end)

return IndentConf
