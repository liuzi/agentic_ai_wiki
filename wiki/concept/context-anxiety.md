---
type: concept
last_updated: 2026-05-25
tags: [context-limits, agent-behavior, claude]
---

# Context Anxiety

## Definition

A behavioral pattern observed in some language models where they prematurely conclude tasks or reduce output quality when sensing their context limit is approaching, even when the task could be completed within the available context.

## Disambiguation

Distinct from:
- **Context overflow** - actual exceeding of context limits
- **Task completion** - legitimate finishing when work is done  
- **Performance degradation** - general quality decline at context limits

Context anxiety specifically refers to premature task termination due to *anticipated* rather than actual context exhaustion.

## Related Techniques

Techniques that address or work around context anxiety:

- [session-based-context](../technique/session-based-context.md) - External context storage
- [managed-agents](../technique/managed-agents.md) - System that originally addressed this in Claude Sonnet 4.5
- [context-compaction](../technique/context-compaction.md) - Summarization to reduce context pressure

## Related Concepts

- [context-engineering](../concept/context-engineering.md)
- [long-horizon-tasks](../concept/long-horizon-tasks.md)