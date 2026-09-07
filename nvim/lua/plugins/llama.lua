return {
  "ggml-org/llama.vim",
  init = function()
    vim.g.llama_config = {
      --endpoint = "https://openwebui.rainfallacres.com/api/chat/completions", -- or whatever your server endpoint is
      endpoint = "http://127.0.0.1:8012/infill", -- or whatever your server endpoint is
      -- you can add other options too:
      --show_info = 2,
      -- auto_fim = false,
      --api_key = "sk-3a01c1b9041e401bbf8eb22de25c8bc8",
      --model = "qwen/qwen-2.5-coder-32b-instruct",
    }
  end,
}
