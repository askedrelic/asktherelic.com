# 2025-06-29 - Adventures in AI

Recently, while waiting in the drive-through at McDonalds, I started thinking about how much I was really spending there. Mint used to have this information readily available, and my credit card company's website probably has a spending chart somewhere, but I also knew that McDonald's sent pretty detailed email receipts. It had become a common stop for me, and while this could have been just an idle thought, I decided to use the opportunity to try out Claude Code and MCP to find an answer. In the age of AI, anything is possible.

*Mmm HTML formatted emails*

![mcdonalds.jpeg](assets/mcdonalds.jpeg)

## Backing Up Your Email

Backups have [always been important to me](https://www.asktherelic.com/2014/02/08/another-year-another-set-of-backups/) and while I haven't posted about it lately, I have continued to maintain my backups. It's also valuable to have local versions of files that you can work with, for projects like this.

Got Your Back (GYB) [https://github.com/GAM-team/got-your-back](https://github.com/GAM-team/got-your-back) is my current favorite tool for downloading my Gmail files to regular email files - it consistently works. 

I'll also forgo directly connecting Gmail to Claude; I still prefer having some illusion of control over my data and not having to worry about rate limits or API complexities.

The [GYB first time setup](https://github.com/GAM-team/got-your-back/wiki#general) is still daunting due to the complexity of having to create a Google Oauth app just for yourself, but once you get past that, you can download your emails locally to work with.

I like this command to download a single year at a time:

```bash
gyb --email email@gmail.com --action backup \
    --search "after:2025/12/31 before:2026/01/01"
```

Now we have thousands of local emails to work with:

```bash
$ tree 2025 | head
2025
├── 1
│   ├── 1
│   │   ├── 19420838f30727e2.eml
│   │   ├── 19420cf0bab51def.eml
│   │   ├── 19421bda34835985.eml
│   │   ├── 194228c70a17dcab.eml
│   │   ├── 19422d8932fa4989.eml
│   │   ├── 194235b0a4bbfec5.eml
│   │   ├── 194235b13deb6a79.eml
...
167 directories, 1968 files
```

And confirm we have the data we are looking for:

```bash
$ rg -l "mcdonalds"
2025/4/12/1962ad5a33cf606d.eml
2025/1/25/1949e723ad7b39d7.eml
2025/1/26/194a424e363c1ed9.eml
2025/1/19/1948037a64b788cc.eml
```

## Failed attempt: Claude Desktop with an MCP

Following [the MCP docs](https://modelcontextprotocol.io/quickstart/user#2-add-the-filesystem-mcp-server), I tried the [filesystem example MCP server](https://github.com/modelcontextprotocol/servers/tree/main/src/filesystem), which is pretty easy to configure Node server that has basic filesystem commands like `list_directory` and `search_files` . Editing random JSON configs isn't the best interface, but works and reflects the freshness of the MCP ecosystem to me.

Another surprising fact was understanding that the MCP interface is HTTP JSON; so Claude is always running your server alongside while doing anything. I understand that remote servers are still being specced out or improved, but seems like an overbuilt interface in some ways.

Initial attempts went as expected: 

```text
> Search all my files for emails about mcdonalds

I can see you have a Gmail backup directory with many .eml files organized by
date. Let me search through these email files to find any mentions of
McDonald's. Since there are many files, I'll search through some of them
systematically.
```

Claude could understand there are files but the search command was only based on filename. It spun its wheels for several minutes trying to search every single file individually until it burned through its context limit.

While better prompting or a different MCP might have improved things, it felt slow and unsuccessful and I wasn't getting the results I wanted.

## Claude Code

Moving onto the [Code terminal app](https://www.anthropic.com/claude-code) generated results more quickly. This tool seems to [be growing in popularity](https://kadekillary.work/blog/#2025-06-16-snorting-the-agi-with-claude-code) and has a good set of overall abilities, beyond being an LLM:

- tool usage
- planning mode
- self-optimization with instruction files

Code had a similar approach blunt force approach of trying to add all emails to context and crashing out, but its planning and tool use were much better without prompting. It can break down tasks into smaller tasks that are more likely to be successful and stay organized on completing each task successfully. It will use grep to search versus anything else is the appropriate choice.

```text
> Search all my email files for mcdonalds receipts, parse the emails, 
  and summarize any useful data

⏺ I'll search for McDonald's receipts in your email files, parse them, 
  and summarize the data. Let me start by creating a todo list to 
  track this task.

⏺ Update Todos
  ⎿  ☐ Search email files for McDonald's receipts
     ☐ Parse found McDonald's receipt emails
     ☐ Extract and summarize useful data from receipts

⏺ Now let me search for McDonald's-related emails in your files.

⏺ Update Todos
  ⎿ ☐ Search email files for McDonald's receipts
     ☐ Parse found McDonald's receipt emails
     ☐ Extract and summarize useful data from receipts

⏺ List(.)
  ⎿  Listed 1429 paths (ctrl+r to expand)

⏺ Let me search for McDonald's-related emails using grep to find receipts:

⏺ Search(pattern: "(?i)(mcdonald|mcdonalds)", include: "*.eml")
  ⎿  Found 25 files (ctrl+r to expand)

⏺ Great! I found 25 email files containing McDonald's. Now let me update 
  the todo status and start parsing these emails:

⏺ Update Todos
  ⎿ ☒ Search email files for McDonald's receipts
     ☐ Parse found McDonald's receipt emails
     ☐ Extract and summarize useful data from receipts

⏺ Now let me read several of these McDonald's emails to understand their 
  structure and extract receipt data:

⏺ Read(2025/1/4/19432469c9580b0d.eml)
  ⎿  Read 1224 lines (ctrl+r to expand)

⏺ Read(2025/1/12/1945b7f96ef60553.eml)
  ⎿  Read 1314 lines (ctrl+r to expand)
```

After finding the correct set of working email receipts, it also performed some useful adhoc analysis in the terminal, but this where I manually directed it toward writing a Python script to parse the data and find useful information. Moving beyond the LLM context and working with real code and data is where Code really shines. I did a bit more cycles back and forth, but we quickly had a working Python script.

## Emoji Summary

It's not an LLM artifact without emoji.

```text
📊 OVERVIEW:
   Total Receipts: 24
   Date Range: 01/04/2025 to 06/07/2025
   Total Spent: $404.58
   Total Savings: $404.58
   Average Order: $16.86

🍔 MOST POPULAR ITEMS:
   1. Hash Browns: 78 orders
   2. Sausage & Egg McMuffin: 18 orders
   3. Sausage & Egg McMuffin &nbsp;&nbsp;&nbsp;&nbsp; 1P: 18 orders
   4. Sausage McMuffin: 6 orders
   5. 4 pc. Chicken McNuggets Happy Meal: 5 orders

💰 HIGHEST REVENUE ITEMS:
   1. Hash Browns: $167.91
   2. Sausage & Egg McMuffin: $109.62
   3. 4 pc. Chicken McNuggets Happy Meal: $46.83
   4. Large French Fries: $16.07
   5. Sausage McMuffin: $14.77

📅 MONTHLY SPENDING:
   2025-01: $102.55
   2025-02: $63.06
   2025-03: $92.39
   2025-04: $58.77
   2025-05: $41.49
   2025-06: $46.32

```

[Source code here](https://gist.github.com/askedrelic/0f605ab5c0923541a4c1df2bc1dcd385).

## Next Steps

I generated useful data in under hour and had my answer: while my spending on McDonalds has stabilized (and my spending on Claude will probably take its place).

Solving problems with LLMs is in an interesting space right now, as everything is rapidly evolving and becoming more practically useful. I could have done the same work personally, which might have taken me longer and/or generated a more useful result, but the 80% right experiment is perfect for LLMs.

Some other thoughts from this:

- How to provide enough context or prompt for the LLM to make the "right" choices. Do you know the right choices up front and should you include these in the prompt?
- There is value in cheap exploration and real results.
- Is this making us all dumber? Where is your line between getting work done versus doing it yourself and still maintaining the understanding of the work.