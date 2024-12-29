if false then
  return {}
end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "CopilotC-Nvim/CopilotChat.nvim",
  config = function()
    require("CopilotChat").setup({
      show_help = true,
      prompts = {
        JExplain = {
          prompt = "/COPILOT_EXPLAIN コードを日本語で説明してください",
          description = "コードの説明をお願いする",
        },
        -- Review = {
        --   prompt = "/COPILOT_REVIEW コードを日本語でレビューしてください。",
        --   description = "コードのレビューをお願いする",
        -- },
        JFix = {
          prompt = "/COPILOT_FIX このコードには問題があります。バグを修正したコードを表示してください。説明は日本語でお願いします。",
          description = "コードの修正をお願いする",
        },
        JRefactor = {
          prompt = "/COPILOT_GENERATE 明瞭性と可読性を向上させるために、次のコードをリファクタリングしてください。日本語で返答ください。",
        },
        JBetterNamings = {
          prompt = "/COPILOT_GENERATE 選択されたコードの変数名や関数名を改善してください。日本語で返答ください。",
        },
        JOptimize = {
          prompt = "/COPILOT_REFACTOR 選択したコードを最適化し、パフォーマンスと可読性を向上させてください。説明は日本語でお願いします。",
          description = "コードの最適化をお願いする",
        },
        JDocs = {
          prompt = "/COPILOT_GENERATE 選択したコードに関するドキュメントコメントを日本語で生成してください。",
        },
        JTests = {
          prompt = "/COPILOT_TESTS 選択したコードの詳細なユニットテストを書いてください。説明は日本語でお願いします。",
        },
        JWording = {
          prompt = "/COPILOT_GENERATE 次のテキストの文法と表現を改善してください。日本語で返答ください。",
        },
        JSpelling = {
          prompt = "/COPILOT_GENERATE 次のテキストのスペルミスを修正してください。日本語で返答ください。",
        },
        JFixDiagnostic = {
          prompt = "コードの診断結果に従って問題を修正してください。修正内容の説明は日本語でお願いします。",
          description = "コードの修正をお願いする",
          -- selection = require("CopilotChat.select").diagnostics,
        },
        JCommit = {
          prompt = "変更のコミットメッセージをcommitizenの規約に従って日本語で書いてください。タイトルは最大50文字、メッセージは72文字で折り返してください。メッセージ全体をgitcommit言語のコードブロックで囲んでください。",
          description = "コミットメッセージの作成をお願いする",
          -- selection = require("CopilotChat.select").gitdiff,
        },
        JCommitStaged = {
          prompt = "ステージ済みの変更のコミットメッセージをcommitizenの規約に従って日本語で書いてください。タイトルは最大50文字、メッセージは72文字で折り返してください。メッセージ全体をgitcommit言語のコードブロックで囲んでください。",
          description = "ステージ済みのコミットメッセージの作成をお願いする",
          -- selection = require("CopilotChat.select").gitdiff,
        },
        aToJP = {
          prompt = "Respond in Japanese.",
        },
      },
    })
  end,
}
