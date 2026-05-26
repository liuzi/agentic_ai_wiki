---
type: source
source_kind: blog
date: 2025-11-26
arxiv: 
authors: [young-justin]
venue: anthropic-engineering
status: read
confidence: high
---

# Effective harnesses for long-running agents

**Citation:** Young, Justin. "Effective harnesses for long-running agents." Anthropic Engineering Blog, 2025. [URL](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents) | [Local copy](../../raw/2025/anthropic/Effective%20harnesses%20for%20long-running%20agents.md)

## Claim

Long-running agents can effectively work across multiple context windows using a dual-agent architecture: specialized initializer agents that set up structured environments and coding agents that make incremental progress while maintaining clean state between sessions.

## Method

Engineering study identifying agent failure modes and developing systematic solutions:

1. **Failure mode identification**: Analyzed Claude's failures in long-running coding tasks - one-shotting entire projects, premature completion declarations, leaving broken state between sessions
2. **Dual-agent solution**: Initializer agent sets up environment (feature lists, git repo, progress files, init scripts); coding agents work incrementally with structured state management
3. **Environment scaffolding**: JSON feature lists with pass/fail status, claude-progress.txt logs, git commit history, init.sh development scripts
4. **Testing integration**: Browser automation tools (Puppeteer MCP) for end-to-end validation replacing inadequate unit testing
5. **Session protocol**: Standard startup sequence (pwd, read progress, check git, run tests, choose feature) before new work

**Key innovation**: Treating multi-context agents like software engineering teams working in shifts, with explicit handoff protocols and shared state management.

## Results

**Qualitative improvements demonstrated**:
- Claude successfully built production-quality web app clone across multiple sessions
- Reduced context waste from agents having to "get basic app working again" each session
- Systematic feature completion with proper testing validation
- Clean git history with descriptive commits enabling state recovery

**Specific patterns identified**:
- Over 200 granular features decomposed from high-level "build claude.ai clone" prompt
- JSON format prevents accidental feature list corruption compared to Markdown
- Browser automation caught bugs invisible to code inspection and unit tests
- Incremental approach eliminated tendency to attempt entire implementation at once

**Failure modes addressed**:
| Problem | Solution |
|---------|----------|
| One-shotting projects | Comprehensive feature decomposition + incremental prompting |
| Premature completion | Structured feature lists with pass/fail tracking |
| Broken handoffs | Git commits + progress files + basic testing before new work |
| Testing inadequacy | Browser automation for end-to-end validation |

## What's new

- **Dual-agent architecture**: Specialized prompts for initialization vs. coding phases rather than single general-purpose agent
- **Systematic failure analysis**: Concrete identification of multi-context agent pathologies and targeted solutions
- **Environment scaffolding methodology**: Specific file structures and protocols for agent state management
- **Testing integration**: Practical application of browser automation tools for agent validation
- **Incremental development patterns**: Engineering practices adapted specifically for agent workflows

## What I'd push on

- **Limited domain scope**: Optimized specifically for web development - generalization to other fields unclear
- **No quantitative evaluation**: Success measured qualitatively without systematic metrics or benchmarks
- **Model specificity**: Claude 4.5/Agent SDK specific - unclear how patterns transfer to other models/frameworks
- **Manual decomposition**: Feature breakdown still requires human insight - doesn't address automated task planning
- **Scale limitations**: Unclear how patterns perform on larger, more complex projects
- **Testing tool limitations**: Acknowledges gaps in browser automation (e.g., native alert modals)

## Touches

- [long-running-agent-harnesses](../technique/long-running-agent-harnesses.md) - Primary technique introduced
- [managed-agents](../technique/managed-agents.md) - Complementary infrastructure approach
- [session-based-context](../technique/session-based-context.md) - Related context management technique
- [context-anxiety](../concept/context-anxiety.md) - Addresses premature completion and one-shotting failure modes
- **Tools**: Claude Agent SDK, Puppeteer MCP server, git, browser automation
- **Models**: Claude 4.5 (Opus) primary subject for agent harness development
- **Applications**: Full-stack web development, autonomous coding, software engineering automation