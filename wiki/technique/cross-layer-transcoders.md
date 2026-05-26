---
type: technique
status: active
introduced: 2024-12
last_updated: 2026-05-25
supersedes: [sparse-autoencoders]
superseded_by: []
competes_with: [per-layer-transcoders, direct-neuron-analysis]
tags: [interpretability, dictionary-learning, circuit-analysis, mechanistic-interpretability]
---

# Cross-Layer Transcoders

## TL;DR

Cross-layer transcoders (CLTs) extend sparse autoencoders to learn interpretable features that read from one layer's residual stream and write to all subsequent MLP outputs. This creates linear feature interactions that enable attribution graph construction for circuit discovery in language models.

## Mechanism

CLTs build on sparse autoencoder dictionary learning with key architectural changes:

1. **Cross-layer architecture**: Features read from residual stream at layer L and contribute to MLP outputs at layers L+1 through final layer
2. **Linear feature interactions**: Within the replacement model, features interact linearly (no ReLU between feature-to-feature connections)
3. **Sparse activation**: Features activate sparsely like SAEs, but with broader influence across model depth
4. **Output preservation**: Trained to match original model outputs while maintaining interpretability

**Mathematical formulation**:
- Feature $f_i$ reads from residual stream: $f_i = \text{ReLU}(W_{\text{enc},i} \cdot x_L + b_i)$
- Features write to MLP outputs: $\text{MLP}_j = \sum_i W_{\text{dec},i,j} \cdot f_i$ for layers $j > L$
- Linear attribution: $\frac{\partial \text{output}}{\partial f_i}$ is well-defined due to linear composition

**Training objectives**:
- Reconstruction loss: Match original MLP outputs across all layers
- Sparsity penalty: L1 regularization on feature activations  
- Feature diversity: Encourage different features to capture distinct concepts

## Lineage

**Descends from**:
- Sparse autoencoders (Olshausen & Field 1996, modern: Bricken et al. 2023)
- Dictionary learning for neural interpretability
- Transcoder architectures (Lindsey et al. 2024)
- Mechanistic interpretability research program

**Competes with**:
- Per-layer transcoders (simpler but less circuit-friendly)
- Direct neuron analysis (less interpretable)
- Activation patching methods (less scalable)

**Enables**:
- Attribution graphs for circuit discovery
- Linear feature attribution analysis
- Scalable mechanistic interpretability
- Replacement model construction

## Evidence

| Metric | Model | Performance | Scale | Source |
|--------|-------|-------------|-------|--------|
| Output fidelity | 18-layer LM | ~50% cases match exactly | Thousands of features | anthropic-circuit-tracing-2025 |
| Circuit discovery | 18-layer LM | Multiple arithmetic/reasoning circuits | Multi-layer attribution | anthropic-circuit-tracing-2025 |
| Feature interpretability | Claude 3.5 Haiku | High-quality concept features | Production model | anthropic-biology-llm-2025 |
| Computational efficiency | Open weights | Cost estimates provided | Scalable to large models | anthropic-circuit-tracing-2025 |

## Caveats & failure modes

- **Limited fidelity**: Only ~50% output matching leaves significant model behavior unexplained
- **High computational cost**: CLT training requires substantial upfront investment vs. alternatives
- **Linear assumption**: Assumes linear feature interactions which may miss important nonlinearities
- **Replacement model gap**: Indirect analysis through proxy model may not capture true mechanisms
- **Feature interference**: Global weights can be less interpretable due to feature interactions
- **Training complexity**: Requires careful hyperparameter tuning across multiple layers
- **Scalability limits**: Unclear how training costs scale to frontier model sizes

## Specific Applications

**Attribution Graph Construction**:
- CLT features serve as interpretable nodes in computational graphs
- Linear interactions enable well-defined edge weights between features
- Supports automatic circuit discovery and visualization

**Circuit Discovery**:
- Number addition: Parallel computation pathways for precise and approximate calculation
- Multi-hop reasoning: Chained feature activations across reasoning steps
- Pattern recognition: Cross-layer feature composition for complex pattern matching

**Model Analysis**:
- Replacement model enables controlled perturbation experiments
- Feature-level interventions for causal mechanism validation
- Comparative analysis between original and interpretable models

## Open questions

- How can output fidelity be improved beyond 50% while maintaining interpretability?
- What determines when CLTs successfully capture vs. miss important mechanisms?
- How do training costs scale to models larger than 18 layers?
- Can CLT architectures be adapted for other model components (attention, embeddings)?
- What's the relationship between feature quality and attribution graph utility?
- How sensitive are results to CLT training hyperparameters and initialization?

## Sources

- [anthropic-circuit-tracing-2025](../source/anthropic-circuit-tracing-2025.md) - Primary introduction and technical methodology
- [anthropic-biology-llm-2025](../source/anthropic-biology-llm-2025.md) - Application to Claude 3.5 Haiku analysis
- Sparse Crosscoders for Cross-Layer Features (Lindsey et al. 2024) - Foundational transcoder work