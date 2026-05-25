---
type: source
source_kind: blog
date: 2026-05-25
authors: [martin-l, cemaj-g, cohen-m]
venue: anthropic-engineering-blog
status: read
confidence: high
---

# Scaling Managed Agents: Decoupling the brain from the hands

**Citation:** Martin, Lance et al. "Scaling Managed Agents: Decoupling the brain from the hands." Anthropic Engineering Blog, 2026. [URL](https://www.anthropic.com/engineering/managed-agents) | [Local copy](../../raw/2026/anthropic/Scaling%20Managed%20Agents%20Decoupling%20the%20brain%20from%20the%20hands.md)

## Claim

Long-horizon AI agents can be made more reliable, scalable, and secure by decoupling the "brain" (Claude + harness) from the "hands" (execution environments) and "session" (persistent state), using operating system-style virtualization.

## Method

Built Managed Agents as a hosted service with three decoupled components:
1. **Session** - append-only log of events, lives outside harness
2. **Harness** - stateless loop calling Claude, becomes "cattle" not "pets"  
3. **Sandbox** - execution environment, provisioned on-demand via tool calls

Key interfaces: `getEvents()` for context access, `execute(name, input) → string` for tool calls, `wake(sessionId)` for harness recovery.

## Results

- **TTFT improvements**: p50 dropped ~60%, p95 dropped >90% by avoiding unnecessary container provisioning
- **Reliability**: Harness and sandbox failures become recoverable tool-call errors
- **Security**: Credentials isolated from execution sandbox, preventing prompt injection attacks on tokens
- **Scalability**: Multiple brains can share hands, hands can be passed between brains

## What's New

First production system to fully decouple agent reasoning from execution using OS-style abstractions. Previous approaches coupled these components, creating "pets" that required manual nursing when they failed.

The session-as-context pattern is novel - storing full event logs outside Claude's context window and allowing programmatic access via `getEvents()` for selective context reconstruction.

## What I'd Push On

- No quantitative metrics on reliability improvements (failure rates, recovery times)
- Limited discussion of computational overhead from decoupling
- Security analysis focuses on credentials but not other attack vectors
- No comparison with alternative architectures (e.g., other agent frameworks)
- Context management strategy may not scale to very long sessions

## Touches

- [managed-agents](../technique/managed-agents.md) - Core technique introduced
- [session-based-context](../technique/session-based-context.md) - Novel context management approach  
- [meta-harness-design](../technique/meta-harness-design.md) - General design pattern
- [context-anxiety](../concept/context-anxiety.md) - Behavior observed in Claude Sonnet 4.5