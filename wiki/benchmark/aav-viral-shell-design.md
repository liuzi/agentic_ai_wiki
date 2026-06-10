---
type: benchmark
status: active
introduced: 2026
last_updated: 2026-06-10
domain: computational-biology
---

# AAV Viral Shell Design

## What it measures

AAV (adeno-associated virus) viral shell design benchmark evaluates AI models' ability to predict how genetic modifications impact the assembly properties of viral outer shells. This tests biological reasoning capabilities on therapeutically-relevant but unpublished experimental data from gene therapy research.

## Methodology

Developed using unpublished candidates from Dyno Therapeutics, this benchmark tests models on predicting experimental properties of viral shells without explicit training on viral design tasks. Models are evaluated on their ability to predict viral shell assembly - described as "the simplest viral trait to predict" but nonetheless important for designing more complex viral features.

The benchmark is particularly notable because:
- Uses real experimental data rather than simulated scenarios
- Tests emergent biological reasoning capabilities (models not trained specifically for this task)
- Focuses on dual-use capabilities relevant to both gene therapy and potential biosecurity concerns

## Known flaws and contamination concerns

- **Limited scope**: Viral shell assembly is acknowledged as the "simplest" viral design task
- **Dual-use nature**: Same capabilities useful for beneficial gene therapy and potentially harmful viral design
- **Small dataset**: Based on unpublished candidates from single company (Dyno Therapeutics)
- **Evaluation metrics unclear**: Specific scoring methodology not disclosed in available sources

## Current leaderboard (Top 5)

| Rank | Model Type | Performance | Date | Source |
|------|------------|-------------|------|--------|
| 1 | Mythos-class models | Outperformed protein language models | 2026-06 | [anthropic-fable-5-mythos-5-2026](../source/anthropic-fable-5-mythos-5-2026.md) |
| 2 | Dedicated protein language models | Lower than Mythos-class | 2026-06 | [anthropic-fable-5-mythos-5-2026](../source/anthropic-fable-5-mythos-5-2026.md) |
| 3-5 | Other AI models | Lower performance | 2026-06 | [anthropic-fable-5-mythos-5-2026](../source/anthropic-fable-5-mythos-5-2026.md) |

*Note: Specific model names and numerical scores not disclosed*

## What a meaningful delta looks like

Given the biological complexity and dual-use implications:
- **Predictive accuracy**: Better correlation with experimental results on viral shell properties
- **Generalization**: Performance across different viral types and modifications
- **Reasoning depth**: Understanding of underlying biological mechanisms rather than pattern matching
- **Safety considerations**: Ability to distinguish beneficial vs. potentially harmful applications

The benchmark's significance lies in demonstrating emergent biological reasoning capabilities that weren't explicitly trained for, suggesting broader biological understanding.

## Sources

- [Anthropic Fable 5 and Mythos 5](../source/anthropic-fable-5-mythos-5-2026.md) — Mythos-class models outperforming specialized protein models on viral design prediction