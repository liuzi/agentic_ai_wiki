---
type: technique
status: active
introduced: 2026-05
last_updated: 2026-05-25
supersedes: [monolithic-agent-containers]
superseded_by: []
competes_with: [langchain-agents, crewai, autogen, long-running-agent-harnesses]
tags: [agents, infrastructure, reliability, scalability]
---

# Managed Agents

## TL;DR

Managed Agents is Anthropic's approach to building reliable, long-horizon AI agents by decoupling the "brain" (Claude + harness) from "hands" (execution environments) and "session" (persistent state). Uses OS-style virtualization to make agent components independently scalable and recoverable.

## Mechanism

Three core components with clean interfaces:

1. **Session** - append-only event log stored durably outside the harness
   - Interface: `getEvents()` for selective context access
   - Interface: `emitEvent(id, event)` for recording actions
   - Survives harness crashes and enables recovery

2. **Harness** - stateless orchestrator that calls Claude and routes tool calls  
   - Interface: `wake(sessionId)` to resume from crash
   - Becomes "cattle" not "pets" - easily replaceable
   - No persistent state, pulls context from session

3. **Sandbox** - execution environment provisioned on-demand
   - Interface: `execute(name, input) → string` 
   - Interface: `provision({resources})` for initialization
   - Isolated from credentials for security

The key insight is treating each component as a service with narrow interfaces, allowing independent failure and replacement.

## Lineage

Builds on decades of OS design principles (process virtualization, hardware abstraction). Direct response to problems with monolithic agent architectures where everything lived in one container. Influenced by "pets vs. cattle" infrastructure patterns from cloud computing.

## Evidence

| Metric | Before (Monolithic) | After (Managed) | Scale | Source |
|--------|-------------------|-----------------|-------|--------|
| TTFT p50 | Baseline | ~60% reduction | Production | [anthropic-managed-agents-2026](../source/anthropic-managed-agents-2026.md) |
| TTFT p95 | Baseline | >90% reduction | Production | [anthropic-managed-agents-2026](../source/anthropic-managed-agents-2026.md) |

## Caveats & Failure Modes

- **Increased complexity**: More moving parts to coordinate
- **Network dependencies**: Service boundaries introduce latency and failure points  
- **Context reconstruction costs**: Session replay may be expensive for very long sessions
- **Interface overhead**: Abstraction layers add computational cost

## Related Approaches

**Complementary techniques**:
- [Long-Running Agent Harnesses](long-running-agent-harnesses.md) - Workflow patterns for multi-session agent continuity using dual-agent architecture
- [Session-Based Context](session-based-context.md) - External context storage mechanisms

**Comparison**: Managed Agents focuses on infrastructure-level decomposition (brain/hands/session) while long-running harnesses address workflow patterns (initializer/coding agents). The approaches are complementary - managed agents provide the infrastructure substrate while harnesses provide the operational patterns.

## Open Questions

- How does session storage scale to extremely long-horizon tasks (weeks/months)?
- What are the optimal strategies for context selection from session logs?
- How do managed agent components integrate with specialized workflow patterns like dual-agent harnesses?
- How do failure modes change when scaling to hundreds of concurrent brains/hands?
- Can the interface abstractions accommodate future agent architectures we haven't imagined?

## Sources

- [anthropic-managed-agents-2026](../source/anthropic-managed-agents-2026.md)