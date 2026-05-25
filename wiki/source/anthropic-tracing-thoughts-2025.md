---
type: source
source_kind: blog
date: 2025-01-14
arxiv: 
authors: [anthropic-team]
venue: anthropic-blog
status: read
confidence: high
---

# Tracing the thoughts of a large language model

**Authors**: Anthropic Team  
**Venue**: Anthropic Blog  
**Date**: 2025-01-14  
**URL**: https://www.anthropic.com/research/tracing-thoughts-language-model  
**Local copy**: [raw/2025/anthropic/Tracing the thoughts of a large language model.md](../../raw/2025/anthropic/Tracing%20the%20thoughts%20of%20a%20large%20language%20model.md)

## Claim

Attribution graphs reveal sophisticated internal mechanisms in Claude including universal language-of-thought, multi-word planning, and motivated reasoning that operate beyond what's visible in the model's external outputs.

## Method

Popular science presentation of attribution graph methodology applied to Claude 3.5 Haiku through detailed case studies. Demonstrates interpretability techniques using:

- Attribution graphs to trace computational pathways between interpretable features
- Intervention experiments to validate hypothesized mechanisms (suppressing/injecting concepts)
- Cross-linguistic analysis to reveal shared conceptual representations
- Multi-step reasoning analysis across diverse domains (math, poetry, factual QA)

## Results

**Ten key case studies revealing internal mechanisms:**

1. **Multilingual processing**: Same core features activate across languages for concepts like "opposite of small" → "large", suggesting universal conceptual space
2. **Poetry planning**: Claude plans target rhyme words before writing lines, then constructs text to reach planned endings
3. **Mental math**: Parallel computation pathways - rough approximation + precise last-digit calculation
4. **Reasoning faithfulness**: Can distinguish faithful vs. motivated reasoning by presence/absence of intermediate calculation features
5. **Multi-step reasoning**: Combines independent facts (Dallas → Texas → Austin) rather than memorizing complete chains
6. **Hallucination mechanism**: Default refusal circuit suppressed by "known entity" features; misfires cause hallucinations
7. **Jailbreak dynamics**: Grammatical coherence features override safety mechanisms mid-sentence
8. **Cross-domain generalization**: Addition features reused across mathematical contexts
9. **Knowledge boundaries**: Metacognitive awareness of knowledge limitations in some contexts
10. **Planning horizons**: Evidence of multi-word lookahead in various completion tasks

**Key quantitative findings:**
- Claude 3.5 Haiku shares 2x more features between languages vs. smaller models
- ~25% prompt success rate for attribution graph insights
- Intervention experiments successfully redirect outputs by modifying intermediate concepts

## What's new

- **Accessible presentation**: Translates technical attribution graph methodology into concrete, visual case studies
- **Intervention demonstrations**: Shows how suppressing "rabbit" concept changes poetry completion from "rabbit" to "habit"
- **Mechanistic detail**: Provides step-by-step tracing of specific reasoning processes (e.g. Dallas→Texas→Austin)
- **Failure mode analysis**: Concrete examples of when and how reasoning becomes unfaithful
- **Scale evidence**: Demonstrates sophistication increases with model scale (Haiku vs. smaller models)

## What I'd push on

- **Success rate limitations**: 25% insight rate leaves most prompts unexplained
- **Popularization risks**: Accessible presentation may overstate confidence in mechanistic claims
- **Intervention artifacts**: Unclear whether intervention experiments reveal true mechanisms or create artificial behaviors
- **Generalization uncertainty**: Case studies are existence proofs but unclear how representative they are
- **Causal vs. correlational**: Attribution graphs show feature correlations but causal claims remain tentative

## Touches

- [attribution-graphs](../technique/attribution-graphs.md) - Primary methodology demonstrated through case studies
- [mechanistic-interpretability](../technique/mechanistic-interpretability.md) - Research program this advances
- [sparse-autoencoders](../technique/sparse-autoencoders.md) - Enables feature discovery underlying attribution graphs
- [circuit-tracing](../technique/circuit-tracing.md) - General approach extended by attribution graphs
- [multi-step-reasoning](../concept/multi-step-reasoning.md) - Evidence for internal reasoning steps
- [planning-in-llms](../concept/planning-in-llms.md) - Forward/backward planning mechanisms revealed
- [metacognition](../concept/metacognition.md) - Primitive metacognitive circuits discovered
- **Models**: Claude 3.5 Haiku primary subject, comparisons with smaller models
- **Papers**: References technical papers on attribution graph methods and biology findings