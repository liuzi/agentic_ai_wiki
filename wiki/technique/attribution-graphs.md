---
type: technique
status: active
introduced: 2025-01
last_updated: 2026-05-25
supersedes: []
superseded_by: []
competes_with: [activation-patching, causal-tracing, probing]
tags: [interpretability, circuit-analysis, mechanistic-interpretability, llm-internals]
---

# Attribution Graphs

## TL;DR

Attribution graphs trace computational pathways between interpretable features in language models to create "wiring diagrams" of how models transform inputs to outputs. They extend circuit analysis to production-scale models, revealing sophisticated internal mechanisms like multi-step reasoning and planning not visible in model outputs.

## Mechanism

Attribution graphs combine interpretable feature discovery with linear attribution analysis:

1. **Replacement Model**: Train cross-layer transcoders (CLTs) to create interpretable proxy model where features read from one layer and contribute to all subsequent MLP outputs, enabling linear feature interactions

2. **Feature Discovery**: CLT training discovers interpretable features that activate for specific concepts while maintaining ~50% output fidelity with original model

3. **Attribution Mapping**: For a given prompt, compute linear attribution scores between features using well-defined gradients in the replacement model

4. **Graph Construction**: Build directed graph where nodes are CLT features, embeddings, and output logits; edges represent linear causal effects with weights proportional to attribution strength

5. **Pruning & Visualization**: Apply automated pruning to identify edges/nodes most important for target outputs, creating sparse interpretable circuits

6. **Validation**: Test discovered mechanisms through perturbation experiments - modify feature activations and verify predicted vs. actual effects on model outputs

**Key innovation**: Unlike previous circuit analysis limited to toy models, attribution graphs scale to production models through cross-layer transcoders that create linear feature interactions amenable to principled attribution analysis.

## Lineage

**Descends from**:
- Cross-layer transcoders (Lindsey et al. 2024, anthropic-circuit-tracing-2025)
- Sparse autoencoders (Bricken et al. 2023, Templeton et al. 2024)
- Circuit analysis (Olah et al., Elhage et al.)
- Activation patching and causal tracing methods
- Mathematical framework for transformer circuits (Elhage et al. 2021)

**Competes with**:
- Direct activation patching (limited scalability)
- Probing methods (less causal insight)
- Traditional circuit analysis (limited to smaller models)

**Enables**:
- Mechanistic analysis of production-scale models
- Discovery of sophisticated reasoning mechanisms
- Validation of internal vs. external reasoning alignment

## Evidence

| Benchmark | Model | Success Rate | Scale | Source |
|-----------|-------|--------------|-------|--------|
| Prompt interpretability | Claude 3.5 Haiku | ~25% satisfying insights | Production model | anthropic-biology-llm-2025 |
| Multi-step reasoning detection | Claude 3.5 Haiku | Multiple case studies | 8B parameters | anthropic-biology-llm-2025 |
| Planning mechanism discovery | Claude 3.5 Haiku | Forward/backward planning | Poetry, factual QA | anthropic-biology-llm-2025 |
| Cross-domain generalization | Claude 3.5 Haiku | Addition features generalize | Math contexts | anthropic-biology-llm-2025 |
| Intervention experiments | Claude 3.5 Haiku | Successful concept manipulation | Poetry, factual QA | anthropic-tracing-thoughts-2025 |
| Multilingual analysis | Claude 3.5 Haiku | 2x shared features vs. smaller models | Cross-linguistic | anthropic-tracing-thoughts-2025 |
| Hallucination mechanism | Claude 3.5 Haiku | Default refusal circuit identified | Knowledge boundaries | anthropic-tracing-thoughts-2025 |

## Caveats & failure modes

- **Limited success rate**: Only ~25% of prompts yield satisfying mechanistic insights
- **Approximation limitations**: Attribution graphs are simplified representations of true mechanisms, filtered through interpretable "replacement model"
- **Validation challenges**: Intervention experiments provide some validation but causal claims remain tentative
- **Computational cost**: Requires training large sparse autoencoders and extensive graph computation
- **Interpretation subjectivity**: Feature labeling and graph simplification involve subjective choices
- **Coverage gaps**: May miss important mechanisms not captured by SAE features

## Demonstrated Applications

**Poetry Planning**:
- Traced how Claude plans "rabbit" before writing rhyming line
- Intervention: suppressing "rabbit" → output switches to "habit"
- Injection: adding "green" concept → non-rhyming but sensible line

**Multilingual Processing**:
- Same features activate for "opposite of small" across English, French, Chinese
- Evidence of universal conceptual space before language-specific translation
- Shared circuitry increases with model scale

**Hallucination Mechanism**:
- Default "can't answer" circuit normally active
- "Known entity" features suppress default when confident
- Misfires cause hallucination (e.g., inventing facts about "Michael Batkin")

**Jailbreak Analysis**:
- Tracks tension between grammatical coherence and safety mechanisms
- Shows how model detects harmful requests but continues for grammatical completion
- Reveals pivot point where refusal finally activates

## Open questions

- What determines when attribution graphs succeed vs. fail to provide insight?
- How complete are the mechanisms revealed compared to the model's full computational process?
- Can attribution methods scale to even larger models and more complex reasoning?
- How to improve success rates and reduce computational requirements?
- What's the relationship between SAE feature quality and attribution graph utility?
- How to distinguish genuine mechanisms from intervention artifacts?

## Sources

- [anthropic-circuit-tracing-2025](../source/anthropic-circuit-tracing-2025.md) - Technical methodology and validation framework
- [anthropic-biology-llm-2025](../source/anthropic-biology-llm-2025.md) - Application to Claude 3.5 Haiku analysis
- [anthropic-tracing-thoughts-2025](../source/anthropic-tracing-thoughts-2025.md) - Accessible presentation with intervention demonstrations