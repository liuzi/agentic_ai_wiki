---
type: concept
last_updated: 2026-05-26
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

## Manifestations

**In long-running agents**:
- **One-shotting**: Attempting to complete entire complex projects in single session to avoid context breaks
- **Premature completion**: Declaring tasks finished when only partial progress has been made
- **Context waste**: Spending tokens re-establishing basic understanding that should persist across sessions

**General patterns**:
- Rushed conclusions when approaching perceived context limits
- Abbreviated outputs despite available context space
- Avoidance of multi-step processes that might require continuation

## Model Evolution

**Claude Opus 4.5**: Exhibited strong context anxiety requiring context resets and specialized harness design to maintain coherent long-running performance

**Claude Opus 4.6**: Largely resolved context anxiety behaviors, enabling:
- Single-session multi-hour coherent development
- Simplified harness architectures without mandatory context resets
- Reduced need for sprint decomposition structures
- More reliable sustained task performance at context limits

**Impact on Harness Design**: Model improvements reduced the load-bearing nature of context anxiety mitigation techniques, allowing developers to focus harness complexity on other quality improvements rather than basic coherence maintenance.

## Related Techniques

Techniques that address or work around context anxiety:

- [session-based-context](../technique/session-based-context.md) - External context storage
- [managed-agents](../technique/managed-agents.md) - System that originally addressed this in Claude Sonnet 4.5  
- [long-running-agent-harnesses](../technique/long-running-agent-harnesses.md) - Dual-agent architecture preventing one-shotting and premature completion
- [gan-inspired-agent-architectures](../technique/gan-inspired-agent-architectures.md) - Advanced multi-agent patterns that benefit from reduced context anxiety in newer models
- [context-compaction](../technique/context-compaction.md) - Summarization to reduce context pressure

## Related Concepts

- [context-engineering](../concept/context-engineering.md)
- [long-horizon-tasks](../concept/long-horizon-tasks.md)