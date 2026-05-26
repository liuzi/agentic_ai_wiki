---
type: technique
status: active
introduced: 2021-12
last_updated: 2026-05-25
supersedes: [activation-patching]
superseded_by: []
competes_with: [probing, causal-intervention, gradient-attribution]
tags: [interpretability, causality, circuit-analysis, mechanistic-interpretability]
---

# Circuit Tracing

## TL;DR

Circuit tracing maps computational pathways in neural networks by identifying which components causally contribute to specific outputs. It reveals the "circuits" - connected computational subgraphs - that implement particular capabilities or behaviors in models.

## Mechanism

Circuit tracing combines feature identification with causal analysis:

1. **Component identification**: Identify relevant neurons, attention heads, or features using interpretability methods
2. **Path tracing**: Map information flow between components across layers
3. **Causal validation**: Use interventions (ablation, activation patching) to test causal relationships
4. **Circuit extraction**: Isolate minimal subgraphs sufficient for the behavior

**Core techniques**:
- **Activation patching**: Replace activations with counterfactual values to test necessity
- **Path patching**: Trace specific information paths through the network
- **Attention visualization**: Map how attention heads route information
- **Feature attribution**: Quantify how much each component contributes to outputs

**Modern extensions**:
- Attribution graphs using cross-layer transcoders for production-scale models
- Replacement model methodology with linear feature interactions
- Automated circuit discovery and validation frameworks
- Sparse autoencoder features as circuit nodes

## Lineage

**Descends from**:
- Activation patching (Vig & Belinkov 2020)
- Attention visualization (Clark et al. 2019)
- Mechanistic interpretability (Olah et al.)
- Causal intervention methods

**Enables**:
- Attribution graphs via cross-layer transcoders (Anthropic 2025)
- Linear attribution analysis for mechanistic interpretability
- Automated circuit discovery at production scale
- Model editing and steering
- Safety-relevant circuit analysis

**Competes with**:
- Gradient-based attribution (less causal)
- Probing methods (less mechanistic)
- Black-box analysis (less precise)

## Evidence

| Application | Model | Circuits Found | Validation Method | Source |
|-------------|-------|----------------|-------------------|--------|
| Induction heads | GPT-2 | In-context learning | Activation patching | Anthropic (2022) |
| IOI task | GPT-2 Small | Name resolution | Path patching | Wang et al. (2022) |
| Addition | Claude 3.5 Haiku | Multi-pathway arithmetic | Attribution graphs | anthropic-biology-llm-2025 |
| Safety refusal | Claude 3.5 Haiku | Harmful request detection | Feature intervention | anthropic-biology-llm-2025 |
| Number addition | 18-layer LM | Parallel computation pathways | Cross-layer transcoders | anthropic-circuit-tracing-2025 |
| Feature attribution | 18-layer LM | Linear feature interactions | CLT replacement model | anthropic-circuit-tracing-2025 |

## Caveats & failure modes

- **Completeness**: Circuits may be incomplete representations of true mechanisms
- **Distributed computation**: Some capabilities may not have localized circuits
- **Context dependence**: Circuits may vary based on input distribution
- **Intervention artifacts**: Patching may introduce unnatural activation patterns
- **Scale limitations**: Manual circuit tracing doesn't scale to large models
- **Causal confusion**: Correlation in activations doesn't always imply causation

## Open questions

- How complete are discovered circuits relative to the model's full computation?
- Can we automatically discover circuits without human guidance?
- How do circuits interact and compose for complex behaviors?
- What's the relationship between circuit structure and model capabilities?
- How stable are circuits across model training and different initializations?

## Sources

- A Mathematical Framework for Transformer Circuits (Elhage et al. 2021)
- Interpretability in the Wild (Wang et al. 2022) - Path patching methodology
- [anthropic-circuit-tracing-2025](../source/anthropic-circuit-tracing-2025.md) - Cross-layer transcoder methodology for attribution graphs
- [anthropic-biology-llm-2025](../source/anthropic-biology-llm-2025.md) - Attribution graphs applied to Claude 3.5 Haiku