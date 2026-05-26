---
type: source
source_kind: paper
date: 2025-01-14
arxiv: 
authors: [anthropic-team]
venue: transformer-circuits
status: read
confidence: high
---

# Circuit Tracing: Revealing Computational Graphs in Language Models

**Citation:** Anthropic Team. "Circuit Tracing: Revealing Computational Graphs in Language Models." Transformer Circuits Thread, 2025. [URL](https://transformer-circuits.pub/2025/attribution-graphs/methods.html) | [Local copy](../../raw/2025/anthropic/Circuit%20Tracing%20Revealing%20Computational%20Graphs%20in%20Language%20Models.md)

## Claim

Cross-layer transcoders enable attribution graph construction that reveals interpretable computational pathways in language models by replacing MLPs with linear feature interactions, achieving ~50% output fidelity while enabling mechanistic circuit discovery.

## Method

Technical methodology paper introducing attribution graphs through:

1. **Cross-Layer Transcoders (CLTs)**: Train sparse autoencoders that read from residual stream at one layer and write to all subsequent MLP outputs, creating linear feature interactions
2. **Replacement model construction**: Substitute CLT features for original MLPs while preserving attention and normalization patterns  
3. **Attribution graph generation**: Build computational graphs where nodes are features/embeddings and edges represent linear attributions
4. **Graph pruning**: Remove low-importance edges to create interpretable sparse graphs focused on target outputs
5. **Validation framework**: Perturbation experiments to test whether discovered mechanisms match original model behavior

**Key innovation**: Linear attribution becomes well-defined by freezing attention patterns and using CLT features that interact linearly.

## Results

**Technical achievements**:
- CLTs match original model outputs in ~50% of test cases
- Successfully traces computational paths for arithmetic, reasoning, and linguistic tasks
- Attribution graphs identify sparse, interpretable circuits from dense feature activations
- Validation experiments show qualitative agreement between predicted and actual perturbation effects

**Quantitative metrics**:
- 18-layer language model analysis with thousands of interpretable features
- Graph pruning reduces complexity while preserving mechanistic insights
- Computational cost estimates provided for open-weights model application
- Interactive interface enables efficient circuit exploration

**Case studies demonstrated**:
- Number addition circuits with parallel pathways
- Multi-token pattern recognition
- Cross-layer feature composition mechanisms

## What's new

- **Cross-Layer Transcoders**: Novel architecture extending sparse autoencoders to multi-layer feature interactions
- **Replacement model methodology**: Systematic approach to substituting interpretable components while maintaining model behavior
- **Linear attribution framework**: Mathematical foundation for tracing feature-to-feature causal effects
- **Scalable circuit discovery**: Methods that work on production-scale models beyond toy examples
- **Validation protocols**: Rigorous experimental framework for testing discovered mechanisms

## What I'd push on

- **Limited fidelity**: 50% output matching leaves significant gaps in model coverage
- **Computational cost**: CLT training requires substantial upfront investment compared to alternatives
- **Linear assumption**: Freezing attention and normalization may miss important nonlinear interactions
- **Indirect analysis**: Replacement model approach adds layer of interpretation that could mask true mechanisms
- **Pruning subjectivity**: Graph simplification involves human judgment calls that could introduce bias
- **Validation limitations**: Perturbation experiments show qualitative not quantitative agreement

## Touches

- [attribution-graphs](../technique/attribution-graphs.md) - Primary technique this paper introduces methodology for
- [cross-layer-transcoders](../technique/cross-layer-transcoders.md) - Novel technique enabling attribution graph construction
- [circuit-tracing](../technique/circuit-tracing.md) - General field this work advances with scalable methods
- [sparse-autoencoders](../technique/sparse-autoencoders.md) - Foundation technique extended by CLTs
- [mechanistic-interpretability](../technique/mechanistic-interpretability.md) - Research program this methodology serves
- **Related papers**: Companion biology paper applying these methods to Claude 3.5 Haiku analysis
- **Models**: 18-layer language model for methodology development, enabling Claude 3.5 Haiku analysis