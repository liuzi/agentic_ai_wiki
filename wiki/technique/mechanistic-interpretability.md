---
type: technique
status: active
introduced: 2020-03
last_updated: 2026-05-25
supersedes: []
superseded_by: []
competes_with: [behavioral-analysis, black-box-interpretation, probing]
tags: [interpretability, reverse-engineering, neural-analysis, ai-safety]
---

# Mechanistic Interpretability

## TL;DR

Mechanistic interpretability is the research program of reverse-engineering neural networks to understand their internal algorithms and representations. It aims to build human-understandable explanations of how models compute their outputs at a mechanistic level.

## Mechanism

Mechanistic interpretability combines multiple approaches to understand model internals:

**Core principles**:
1. **Reverse engineering**: Treat models as systems to be understood mechanistically, like biological systems
2. **Circuit-level analysis**: Identify computational subgraphs that implement specific functions
3. **Feature discovery**: Find interpretable representations in activation space
4. **Causal validation**: Use interventions to test mechanistic hypotheses

**Key methodologies**:
- **Neuron analysis**: Study individual neuron activations and their semantic meanings
- **Attention visualization**: Map how attention mechanisms route information
- **Circuit tracing**: Identify computational pathways for specific capabilities
- **Feature decomposition**: Use sparse autoencoders to find monosemantic features
- **Intervention experiments**: Ablate or modify components to test causal relationships

**Levels of analysis**:
- **Features**: Individual interpretable directions in activation space
- **Circuits**: Connected subgraphs implementing specific computations
- **Algorithms**: Higher-level computational strategies used by the model

## Lineage

**Founded by**:
- Chris Olah's neural network interpretability work
- Anthropic's Transformer Circuits research
- Inspired by neuroscience and systems biology approaches

**Key developments**:
- Attention visualization (2019-2020)
- Circuit discovery in vision models (2020-2021)
- Transformer circuit analysis (2021-2022)
- Sparse autoencoders for feature discovery (2023-2024)
- Attribution graphs for large models (2025)

**Enables**:
- AI safety through understanding
- Model debugging and improvement
- Capability analysis and prediction
- Alignment research

## Evidence

| Domain | Model | Mechanisms Discovered | Method | Source |
|--------|-------|----------------------|---------|--------|
| Vision | InceptionV1 | Curve detectors, object parts | Feature visualization | Distill (2017) |
| Language | GPT-2 | Induction heads | Circuit analysis | Anthropic (2022) |
| Arithmetic | GPT-2 | Modular arithmetic | Mechanistic analysis | Neel Nanda (2023) |
| Planning | Claude 3.5 Haiku | Forward/backward planning | Attribution graphs | anthropic-biology-llm-2025 |
| Safety | Claude 3.5 Haiku | Refusal mechanisms | Circuit tracing | anthropic-biology-llm-2025 |

## Caveats & failure modes

- **Completeness**: Current methods capture only partial mechanisms
- **Scale challenges**: Techniques don't always scale to largest models
- **Interpretation subjectivity**: Feature labeling involves human interpretation
- **Computational cost**: Thorough analysis requires significant compute
- **Anthropomorphism risk**: May project human concepts onto model representations
- **Dynamic complexity**: Model behavior may depend on complex interactions not captured by static analysis

## Open questions

- How complete can mechanistic understanding become for large models?
- Can we predict capabilities from mechanistic analysis?
- How do learned algorithms in models relate to human-designed algorithms?
- What's the relationship between interpretability and model capability?
- Can mechanistic understanding enable safe AI development?

## Sources

- Zoom In: An Introduction to Circuits (Olah et al. 2020)
- A Mathematical Framework for Transformer Circuits (Elhage et al. 2021)
- [anthropic-biology-llm-2025](../source/anthropic-biology-llm-2025.md) - Large-scale mechanistic analysis