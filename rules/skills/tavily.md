# Skill: Tavily Web Search（本地 overlay）

## When to Use

- 需要实时网页搜索、新闻检索、URL 正文抽取
- 深度调研、论文/arXiv 查找等 agent 任务
- 触发词：「搜一下」「Tavily」「web search」「extract URL」

## Prerequisites

- 安装位置：`adhoc_jobs/tavily_skill/`（[grapeot/tavily-skill](https://github.com/grapeot/tavily-skill)）
- 首次安装：`bash adhoc_jobs/install_tavily_skill.sh`
- API Key：workspace 根目录 `.env` 中的 `TAVILY_API_KEY`
- Python ≥ 3.10（项目自带 `.venv`）

## 本 workspace 调用方式

从 workspace 根目录执行（会自动向上查找 `.env`）：

```bash
cd adhoc_jobs/tavily_skill && .venv/bin/python -m tavily_skill search "latest AI news" --stdout
```

常用参数：

```bash
# 深度搜索 + 直接输出 JSON
.venv/bin/python -m tavily_skill search "OpenAI releases" \
  --max-results 6 --search-depth advanced --stdout

# 从 URL 抽取正文
.venv/bin/python -m tavily_skill extract https://example.com/article --stdout
```

默认行为（不加 `--stdout`）会把完整结果写到 `tmp/tavily/*.json`，stdout 只返回 status JSON（含 `output_path`）。Agent 任务里若需当轮消费结果，请加 `--stdout`。

## 完整参数与输出 schema

见 public repo 内的权威文档：

`adhoc_jobs/tavily_skill/skills/skill_tavily.md`
