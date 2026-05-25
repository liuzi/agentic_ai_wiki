---
type: source
source_kind: paper
date: 2025-01-14
arxiv: 
authors: [templeton-a, conerly-t, marcus-j, lindsey-j, bricken-t, chen-b, pearce-a, citro-c, ameisen-e, jones-a, cunningham-h, turner-n, mcdougall-c, macdiarmid-m, freeman-c, sumers-t, rees-e, batson-j, jermyn-a, carter-s, olah-c, henighan-t]
venue: transformer-circuits
status: read
confidence: high
---

# On the Biology of a Large Language Model

**Authors**: A. Templeton, T. Conerly, J. Marcus, J. Lindsey, T. Bricken, B. Chen, A. Pearce, C. Citro, E. Ameisen, A. Jones, H. Cunningham, N.L. Turner, C. McDougall, M. MacDiarmid, C.D. Freeman, T.R. Sumers, E. Rees, J. Batson, A. Jermyn, S. Carter, C. Olah, T. Henighan  
**Venue**: Transformer Circuits Thread  
**Date**: 2025-01-14  
**URL**: https://transformer-circuits.pub/2025/attribution-graphs/biology.html  
**Local copy**: [raw/2025/anthropic/On the Biology of a Large Language Model.md](../../raw/2025/anthropic/On%20the%20Biology%20of%20a%20Large%20Language%20Model.md)

## Claim

Attribution graphs can reveal sophisticated internal mechanisms in Claude 3.5 Haiku including multi-step reasoning, forward/backward planning, and primitive metacognitive circuits that operate beyond what's visible in the model's outputs.

## Method

Applied circuit tracing methodology using attribution graphs to Claude 3.5 Haiku. Attribution graphs trace computation paths between interpretable features discovered via sparse autoencoders, creating "wiring diagrams" of how the model transforms inputs to outputs. Methodology includes:

- Feature discovery using sparse autoencoders trained on model activations
- Attribution graph construction to map feature interactions across layers
- Intervention experiments to validate hypothesized mechanisms
- Case study analysis across diverse prompts and domains

## Results

**Key mechanisms discovered:**
- **Multi-step reasoning**: Model performs intermediate reasoning steps not visible in outputs
- **Forward planning**: Considers multiple future word possibilities well in advance
- **Backward planning**: Works backwards from target words to construct appropriate lead-up text
- **Metacognitive circuits**: Shows awareness of own knowledge limitations in some contexts
- **Abstract generalization**: Same computational mechanisms reused across different domains (e.g., addition features work in various mathematical contexts)
- **Multilingual abstraction**: Language-agnostic representations in middle layers, with English as privileged default

**Specific findings:**
- Addition: Uses lookup table features for memorized addition facts, parallel rough/precise computation pathways
- Rhyming: Plans target rhyme words then works backward to construct lines
- Multilingual: Higher generalization in Claude 3.5 Haiku vs smaller models, especially for non-shared alphabets
- Safety: Harmful request detection aggregates concepts learned in pretraining into fine-tuning abstractions

**Limitations**: Attribution graphs provide insight for ~25% of prompts tried. Results are hypotheses about mechanisms, validated through intervention experiments.

## What's new

- **Scale**: First detailed mechanistic analysis of a frontier production model (Claude 3.5 Haiku) 
- **Sophistication**: Evidence of internal planning, reasoning, and metacognitive capabilities not visible in outputs
- **Methodology**: Attribution graphs as new technique for tracing feature interactions in large models
- **Generalization**: Concrete evidence of abstract computational mechanisms that generalize across domains

## What I'd push on

- **Success rate**: Only ~25% of prompts yield satisfying insights - unclear what determines success/failure
- **Completeness**: Attribution graphs are acknowledged simplifications of true mechanisms
- **Causality**: Intervention experiments provide some validation but causal claims remain tentative
- **Generalization**: Case studies are existence proofs but unclear how broadly these mechanisms apply
- **Replacement model bias**: Results filtered through interpretable "replacement model" that may miss important details

## Touches

- [attribution-graphs](../technique/attribution-graphs.md) - Core technique introduced
- [sparse-autoencoders](../technique/sparse-autoencoders.md) - Enables feature discovery for attribution graphs
- [circuit-tracing](../technique/circuit-tracing.md) - General methodology extended by attribution graphs
- [mechanistic-interpretability](../technique/mechanistic-interpretability.md) - Research program this work advances
- [multi-step-reasoning](../concept/multi-step-reasoning.md) - Evidence of internal reasoning steps
- [planning-in-llms](../concept/planning-in-llms.md) - Forward and backward planning mechanisms
- [metacognition](../concept/metacognition.md) - Primitive metacognitive circuits discovered
- **Models**: Claude 3.5 Haiku analysis, comparison with smaller models