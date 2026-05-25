---
type: question
asked: 2026-05-25
last_updated: 2026-05-25
status: open
tags: [rlhf, post-training, optimization]
---

# Is the RL stage in RLHF actually necessary?

## The Question

Can we achieve the same alignment benefits as RLHF without the complex and unstable reinforcement learning optimization stage?

## Why It Matters

The RL stage (typically PPO) in RLHF is notoriously difficult to tune, computationally expensive, and prone to instability. If we can eliminate it while preserving benefits, we could make alignment techniques more accessible and reliable.

## Current Evidence

Mixed evidence from recent techniques:

- [Direct Preference Optimization](../technique/direct-preference-optimization.md) claims to achieve similar results without RL
- [RLOO](../technique/rloo.md) shows simpler RL methods can work as well as PPO
- Some evidence that much of RLHF's benefit comes from better SFT data, not RL stage

## Relevant Work

Techniques exploring this question:

- [direct-preference-optimization](../technique/direct-preference-optimization.md)
- [self-rewarding-language-models](../technique/self-rewarding-language-models.md)
- [constitutional-ai](../technique/constitutional-ai.md)

## Updates

### 2026-05-25
Question added to track this important open problem in post-training optimization.