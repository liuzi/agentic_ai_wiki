---
type: technique
status: active
introduced: 2023-09
last_updated: 2026-05-25
supersedes: [dictionary-learning]
superseded_by: []
competes_with: [probing, linear-probes, pca-decomposition]
tags: [interpretability, feature-discovery, unsupervised-learning, neural-decomposition]
---

# Sparse Autoencoders

## TL;DR

Sparse autoencoders (SAEs) decompose neural network activations into interpretable, sparse features that correspond to human-understandable concepts. They enable the discovery of monosemantic features in polysemantic neurons, making neural network internals more interpretable.

## Mechanism

SAEs are trained to reconstruct neural activations while enforcing sparsity:

1. **Architecture**: Encoder maps activations to sparse latent space, decoder reconstructs original activations
2. **Sparsity constraint**: L1 penalty encourages most latent features to be zero for any given input
3. **Overcompleteness**: Use more latent features than input dimensions to allow specialization
4. **Training objective**: Minimize reconstruction loss + sparsity penalty

$$\mathcal{L} = ||x - \text{Dec}(\text{Enc}(x))||_2^2 + \lambda||\text{Enc}(x)||_1$$

Where $x$ is the neural activation, $\lambda$ controls sparsity level.

**Key insight**: Forces the model to decompose polysemantic neurons into multiple monosemantic features, each active for specific concepts.

## Lineage

**Descends from**:
- Dictionary learning methods from signal processing
- Classic autoencoders and sparse coding
- Mechanistic interpretability research program

**Enables**:
- Attribution graphs and circuit analysis
- Feature visualization and steering
- Monosemantic feature discovery

**Competes with**:
- Linear probing (less interpretable)
- PCA decomposition (not sparse)
- Manual neuron analysis (not scalable)

## Evidence

| Benchmark | Model | Features Found | Interpretability | Source |
|-----------|-------|----------------|------------------|--------|
| Claude 3 Sonnet | 400M parameters | 16M interpretable | High monosemanticity | Scaling Monosemanticity (2024) |
| GPT-4 layers | Various layers | Thousands | Concept-specific | Dictionary Learning (2023) |
| Claude 3.5 Haiku | Production model | Cross-layer features | Attribution-ready | anthropic-biology-llm-2025 |

## Caveats & failure modes

- **Reconstruction quality**: Trade-off between sparsity and faithful reconstruction
- **Feature completeness**: May miss important features not captured by sparsity prior
- **Hyperparameter sensitivity**: Sparsity penalty $\lambda$ requires careful tuning
- **Computational cost**: Training large SAEs on big models is expensive
- **Polysemanticity residue**: Some features may still be polysemantic despite sparsity
- **Context dependence**: Feature interpretations may vary across different input contexts

## Open questions

- How to optimally set sparsity levels for different layers and model sizes?
- Can SAEs capture all important features or do they miss crucial polysemantic information?
- How do SAE features relate to the model's actual computational mechanisms?
- Can we train SAEs that are both highly interpretable and faithful reconstructions?

## Sources

- Scaling Monosemanticity (Templeton et al. 2024) - Large-scale SAE application
- Dictionary Learning for Interpretability (Cunningham et al. 2023) - Foundational work
- [anthropic-biology-llm-2025](../source/anthropic-biology-llm-2025.md) - SAEs enable attribution graphs