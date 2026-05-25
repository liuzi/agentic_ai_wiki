---
type: concept
last_updated: 2026-05-25
tags: [reasoning, cognition, llm-capabilities, chain-of-thought]
---

# Multi-Step Reasoning

The ability of language models to perform intermediate reasoning steps internally, often without explicitly showing these steps in their outputs. This encompasses both visible chain-of-thought reasoning and hidden internal computation steps.

## Forms of Multi-Step Reasoning

**Explicit (Chain-of-Thought)**:
- Step-by-step reasoning shown in model outputs
- Deliberate breakdown of complex problems
- Intermediate results displayed to user

**Implicit (Internal)**:
- Reasoning steps performed "in the model's head"
- Not visible in final outputs
- Detected through mechanistic interpretability methods

**Hybrid**:
- Combination of visible and hidden reasoning
- Some steps shown, others internal
- May involve planning future visible steps internally

## Evidence in Large Models

**Claude 3.5 Haiku** (from mechanistic analysis):
- **Factual reasoning**: Question "What is the capital of the state where Dallas is located?" → first activates "Dallas is in Texas" → then "capital of Texas is Austin"
- **Mental arithmetic**: 36+59 uses parallel pathways - rough approximation + precise last-digit calculation, not sequential algorithm
- **Reasoning validation**: Can distinguish faithful vs. unfaithful reasoning by presence/absence of intermediate calculation features
- **Combination over memorization**: Combines independent facts rather than regurgitating memorized question-answer pairs
- Internal reasoning often more sophisticated than visible outputs

**General observations**:
- Larger models show more sophisticated internal reasoning
- Reasoning steps may be abstract and not human-interpretable
- Models can reason about their own reasoning (metacognition)

## Related Concepts

- **Chain-of-thought prompting**: Technique to elicit explicit reasoning
- **Planning**: Forward and backward reasoning about future actions
- **Metacognition**: Reasoning about one's own knowledge and capabilities
- **Implicit reasoning**: Internal computation not reflected in outputs

## Specific Examples

**Dallas → Texas → Austin**:
- Input: "What is the capital of the state where Dallas is located?"
- Step 1: Feature activation for "Dallas is in Texas" 
- Step 2: Feature activation for "capital of Texas is Austin"
- Validation: Intervention changing "Texas" to "California" → output changes to "Sacramento"

**Mental Math (36+59)**:
- Parallel computation pathways rather than sequential algorithm
- One pathway: rough approximation of total
- Another pathway: precise calculation of last digit
- Integration of both for final answer (95)

**Motivated vs. Faithful Reasoning**:
- Faithful: Computing √0.64 shows intermediate √64 calculation features
- Unfaithful: Computing cos(large number) shows no calculation features despite claiming to compute

## Open Questions

- How reliable is internal multi-step reasoning compared to explicit reasoning?
- Can models be trained to make internal reasoning more explicit?
- What's the relationship between reasoning depth and model scale?
- How do we evaluate the quality of internal reasoning steps?
- What determines when reasoning becomes motivated vs. faithful?

## Sources

- [anthropic-biology-llm-2025](../source/anthropic-biology-llm-2025.md) - Evidence of internal multi-step reasoning in Claude 3.5 Haiku
- [anthropic-tracing-thoughts-2025](../source/anthropic-tracing-thoughts-2025.md) - Detailed case studies and intervention experiments