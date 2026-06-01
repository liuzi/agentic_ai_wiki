---
type: technique
status: active
introduced: 2026-05
last_updated: 2026-06-01
supersedes: []
superseded_by: []
competes_with: [chain-of-thought, tree-of-thoughts]
tags: [reasoning, inference, scaling]
---

# Test-Time Compute

## TL;DR

Test-time compute scaling allocates additional computational resources during inference to improve performance on difficult tasks. Rather than training larger models, this technique uses more compute at inference time to achieve better results through extended reasoning or multiple attempts.

## Mechanism

The technique involves scaling computational resources during model inference through several possible approaches:
- **Multiple sampling**: Generate multiple candidate solutions and select the best
- **Extended reasoning chains**: Allow longer sequences of reasoning steps
- **Iterative refinement**: Multiple passes over the same problem with feedback
- **Search-based approaches**: Explore multiple solution paths before committing

The key insight is that some problems benefit more from "thinking time" than from larger model parameters, creating a different scaling axis than traditional pre-training compute.

## Lineage

**Descends from:** Chain-of-thought prompting, which showed that explicit reasoning steps improve performance on complex tasks.

**Competes with:** 
- Traditional model scaling (increasing parameters/training compute)
- Tree-of-thoughts and other structured reasoning approaches
- Few-shot learning techniques

**Related to:** The broader "System 2" thinking paradigm in AI, where deliberate reasoning supplements fast intuitive responses.

## Evidence

| Benchmark | Baseline | Test-time compute | Scale | Source |
|-----------|----------|-------------------|-------|---------|
| Erdős unit distance problem | 0% success | 48% success | 16x compute | [openai-discrete-geometry-2026](../source/openai-discrete-geometry-2026.md) |

## Caveats & Failure modes

- **Diminishing returns**: Not all problems benefit equally from additional compute time
- **Cost scaling**: Inference costs increase linearly or super-linearly with compute allocation
- **Latency trade-offs**: Additional compute time increases response latency
- **Unknown ceiling**: Unclear how performance scales beyond demonstrated ranges

## Open questions

- What types of problems benefit most from test-time compute vs. larger models?
- How does test-time compute interact with model architecture and training procedures?
- Can we predict a priori which problems will benefit from extended reasoning?
- What are the optimal allocation strategies for test-time compute budgets?

## Sources

- [OpenAI Discrete Geometry](../source/openai-discrete-geometry-2026.md) — First documented case of test-time compute scaling on mathematical reasoning