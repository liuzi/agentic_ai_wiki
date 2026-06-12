---
type: technique
status: active
introduced: 2025-11
last_updated: 2026-05-26
supersedes: [single-agent-loops]
superseded_by: [gan-inspired-agent-architectures]
competes_with: [multi-agent-systems, langchain-agents, crewai, gan-inspired-agent-architectures]
tags: [agents, harness, multi-session, incremental-development, context-management]
---

# Long-Running Agent Harnesses

## TL;DR

Long-running agent harnesses enable AI agents to work effectively across multiple context windows using a dual-agent architecture: specialized initializer agents that set up structured environments and coding agents that make incremental progress while maintaining clean state between sessions.

## Mechanism

Two-phase agent architecture with explicit state management:

### Phase 1: Initializer Agent
Specialized first-session setup with distinct prompting:

1. **Environment scaffolding**: Create structured files for persistent state
   - JSON feature lists with granular requirements and pass/fail status
   - Progress tracking files (claude-progress.txt) for session summaries
   - Git repository initialization with initial commit
   - Development setup scripts (init.sh) for consistent environment startup

2. **Task decomposition**: Break high-level prompts into 200+ specific features
   - Each feature includes description, test steps, and boolean pass status
   - JSON format prevents accidental corruption vs. Markdown
   - Strong prompt instructions against editing test definitions

### Phase 2: Coding Agent
Subsequent sessions follow standardized protocol:

1. **Session startup**:
   - Run `pwd` to establish working directory
   - Read progress files and git logs to understand recent work
   - Review feature list to identify next priority
   - Run init.sh and basic tests to verify environment health

2. **Incremental development**:
   - Work on single feature at a time (not entire project)
   - Maintain "clean state" appropriate for main branch merging
   - Create descriptive git commits for each change
   - Update progress files with session summary

3. **Validation protocols**:
   - End-to-end testing using browser automation tools
   - Mark features as passing only after comprehensive verification
   - Fix any broken state before implementing new features

**Key insight**: Treat multi-context agents like software engineering shifts with explicit handoff protocols.

## Lineage

**Descends from**:
- Agent frameworks (LangChain, AutoGPT)
- Multi-agent systems research
- Software engineering best practices (git, incremental development, testing)

**Competes with**:
- Multi-agent architectures (CrewAI, AutoGen)
- Single-loop agent systems
- Monolithic agent containers

**Complements**:
- [Managed Agents](managed-agents.md) (infrastructure-level approach)
- [Session-Based Context](session-based-context.md) (context management)

## Evidence

| Application | Model | Success Metrics | Task Complexity | Source |
|-------------|-------|-----------------|-----------------|--------|
| Web app development | Claude 4.5 | Production-quality claude.ai clone | Multi-session full-stack development | anthropic-long-running-agents-2025 |
| Feature implementation | Claude 4.5 | 200+ granular features systematically completed | Complex UI/UX requirements | anthropic-long-running-agents-2025 |
| State management | Claude Agent SDK | Clean handoffs, reduced context waste | Multi-day development cycles | anthropic-long-running-agents-2025 |
| Testing integration | Puppeteer MCP | End-to-end validation catching code-invisible bugs | Browser automation workflows | anthropic-long-running-agents-2025 |
| Code generation evaluation | Various LLMs | Multi-step agent programming tasks | Agentic workflows with tool integration | [code-as-agent-harness-2026](../source/code-as-agent-harness-2026.md) |

## Caveats & failure modes

- **Domain limitation**: Optimized for coding tasks - generalization to other domains uncertain
- **Manual decomposition**: Still requires human insight for initial feature breakdown
- **Testing tool gaps**: Browser automation has limitations (e.g., native alert modals invisible to Puppeteer)
- **Model dependency**: Designed specifically for Claude 4.5/Agent SDK - transfer unclear
- **Scale uncertainty**: Performance on larger, more complex projects unknown
- **Setup overhead**: Initializer phase requires significant upfront investment vs. simple prompting

## Specific Patterns

**Feature List Structure**:
```json
{
  "category": "functional",
  "description": "New chat button creates a fresh conversation",
  "steps": [
    "Navigate to main interface",
    "Click the 'New Chat' button", 
    "Verify a new conversation is created"
  ],
  "passes": false
}
```

**Session Startup Protocol**:
1. `pwd` → establish working directory
2. Read claude-progress.txt → understand recent work
3. Read feature_list.json → identify next priority
4. `git log --oneline -20` → review commit history
5. Run init.sh → start development environment
6. Execute basic end-to-end test → verify health
7. Choose single feature for implementation

**Failure Mode Solutions**:
| Problem | Initializer Solution | Coding Agent Solution |
|---------|---------------------|----------------------|
| One-shotting | Comprehensive feature decomposition | Single feature per session |
| Premature completion | Structured pass/fail tracking | Read feature list each session |
| Broken handoffs | Git repo + progress files setup | Start with health check + git review |
| Poor testing | Feature list with test steps | Browser automation integration |

## Evolution & Advanced Patterns

**Extension to Multi-Agent Architectures**: 
- [GAN-Inspired Agent Architectures](gan-inspired-agent-architectures.md) extends this foundation with specialized generator-evaluator-planner patterns
- Adds systematic quality evaluation and iterative refinement capabilities
- Addresses self-evaluation blindness through agent role separation
- Increases complexity and cost but achieves higher output quality

**Model Evolution Impact**:
- Original approach designed for Claude Opus 4.5 with significant context anxiety
- Opus 4.6 largely resolved context anxiety, enabling simplified harness designs
- Advanced architectures can work within single sessions rather than requiring context resets

## Open questions

- How do patterns generalize beyond web development to scientific research, data analysis, etc?
- Can feature decomposition be automated rather than requiring manual breakdown?
- What's the optimal granularity for feature definitions across different domains?
- How do techniques scale to multi-week or multi-month projects?
- Can specialized agent types (testing, QA, cleanup) improve on general-purpose coding agents?
- What validation methods work for domains where browser automation isn't applicable?
- When is the cost-complexity trade-off of advanced multi-agent patterns justified?

## Sources

- [anthropic-long-running-agents-2025](../source/anthropic-long-running-agents-2025.md) - Primary methodology and case studies
- Claude 4 Prompting Guide - Multi-context window best practices referenced