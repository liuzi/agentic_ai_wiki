---
type: concept
last_updated: 2026-05-25
tags: [planning, llm-capabilities, reasoning, forward-planning, backward-planning]
---

# Planning in LLMs

The ability of language models to consider future outputs and work backwards from goals when generating text. This includes both forward planning (considering multiple future possibilities) and backward planning (working from desired outcomes).

## Types of Planning

**Forward Planning**:
- Considering multiple possible next words/tokens before choosing
- Maintaining representations of alternative continuation paths
- Planning ahead for rhyme schemes, logical structure, or narrative flow

**Backward Planning**:
- Starting with a desired outcome or target word
- Working backwards to construct appropriate lead-up text
- Goal-oriented text generation

**Hybrid Planning**:
- Combining forward and backward strategies
- Iterative refinement of plans as generation proceeds
- Dynamic adjustment based on emerging context

## Evidence in Language Models

**Claude 3.5 Haiku** (mechanistic analysis findings):
- **Poetry planning**: Given "He saw a carrot and had to grab it" → plans "rabbit" before writing second line → constructs "His hunger was like a starving rabbit"
- **Intervention validation**: Suppressing "rabbit" concept → model switches to "habit"; injecting "green" → writes sensible non-rhyming line ending in "green"
- **Multi-word lookahead**: Thinks of potential rhyming words in advance, then writes to reach planned destination
- **Factual reasoning**: Plans intermediate steps for multi-hop questions (Dallas → Texas → Austin)
- **Parallel possibilities**: Maintains multiple planned words simultaneously
- **Editable plans**: Can modify planned words and restructure accordingly

**General observations**:
- Planning appears more sophisticated in larger, more capable models
- Often occurs internally without visible traces in outputs
- May involve abstract representations not directly tied to words

## Detailed Examples

**Poetry Planning Mechanism**:
1. Input: "He saw a carrot and had to grab it,"
2. Planning phase: Model activates features for potential rhymes ("rabbit", "habit", etc.)
3. Selection: Chooses "rabbit" as target based on semantic fit
4. Construction: Writes "His hunger was like a starving rabbit" to reach planned word
5. Validation: Intervention experiments confirm causal role of planned concept

## Mechanisms

**Internal representations**:
- Features that encode planned future words (e.g., "rabbit" concept active before line construction)
- Abstract goal representations (rhyme constraint + semantic coherence)
- Constraint satisfaction between planning and execution

**Information flow**:
- Planning features influence earlier generation steps
- Backward propagation of constraints through the generation process
- Integration of forward predictions with backward goals

## Relationship to Human Planning

**Similarities**:
- Goal-oriented behavior
- Consideration of multiple options
- Working backwards from desired outcomes

**Differences**:
- May be more parallel and less sequential than human planning
- Operates at token/word level rather than higher-level concepts
- No explicit symbolic planning representation

## Applications & Implications

**Text generation quality**:
- Better coherence and structure
- More satisfying conclusions
- Improved constraint satisfaction (rhyming, logical consistency)

**AI capabilities**:
- Evidence of sophisticated internal reasoning
- Suggests models can engage in goal-oriented behavior
- Raises questions about agency and intentionality

## Open Questions

- How sophisticated can planning become in language models?
- What's the relationship between planning ability and model scale?
- Can planning be improved through specific training objectives?
- How does planning relate to other forms of reasoning and metacognition?

## Sources

- [anthropic-biology-llm-2025](../source/anthropic-biology-llm-2025.md) - Mechanistic evidence of planning in Claude 3.5 Haiku
- [anthropic-tracing-thoughts-2025](../source/anthropic-tracing-thoughts-2025.md) - Detailed poetry planning case study with interventions