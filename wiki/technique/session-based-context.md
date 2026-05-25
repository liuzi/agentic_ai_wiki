---
type: technique
status: active
introduced: 2026-05
last_updated: 2026-05-25
supersedes: [context-compaction, memory-tools]
superseded_by: []
competes_with: [retrieval-augmented-context, external-memory-systems]
tags: [context-management, long-horizon, memory, agents]
---

# Session-Based Context Management

## TL;DR

Session-based context management stores the complete interaction history in an external, durable log that agents can selectively query to reconstruct context. Avoids irreversible decisions about what context to keep and enables recovery from arbitrary points in long conversations.

## Mechanism

Core components:

1. **Session log** - append-only, immutable record of all events
   - Stores raw tool calls, responses, and internal states
   - Persisted outside the agent's context window
   - Indexed for efficient retrieval

2. **Context reconstruction** - programmatic access to history
   - Interface: `getEvents(start, end, filter)` for selective retrieval
   - Can rewind to specific moments or replay sequences
   - Allows transformation before injection into context window

3. **Event emission** - structured logging of agent actions
   - Interface: `emitEvent(id, event)` for recording
   - Captures both successful actions and failures
   - Maintains causal ordering of events

Unlike context compaction (irreversible summarization) or memory tools (selective persistence), this preserves full fidelity while allowing flexible reconstruction.

## Lineage

Evolution beyond traditional context engineering approaches:
- Context compaction → lossy, can't recover details
- Memory tools → selective, miss implicit context  
- Session-based → lossless, programmable access

## Evidence

| Approach | Context Retention | Recovery | Overhead | Source |
|----------|------------------|----------|----------|--------|
| Compaction | Partial (summary) | Limited | Low | [anthropic-managed-agents-2026](../source/anthropic-managed-agents-2026.md) |
| Memory tools | Selective | Manual | Medium | [anthropic-managed-agents-2026](../source/anthropic-managed-agents-2026.md) |
| Session-based | Full fidelity | Arbitrary | Variable | [anthropic-managed-agents-2026](../source/anthropic-managed-agents-2026.md) |

## Caveats & Failure Modes

- **Storage costs**: Full session logs can become very large
- **Query complexity**: Agents must learn effective context selection strategies
- **Replay overhead**: Reconstructing context may require significant computation
- **Temporal locality**: Recent context often more important than distant history

## Open Questions

- What are optimal strategies for context selection from long session histories?
- How to balance full fidelity against query performance at scale?
- Can agents learn to automatically identify relevant context windows?
- How does this approach perform compared to learned memory architectures?

## Sources

- [anthropic-managed-agents-2026](../source/anthropic-managed-agents-2026.md)